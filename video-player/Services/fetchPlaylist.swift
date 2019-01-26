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
    static func fetchPlaylists(completion: @escaping (_ status:Int,_ code:Int,_ message:String,_ error:String ,_ result:FetchPlaylistsResult?) -> Void){
        
        let urlBuilder = "\(Config.apiUrl)/playlist/playlist.json"
        let url = URL(string: urlBuilder)
        
        var request = URLRequest(url:url!)
        request.setValue(Config.apiKey, forHTTPHeaderField: "Authorization")
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.cachePolicy = .reloadIgnoringLocalCacheData
    
    }
}

struct FetchPlaylistsResponse: Decodable {
    let result: FetchPlaylistsResult
}

struct FetchPlaylistsResult: Decodable {
    let minimum_build: Int
}
