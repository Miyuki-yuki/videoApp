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
    @Published var selectedQuery: Query = Query.nature {
        
        didSet {
            Task.init {
                await findVideos(topic: selectedQuery)
            }
        }
    }
    
    init() {
        Task.init {
            await findVideos(topic: selectedQuery)
        }
    }
    
    func findVideos(topic: Query) async {
        do {
            guard let url = URL(string: "https://api.pexels.com/videos/search?query=\(topic)&per_page=10&orientation=portrait") else { fatalError("Missing URL")}
                
            var urlRequest = URLRequest(url: url)
            
            urlRequest
                .setValue("uEOhQPjoT6E0AuXQ9uaDU7wD4aQzNyraFA4tWYwMBJoahvlHUzZ8QRD5", forHTTPHeaderField: "Authorization")
            
            //Fetch the data
            let (data, response) = try await URLSession.shared.data(for: urlRequest)
            
            guard (response as? HTTPURLResponse)?.statusCode == 200 else { fatalError("Error while fetching data")}
            
            //create a JSONDecoder instance
            let decoder = JSONDecoder()
            
            //allows us to convert the data
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            
            //Decode into the struct
            let decodedData = try decoder.decode(ResponseBody.self, from: data)
            
            //set the video variables
            DispatchQueue.main.async {
                
                self.videos = []
                self.videos = decodedData.videos
            }
            
        }catch {
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
    var videoFiles: [VideoFile]
    
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
