//
//  VideoPlayerView.swift
//  videofy
//
//  Created by Prana dhika on 27/08/24.
//

import Foundation
import SwiftUI
import AVKit

struct VideoPlayerView: NSViewRepresentable {
    let player: AVPlayer

    func makeNSView(context: Context) -> NSView {
        let view = NSView(frame: .zero)
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.videoGravity = .resizeAspect
        view.layer = playerLayer
        view.wantsLayer = true
        return view
    }
    
    func updateNSView(_ nsView: NSView, context: Context) {
        if let playerLayer = nsView.layer as? AVPlayerLayer {
            playerLayer.player = player
        }
    }
}
