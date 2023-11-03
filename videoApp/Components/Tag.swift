//
//  Tag.swift
//  videoApp
//
//  Created by Miyuki Kikuchi on 03/11/2023.
//

import SwiftUI

struct Tag: View {
    var query: Query
    var isSelected: Bool
    
    var body: some View {
        Text(query.rawValue)
            .font(.caption)
            .bold()
            .foregroundStyle(isSelected ? .black : .gray)
            .padding(10)
            .background(.thinMaterial)
            .cornerRadius(10)
        
    }
}

#Preview {
    Tag(query: Query.Swift, isSelected: true)
}
