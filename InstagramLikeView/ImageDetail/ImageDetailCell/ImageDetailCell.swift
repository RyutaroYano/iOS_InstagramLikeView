//
//  ImageDetailCell.swift
//  InstagramLikeView
//
//  Created by Ryutaro Yano on 2019/04/07.
//  Copyright © 2019 RY. All rights reserved.
//

import UIKit

class ImageDetailCell: UICollectionViewCell {

    @IBOutlet weak var imageDetailView: UIImageView!
    
    // 画像の拡大率
    var currentScale:CGFloat = 1.0
    
    func setupCell(model: ImageModel) {
        imageDetailView.image = model.image
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.imageDetailView.contentMode = .scaleAspectFit
        imageDetailView.isUserInteractionEnabled = true
        
        let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(self.pinchAction))
        pinchGesture.delegate = self
        imageDetailView.addGestureRecognizer(pinchGesture)
        
        let doubleTapGesture = UITapGestureRecognizer(target: self, action:#selector(self.doubleTap))
        doubleTapGesture.numberOfTapsRequired = 2
        self.imageDetailView.addGestureRecognizer(doubleTapGesture)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageDetailView.image = nil
    }
    
}

extension ImageDetailCell: UIGestureRecognizerDelegate {
    
    @objc func pinchAction(sender: UIPinchGestureRecognizer) {
        // imageViewを拡大縮小する
        // ピンチ中の拡大率は0.3〜2.5倍、指を離した時の拡大率は0.5〜2.0倍とする
        switch sender.state {
        case .began, .changed:
            // senderのscaleは、指を動かしていない状態が1.0となる
            // 現在の拡大率に、(scaleから1を引いたもの) / 10(補正率)を加算する
            currentScale = currentScale + (sender.scale - 1) / 10
            // 拡大率が基準から外れる場合は、補正する
            if currentScale < 0.3 {
                currentScale = 0.3
            } else if currentScale > 2.5 {
                currentScale = 2.5
            }
            // 計算後の拡大率で、imageViewを拡大縮小する
            imageDetailView.transform = CGAffineTransform(scaleX: currentScale, y: currentScale)
        default:
            // ピンチ中と同様だが、拡大率の範囲が異なる
            if currentScale < 0.5 {
                currentScale = 0.5
            } else if currentScale > 2.0 {
                currentScale = 2.0
            }
            
            // 拡大率が基準から外れている場合、指を離したときにアニメーションで拡大率を補正する
            // 例えば指を離す前に拡大率が0.3だった場合、0.2秒かけて拡大率が0.5に変化する
            UIView.animate(withDuration: 0.2, animations: {
                self.imageDetailView.transform = CGAffineTransform(scaleX: self.currentScale, y: self.currentScale)
            }, completion: nil)
            
        }
    }
    
    @objc func doubleTap(sender: UITapGestureRecognizer){
        // ピンチ中と同様だが、拡大率の範囲が異なる
        if currentScale == 1.0 {
            currentScale = 2.0
        } else {
            currentScale = 1.0
        }
        
        // 拡大率が基準から外れている場合、指を離したときにアニメーションで拡大率を補正する
        // 例えば指を離す前に拡大率が0.3だった場合、0.2秒かけて拡大率が0.5に変化する
        UIView.animate(withDuration: 0.2, animations: {
            self.imageDetailView.transform = CGAffineTransform(scaleX: self.currentScale, y: self.currentScale)
        }, completion: nil)
    }
}
