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
    
    func setupCell(model: ImageModel) {
        imageDetailView.image = model.image
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.imageDetailView.contentMode = .scaleAspectFit
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageDetailView.image = nil
    }
}
