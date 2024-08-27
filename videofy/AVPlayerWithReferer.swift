//
//  AVPlayerWithReferer.swift
//  videofy
//
//  Created by Prana dhika on 27/08/24.
//

import AVFoundation
import AVKit


func createPlayerWithRefererHeader(url: URL, referer: String) -> AVPlayer {
    let asset = AVURLAsset(url: url)
    asset.resourceLoader.setDelegate(ResourceLoaderDelegate(referer: referer), queue: DispatchQueue.main)
    let playerItem = AVPlayerItem(asset: asset)
    return AVPlayer(playerItem: playerItem)
}


class ResourceLoaderDelegate: NSObject, AVAssetResourceLoaderDelegate {
    let referer: String
    
    init(referer: String) {
        self.referer = referer
    }
    
    func resourceLoader(_ resourceLoader: AVAssetResourceLoader, shouldWaitForLoadingOfRequestedResource loadingRequest: AVAssetResourceLoadingRequest) -> Bool {
        guard let request = loadingRequest.request as? NSMutableURLRequest else {
            return false
        }
        
        request.setValue(referer, forHTTPHeaderField: "Referer")
        loadingRequest.response = HTTPURLResponse(url: request.url!, statusCode: 200, httpVersion: nil, headerFields: nil)
        
        loadingRequest.dataRequest?.respond(with: Data())
        loadingRequest.finishLoading()
        
        return true
    }
}
