//
//  VideoCard.swift
//  videoApp
//
//  Created by Miyuki Kikuchi on 03/11/2023.
//

import SwiftUI

struct VideoCard: View {
    var body: some View {
        ZStack {
            ZStack(alignment: .bottomLeading) {
                AsyncImage(url: URL(string: "")) { image in
                    image.resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 160, height: 250)
                        .cornerRadius(30)
                    
                } placeholder: {
                    Rectangle()
                        .foregroundStyle(.mint.opacity(0.3))
                        .frame(width: 170, height: 250)
                        .cornerRadius(30)
                }
                
                VStack(alignment: .leading) {
                    Text("32 sec")
                        .font(.caption.bold())
                    
                    Text("By AI")
                        .font(.caption).bold()
                        .multilineTextAlignment(.leading)
                    
                }
                .foregroundStyle(.white)
                .shadow(radius: 20)
                .padding()
            }
            Image(systemName: "play.fill")
                .foregroundStyle(.white)
                .font(.title)
                .padding()
                .background(.ultraThinMaterial)
                .cornerRadius(50)
        }
       
    }
}

#Preview {
    VideoCard()
}
