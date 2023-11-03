//
//  ContentView.swift
//  videoApp
//
//  Created by Miyuki Kikuchi on 03/11/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            HStack {
                ForEach(Query.allCases, id: \.self) {
                    searchQuery in
                    Tag(query: searchQuery, isSelected: false)
                    
                }
            }
        }
        .background(Color("AccentColor"))
    }
}

#Preview {
    ContentView()
}
