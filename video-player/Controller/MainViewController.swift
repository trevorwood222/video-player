//
//  MainController.swift
//  video-player
//
//  Created by Trevor Wood on 2019/01/26.
//  Copyright © 2019 Trevor Wood. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    let cellHeight:CGFloat = 200
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        collectionView.delegate = self
        collectionView.dataSource = self
    }


}

extension MainViewController: UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {

        if let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "CollectionsHeaderCollectionReuseableViewReuseID", for: indexPath) as? CollectionsHeaderCollectionReuseableView{


            sectionHeader.isHidden = .fabrics.count == 0
            sectionHeader.headerLabel.text = "shirts.header".localized
            sectionHeader.headerLabel.standardFont()

            return sectionHeader
        }
        return UICollectionReusableView()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        if Services.videos.count == 0 {
//            return 1
//        }
        return Services.videos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
//        if Services.videos.count == 0 {
//            let reuseIdentifier = "LabelCollectionViewCellReuseID"
//            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! LabelCollectionViewCell
//            cell.setUp()
//            return cell
//        }
        
        
        let reuseIdentifier = "VideoCollectionViewCellReuseID"
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier,for: indexPath as IndexPath) as! VideoCollectionViewCell
        
        cell.setup(video: Services.videos[indexPath.row])
        
        return cell
    }
}

extension MainViewController: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

    }
}

extension MainViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        var cellWidth = self.collectionView.bounds.width
        if UIDevice.current.orientation == .landscapeLeft ||
            UIDevice.current.orientation == .landscapeRight{
            cellWidth = self.collectionView.bounds.width / 2
        }
        
        return CGSize(width: cellWidth, height: cellHeight)
    }
}
