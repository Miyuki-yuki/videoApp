//
//  VideoManager.swift
//  videoApp
//
//  Created by Miyuki Kikuchi on 03/11/2023.
//

import Foundation

//CaseIterable---

enum Query: String, CaseIterable {
    case Swift, Python, AIpicture, AI, nature
}

class VideoManager: ObservableObject {
    @Published private(set) var videos: [Video] = []
    @Published var selectedQuery: Query = Query.nature
    
    func findVideos(topic: Query) async {
        do {
            guard let url = URL(string: "") else { fatalError("Missing URL")}
        } catch {
            print("Error fetching data from website: \(error)")
        }
        
    }
}

struct ResponseBody: Decodable {
    var page: Int
    var perPage: Int
    var totalResults: Int
    var url: String
    var videos: [Video]
}

struct Video: Identifiable, Decodable {
    var id: Int
    var image: String
    var duration: Int
    var user: User
    
    struct User: Identifiable, Decodable {
        var id: Int
        var name: String
        var url: String
        
}
    struct VideoFile: Identifiable, Codable {
        var id: Int
        var quality: String
        var fileType: String
        var link: String
    }
}
