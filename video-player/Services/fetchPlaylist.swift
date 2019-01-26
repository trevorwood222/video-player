//
//  fetchPlaylist.swift
//  video-player
//
//  Created by Trevor Wood on 2019/01/26.
//  Copyright © 2019 Trevor Wood. All rights reserved.
//

import Foundation

extension Services {
    static var fetchPlaylistsDataTask: URLSessionTask?
    static func fetchPlaylists(completion: @escaping (_ status:Int,_ code:Int,_ message:String,_ error:String ,_ result:[FetchPlaylistsResult]?) -> Void){
        
        let urlBuilder = "\(Config.apiUrl)/playlist/playlist.json"
        let url = URL(string: urlBuilder)
        
        print("urlBuilder: \(urlBuilder)")
        
        var request = URLRequest(url:url!)
        request.setValue(Config.apiKey, forHTTPHeaderField: "Authorization")
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.cachePolicy = .reloadIgnoringLocalCacheData
        
        fetchPlaylistsDataTask?.cancel()
        fetchPlaylistsDataTask = URLSession.shared.dataTask(with: request) {(data:Data?, response:URLResponse?, error:Error?) in
            
            let s = StandardErrorResponse.self
            guard let data = data, error == nil else {
                completion(s.status,s.code,s.message,"\(#function) \(s.dataUnpackError)",nil)
                return
            }
            
            guard let response = try? JSONDecoder().decode(StandardServiceResponse.self, from: data)else{
                completion(s.status,s.code,s.message,"\(#function) \(s.responseDecodeError)",nil)
                return
            }
            
            guard let results = try? JSONDecoder().decode(FetchPlaylistsResponse.self, from: data)else{
                completion(response.status,response.code, response.message,"\(#function) \(s.resultsDecodeError)",nil)
                return
            }
            
            Services.updateVideos(results: results.result)
            
            completion(
                response.status,
                response.code,
                response.message,
                response.error,
                results.result
            )
        }
        fetchPlaylistsDataTask?.resume()
        
    }
}

struct FetchPlaylistsResponse: Decodable {
    let result: [FetchPlaylistsResult]
}

struct FetchPlaylistsResult: Decodable {
    let title:String
    let presenter_name:String
    let description:String
    let thumbnail_url:String
    let video_url:String
    let video_duration:Int
}
