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
import Player

class VideoPlayerViewController: AVPlayerViewController {
    
    let viewHeight:CGFloat = 40
    let viewWidth:CGFloat = 100
    let timeView = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 40))
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        let timerLabel = UILabel(frame: CGRect(x: 0, y: 0, width: viewWidth, height: viewHeight))
        timerLabel.textAlignment = .center
        timerLabel.textColor = .white
        timerLabel.font = timerLabel.font.withSize(12)
        
        timeView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        timeView.alpha = 0.85

        self.view.addSubview(timeView)
        self.timeView.addSubview(timerLabel)
        
        timeView.translatesAutoresizingMaskIntoConstraints = false
        timeView.cornerRadius = 15
        
        timeView.addConstraints([
            NSLayoutConstraint(item: timerLabel, attribute: .centerY, relatedBy: .equal, toItem: timeView, attribute: .centerY, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: timerLabel, attribute: .centerX, relatedBy: .equal, toItem: timeView, attribute: .centerX, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: timerLabel, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: viewWidth),
            NSLayoutConstraint(item: timerLabel, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: viewHeight)
            ])
        
        
        var toItem:Any = view
        if #available(iOS 11.0, *) {
            toItem = view.safeAreaLayoutGuide
        }
        
        let centerY = NSLayoutConstraint(item: timeView, attribute: .centerY, relatedBy: .equal, toItem: toItem, attribute: .centerY, multiplier: 1, constant: -100)
        let rightPortrait = NSLayoutConstraint(item: timeView, attribute: .right, relatedBy: .equal, toItem: toItem, attribute: .right, multiplier: 1, constant: -10)
        let width = NSLayoutConstraint(item: timeView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: viewWidth)
        let height = NSLayoutConstraint(item: timeView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: viewHeight)
        
        view.addConstraints([centerY,rightPortrait,width,height])
        
        
        _ = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { [weak self] _ in
        
            guard let currentSeconds = self?.player?.currentTime().seconds else{
                return
            }
            guard let totalSeconds = self?.player?.currentItem?.asset.duration.seconds else{
                return
            }
            
            if currentSeconds == totalSeconds {
                self?.dismiss(animated: false, completion: nil)
            }
            
            let currentTimeText = Utils.displaySecondsAsTime(secondsType: .regular, seconds: Int(round(currentSeconds)))
            let totalTimeText = Utils.displaySecondsAsTime(secondsType: .regular, seconds: Int(round(totalSeconds)))
            
            timerLabel.text = "\(currentTimeText) / \(totalTimeText)"
        }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(false)
        self.player?.play()
        self.view.bringSubviewToFront(timeView)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(false)
        self.view.window?.rootViewController?.dismiss(animated: true, completion: nil)
    }
    
}
