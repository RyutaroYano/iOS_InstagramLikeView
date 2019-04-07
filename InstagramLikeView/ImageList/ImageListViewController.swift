//
//  ViewController.swift
//  InstagramLikeView
//
//  Created by Ryutaro Yano on 2019/04/06.
//  Copyright © 2019 RY. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class ImageListViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let models = ImageModel.createModels()
    var selectedImageIndex = 0
    var noteBookName: IndicatorInfo = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //collectionViewのデリゲートを設定
        collectionView.delegate = self
        collectionView.dataSource = self
        
        //collectionViewにImageCollectionViewCellを設定
        collectionView.register(UINib(nibName: "ImageCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ImageCollectionViewCell")
        
        // カスタムフローレイアウトを使用する
        let customFlowLayout = CustomCollectionViewFlowLayout()
        self.collectionView.collectionViewLayout = customFlowLayout
    }
}

extension ImageListViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // [indexPath.row] から画像名を探し、UImage を設定
        let selectedImage = models[indexPath.section == 0 ? indexPath.row : indexPath.section * 3 + indexPath.row - 2].image
        selectedImageIndex = indexPath.section == 0 ? indexPath.row : indexPath.section * 3 + indexPath.row - 2
        if selectedImage != nil {
            // SubViewController へ遷移するために Segue を呼び出す
            performSegue(withIdentifier: "toImageDetailViewSegue",sender: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any!) {
        if (segue.identifier == "toImageDetailViewSegue") {
            let imgDetailVC: ImageDetailViewController = (segue.destination as? ImageDetailViewController)!
            
            // ImageDetailViewController のselectedImageIndexに選択された画像のインデックスを設定する
            imgDetailVC.selectedImageIndex = selectedImageIndex
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch(section){
        case 0:
            return 1
        default:
            return 3
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return models.count / 3 + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCollectionViewCell", for: indexPath)
        
        if let cell = cell as? ImageCollectionViewCell {
            if indexPath.section * 3 + indexPath.row - 2 < models.count  {
                cell.setupCell(model: models[indexPath.section == 0 ? indexPath.row : indexPath.section * 3 + indexPath.row - 2])
            }
        }
        return cell
    }
}

extension ImageListViewController: IndicatorInfoProvider {
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return noteBookName
    }
}
