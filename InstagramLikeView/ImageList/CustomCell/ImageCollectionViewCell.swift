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
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.imageView.contentMode = .scaleAspectFill
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
    }


}
