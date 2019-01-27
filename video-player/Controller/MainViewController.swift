//
//  MainController.swift
//  video-player
//
//  Created by Trevor Wood on 2019/01/26.
//  Copyright © 2019 Trevor Wood. All rights reserved.
//

import AVFoundation
import AVKit
import SimpleImageViewer
import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
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
        guard let originImage = cell.thumbnailImageView else{
            return
        }
        
        let configuration = ImageViewerConfiguration { config in
            config.imageView = originImage
        }
        
        let imageViewerController = ImageViewerController(configuration: configuration)
        
        self.present(imageViewerController, animated: true){
            let videoURL = URL(string: video.videoUrl)
            let playerViewController = VideoPlayerViewController()
            let player = AVPlayer(url: videoURL!)
            playerViewController.player = player
            imageViewerController.present(playerViewController, animated: false) {
                
            }

        }
        
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


