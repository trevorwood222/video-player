//
//  VideoCollectionViewCell.swift
//  video-player
//
//  Created by Trevor Wood on 2019/01/26.
//  Copyright © 2019 Trevor Wood. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

class VideoCollectionViewCell: UICollectionViewCell{
    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var presenterNameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var videoDurationLabel: UILabel!
    
    func setup(video:Video){
        titleLabel.text = video.title
        presenterNameLabel.text = "by \(video.presenterName)"
        descriptionLabel.text = video.description
        videoDurationLabel.text = Utils.displayMilisecondsAsTime(milliseconds: video.videoDuration)
        thumbnailImageView.kf.setImage(with:  URL(string: video.thumbnailUrl))
    }
    
}
