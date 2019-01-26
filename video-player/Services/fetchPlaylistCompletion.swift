//
//  fetchPlaylistCompletion.swift
//  video-player
//
//  Created by Trevor Wood on 2019/01/26.
//  Copyright © 2019 Trevor Wood. All rights reserved.
//

import Foundation
import UIKit

extension Services {
    static func fetchPlaylistCompletion(results:[FetchPlaylistsResult]){
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
        self.videoViewUpdate()
    }
    
    static func videoViewUpdate(){
        DispatchQueue.main.async {
            guard let mainVC:MainViewController = UIApplication.shared.keyWindow?.rootViewController as? MainViewController else{
                return
            }

            if let collectionView = mainVC.collectionView {
                collectionView.reloadData()
            }

        }
    }
    
}

