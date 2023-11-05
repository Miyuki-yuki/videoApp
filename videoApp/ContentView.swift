//
//  ContentView.swift
//  videoApp
//
//  Created by Miyuki Kikuchi on 03/11/2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var videoManager = VideoManager()
    var columns = [GridItem(.adaptive(minimum: 160), spacing: 20)]
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    ForEach(Query.allCases, id: \.self) {
                        searchQuery in
                        Tag(query: searchQuery, isSelected: videoManager.selectedQuery == searchQuery)
                                .onTapGesture {
                                    videoManager.selectedQuery = searchQuery
                            }
                    }
                }
                ScrollView {
                    if videoManager.videos.isEmpty {
                        ProgressView()
                    } else {
                        LazyVGrid(columns: columns, spacing: 20) {
                            ForEach(videoManager.videos, id: \.id) {
                                video in
                                NavigationLink {
                                    VideoView(video: video)
                                } label: {
                                    VideoCard(video: video)
                                }
                            }
                        }
                        .padding()
                    }
                }
                .frame(maxWidth: .infinity)
            }
            .background(Color("AccentColor"))
            //It removes the empty space from the top part
            .navigationBarHidden(true)
        }
    }
}
#Preview {
    ContentView()
}
