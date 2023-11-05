//
//  VideoView.swift
//  videoApp
//
//  Created by Miyuki Kikuchi on 04/11/2023.
//

import SwiftUI
import AVKit

struct VideoView: View {
    var video: Video
    @State private var player = AVPlayer()
    
    var body: some View {
        VideoPlayer(player: player)
            .edgesIgnoringSafeArea(.all)
            .onAppear {
                if let link =
                    video.videoFiles.first?.link {
                    player = AVPlayer(url: URL(string: link)!)
                    player.play()
                }
            }
    }
}

#Preview {
    VideoView(video: previewVideo)
}
