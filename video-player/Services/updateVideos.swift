//
//  updateVideos.swift
//  video-player
//
//  Created by Trevor Wood on 2019/01/26.
//  Copyright © 2019 Trevor Wood. All rights reserved.
//

import Foundation
extension Services {
    static func updateVideos(results:[FetchPlaylistsResult]){
        Services.videos = []
        for item in results {
            Services.videos.append(Video(
                title: item.title,
                presenterName: item.presenter_name,
                description: item.description,
                thumbnailUrl: item.thumbnail_url,
                videoUrl: item.video_url,
                videoDuration: item.video_duration)
            )
        }
    }
}
