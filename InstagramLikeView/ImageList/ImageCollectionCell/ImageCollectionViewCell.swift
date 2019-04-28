//
//  ImageCollectionViewCell.swift
//  InstagramLikeView
//
//  Created by Ryutaro Yano on 2019/04/06.
//  Copyright © 2019 RY. All rights reserved.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    
    func setupCell(model: ImageModel) {
        imageView.image = model.image
        guard let height = self.imageView.image?.size.height, let width = self.imageView.image?.size.width else {
            return
        }
        if height/width > 1 {
            imageView.image = imageView.image!.cropping(to: CGRect(x: 0, y: 0, width: width, height: width))
        } else {
            self.imageView.contentMode = .scaleAspectFill
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
    }
    
}

extension UIImage {
    func cropping(to: CGRect) -> UIImage? {
        var opaque = false
        if let cgImage = cgImage {
            switch cgImage.alphaInfo {
            case .noneSkipLast, .noneSkipFirst:
                opaque = true
            default:
                break
            }
        }
        
        UIGraphicsBeginImageContextWithOptions(to.size, opaque, scale)
        draw(at: CGPoint(x: -to.origin.x, y: -to.origin.y))
        let result = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return result
    }
}
