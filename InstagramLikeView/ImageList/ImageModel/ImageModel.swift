//
//  ImageModel.swift
//  InstagramLikeView
//
//  Created by Ryutaro Yano on 2019/04/06.
//  Copyright © 2019 RY. All rights reserved.
//

import Foundation
import UIKit

struct ImageModel {
    let image: UIImage?
    
    static func createModels() -> [ImageModel] {
        return [
            ImageModel(image: UIImage(named: "犬")),
            ImageModel(image: UIImage(named: "猫")),
            ImageModel(image: UIImage(named: "くま")),
            ImageModel(image: UIImage(named: "仕事画像1")),
            ImageModel(image: UIImage(named: "花")),
            ImageModel(image: UIImage(named: "仕事画像2")),
            ImageModel(image: UIImage(named: "猫")),
            ImageModel(image: UIImage(named: "くま")),
            ImageModel(image: UIImage(named: "猫")),
            ImageModel(image: UIImage(named: "仕事画像4")),
            ImageModel(image: UIImage(named: "犬")),
            ImageModel(image: UIImage(named: "猫")),
            ImageModel(image: UIImage(named: "花")),
            ImageModel(image: UIImage(named: "仕事画像1")),
            ImageModel(image: UIImage(named: "猫")),
            ImageModel(image: UIImage(named: "くま")),
            ImageModel(image: UIImage(named: "猫")),
            ImageModel(image: UIImage(named: "仕事画像4")),
            ImageModel(image: UIImage(named: "猫")),
            ImageModel(image: UIImage(named: "仕事画像3")),
            ImageModel(image: UIImage(named: "犬")),
            ImageModel(image: UIImage(named: "花")),
            ImageModel(image: UIImage(named: "くま")),
            ImageModel(image: UIImage(named: "仕事画像1")),
            ImageModel(image: UIImage(named: "猫")),
            ImageModel(image: UIImage(named: "花")),
            ImageModel(image: UIImage(named: "仕事画像3")),
            ImageModel(image: UIImage(named: "仕事画像2")),
            ImageModel(image: UIImage(named: "猫")),
            ImageModel(image: UIImage(named: "くま")),
        ]
    }
}
