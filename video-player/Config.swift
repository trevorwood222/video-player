//
//  Config.swift
//  video-player
//
//  Created by Trevor Wood on 2019/01/26.
//  Copyright © 2019 Trevor Wood. All rights reserved.
//

import Foundation

enum EnvironmentType {
    case development,production
}

enum BundleId: String {
    case development = "com.original.video-player-dev"
    case production = "com.original.video-player"
}

struct Config {
    
    static var apiUrl:String = ""
    static var apiKey:String = ""
    
    static var environment:EnvironmentType? {
        didSet {
            if environment == .production {
                apiUrl = "https://trevorwood222.github.io"
                apiKey = Keys.API.production
            }else{
                apiUrl = "https://trevorwood222.github.io"
                apiKey = Keys.API.development
            }
        }
    }
    

}
