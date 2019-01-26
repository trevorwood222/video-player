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
    let cellSubtractWidth:CGFloat = 15.0
    let cellAddHeight:CGFloat = 50
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

extension MainViewController: UICollectionViewDelegate{
    // MARK: - UICollectionViewDelegate protocol
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // handle tap events
//
//        if OriginalStitch.fabrics.count != 0 {
//            let fabric = OriginalStitch.fabrics[indexPath.item]
//
//            let storyboard = UIStoryboard(name: "Main", bundle: nil)
//            let vc = storyboard.instantiateViewController(withIdentifier: "CollectionsFabricDetailViewController") as! CollectionsFabricDetailViewController
//
//            vc.fabric = fabric
//            self.navigationController?.pushViewController(vc, animated: true)
//
//        }
    }
}

extension MainViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let cellWidth = self.collectionView.bounds.width / 2 - cellSubtractWidth
        let cellHeight = cellWidth + cellAddHeight
        return CGSize(width: cellWidth, height: cellHeight)
    }
}
