//
//  ImageDetailViewController.swift
//  InstagramLikeView
//
//  Created by Ryutaro Yano on 2019/04/06.
//  Copyright © 2019 RY. All rights reserved.
//

import UIKit

class ImageDetailViewController: UIViewController{
    
    @IBOutlet weak var imageDetailCollectionView: UICollectionView!
    @IBOutlet weak var indexLabel: UILabel!
    
    let models = ImageModel.createModels()
    var selectedImage: UIImage!
    var selectedImageIndex = 0
    var cellFirstMadeFlg = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // delegateを設定
        imageDetailCollectionView.delegate = self
        imageDetailCollectionView.dataSource = self
        
        // 初期表示か否か
        cellFirstMadeFlg = true
        
        // CollectionViewのレイアウトを生成
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        self.imageDetailCollectionView.collectionViewLayout = layout
        
        //インデックスの初期設定
        self.indexLabel.text = "\(selectedImageIndex + 1)/\(models.count)"
        
        //写真詳細画面用セルを設定
        imageDetailCollectionView.register(UINib(nibName: "ImageDetailCell", bundle: nil), forCellWithReuseIdentifier: "ImageDetailCell")
        
        // 下向きにスワイプした時のジェスチャーを作成
        let downSwipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(self.closeModalView))
        downSwipeGesture.direction = .down
        // 画面にジェスチャーを登録
        view.addGestureRecognizer(downSwipeGesture)
    }
    
    // 初期表示画像を指定
    override func viewWillLayoutSubviews() {
        if cellFirstMadeFlg == true {
            self.imageDetailCollectionView.setContentOffset(CGPoint.init(x: Int(UIScreen.main.bounds.size.width) * selectedImageIndex, y: 0) , animated: false)
        }
    }
    
    //ステータスバーの文字色を白に
    private var statusBarStyle: UIStatusBarStyle = .lightContent
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return statusBarStyle
    }
    
    //×ボタンで画面を閉じる
    @IBAction func closeImageDetail(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    // 画面を閉じる
    @objc func closeModalView() {
        dismiss(animated: true, completion: nil)
    }
    
}

extension ImageDetailViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return models.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageDetailCell", for: indexPath)
        if let cell = cell as? ImageDetailCell {
            if indexPath.section * 3 + indexPath.row - 2 < models.count  {
                cell.setupCell(model: models[indexPath.row])
            }
        }
        return cell
    }
    
    //スクロールでインデックスを変更
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageIndex = Int(scrollView.contentOffset.x / UIScreen.main.bounds.size.width)
        self.indexLabel.text = "\(pageIndex + 1)/\(models.count)"
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        //スクロールは初期表示ではない
        cellFirstMadeFlg = false
    }
    
}
