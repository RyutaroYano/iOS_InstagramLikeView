//
//  ImageDetailViewController.swift
//  InstagramLikeView
//
//  Created by Ryutaro Yano on 2019/04/06.
//  Copyright © 2019 RY. All rights reserved.
//

import UIKit

class ImageDetailViewController: UIViewController{
    
    @IBOutlet weak var imageDetailView: UIImageView!
    
    var selectedImage: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //画像を設定
        imageDetailView.image = selectedImage
        imageDetailView.contentMode = UIView.ContentMode.scaleAspectFit
        
        // 下向きにスワイプした時のジェスチャーを作成
        let downSwipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(self.closeModalView))
        downSwipeGesture.direction = .down
        // 画面にジェスチャーを登録
        view.addGestureRecognizer(downSwipeGesture)
    }
    
    //ステータスバーの文字色を白に
    private var statusBarStyle: UIStatusBarStyle = .lightContent
    func setStatusBarStyle(style: UIStatusBarStyle) {
        statusBarStyle = style
        self.setNeedsStatusBarAppearanceUpdate()
    }
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
