//
//  Video.swift
//  video-player
//
//  Created by Trevor Wood on 2019/01/26.
//  Copyright © 2019 Trevor Wood. All rights reserved.
//
import Foundation

class Video {
    let title:String
    let presenterName:String
    let description:String
    let thumbnailUrl:String
    let videoUrl:String
    let videoDuration:Int
    
    init(
            title:String,
            presenterName:String,
            description:String,
            thumbnailUrl:String,
            videoUrl:String,
            videoDuration:Int
        ) {
    
        self.title = title
        self.presenterName = presenterName
        self.description = description
        self.thumbnailUrl = thumbnailUrl
        self.videoUrl = videoUrl
        self.videoDuration = videoDuration
        
    }
}
