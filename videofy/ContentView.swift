//
//  ContentView.swift
//  videofy
//
//  Created by Prana dhika on 23/08/24.
//

import SwiftUI
import AVKit

struct ContentView: View {
    let player: AVPlayer
    init() {
        let url = URL(string: "https://mtoczko.github.io/hls-test-streams/test-group/playlist.m3u8")!
        player = createPlayerWithRefererHeader(url: url, referer: "")
    }
    
    var body: some View {
        VideoPlayerView(player: player)
            .onAppear {
                player.play()
            }
            .onDisappear {
                player.pause()
            }
    }
}

#Preview {
    ContentView()
}
