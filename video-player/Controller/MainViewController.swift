//
//  MainController.swift
//  video-player
//
//  Created by Trevor Wood on 2019/01/26.
//  Copyright © 2019 Trevor Wood. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit

class MainViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
//    let cellHeight:CGFloat = 185
    let cellRightTextWidth:CGFloat = 145
    let cellBottomEstimatedTextHeight:CGFloat = 70
    let imageRatio:CGFloat = 640/360
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    override func didRotate(from fromInterfaceOrientation: UIInterfaceOrientation) {
        collectionView.reloadData()
    }

}

extension MainViewController: UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {

        if let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "VideoCollectionReuseableViewReuseID", for: indexPath) as? VideoCollectionReuseableView{

            return sectionHeader
        }
        return UICollectionReusableView()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return Services.videos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        let reuseIdentifier = "VideoCollectionViewCellReuseID"
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier,for: indexPath as IndexPath) as! VideoCollectionViewCell
        
        cell.setup(video: Services.videos[indexPath.row])
        
        
        return cell
    }
}

extension MainViewController: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        
        guard let cell = collectionView.cellForItem(at: indexPath) as? VideoCollectionViewCell else{
            return
        }
        
        let video = Services.videos[indexPath.row]
        
//        let windowFrame = UIApplication.shared.windows.first!.frame
//        UIView.animate(withDuration: 0.4, delay: 0.0, options: .curveEaseIn, animations: {
//
//            cell.thumbnailImageView.frame = windowFrame
//            cell.thumbnailImageView.alpha = 1
//            cell.thumbnailImageView.layoutSubviews()
//
//        }, completion: { _ in
            let videoURL = URL(string: video.videoUrl)
            let player = AVPlayer(url: videoURL!)
            let playerViewController = AVPlayerViewController()
            playerViewController.player = player
            self.present(playerViewController, animated: true) {
                playerViewController.player!.play()
            }
//        })
        
    }
}

extension MainViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        var cellWidth = self.collectionView.bounds.width
        if UIDevice.current.orientation == .landscapeLeft ||
            UIDevice.current.orientation == .landscapeRight{
            cellWidth = self.collectionView.bounds.width / 2
        }
        
        let cellHeight = ((cellWidth - cellRightTextWidth)/imageRatio) + cellBottomEstimatedTextHeight
        
        return CGSize(width: cellWidth, height: cellHeight)
    }
}
