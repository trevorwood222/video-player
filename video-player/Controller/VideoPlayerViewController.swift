//
//  VideoPlayerViewController.swift
//  video-player
//
//  Created by Trevor Wood on 2019/01/27.
//  Copyright © 2019 Trevor Wood. All rights reserved.
//

import Foundation
import AVFoundation
import AVKit

class VideoPlayerViewController:AVPlayerViewController {
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(false)
        self.player?.play()

    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(false)
    }
    
}
