//
//  File.swift
//  InstagramLikeView
//
//  Created by Ryutaro Yano on 2019/04/06.
//  Copyright © 2019 RY. All rights reserved.
//

import UIKit

class CustomCollectionViewFlowLayout: UICollectionViewFlowLayout {
    
    private static let kMaxRow = 3
    var maxColumn = kMaxRow
    
    private var sectionCells = [[CGRect]]()
    private var contentSize = CGSize.zero
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init() {
        super.init()
        
        self.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        self.minimumLineSpacing = 1
        self.minimumInteritemSpacing = 1
    }
    
    override func prepare() {
        super.prepare()
        sectionCells = [[CGRect]]()
        
        if let collectionView = self.collectionView {
            contentSize = CGSize(width: UIScreen.main.bounds.size.width - collectionView.contentInset.left - collectionView.contentInset.right, height: 0)
            let smallCellSideLength: CGFloat = (contentSize.width - super.sectionInset.left - super.sectionInset.right - (super.minimumInteritemSpacing * (CGFloat(maxColumn) - 1.0))) / CGFloat(maxColumn)
            
            for section in (0..<collectionView.numberOfSections) {
                let numberOfCellsInSection = collectionView.numberOfItems(inSection: section)
                var x:CGFloat = 0
                var y:CGFloat = 0
                var cellwidth:CGFloat = 0
                var cellheight:CGFloat = 0
                var cellRect = CGRect(x: x, y: y, width: cellwidth, height: cellheight)
                var cells = [CGRect]()
                var height = contentSize.height
                
                let sectionBigOrSmall = section % 3
                let sectionRightOrLeft = (section / 3) % 2
                
                // 最初のセルを2×3画像
                if section == 0 {
                    x = 0
                    y = 0
                    cellwidth = UIScreen.main.bounds.size.width
                    cellheight = 2 * smallCellSideLength
                    cellRect = CGRect(x: x, y: y, width: cellwidth, height: cellheight)
                    cells.append(cellRect)
                    if (height < cellRect.origin.y + cellRect.height) {
                        height = cellRect.origin.y + cellRect.height
                    }
                    contentSize = CGSize(width: contentSize.width, height: height + super.minimumLineSpacing)
                    sectionCells.append(cells)
                    continue
                }
                
                switch sectionBigOrSmall {
                // 2×2画像あり
                case 0:
                    switch sectionRightOrLeft {
                    // 2×2画像右
                    case 0:
                        for i in (0..<numberOfCellsInSection) {
                            switch i {
                            case 0:
                                x = super.sectionInset.left
                                y = contentSize.height + super.sectionInset.top
                                cellwidth = smallCellSideLength
                                cellheight = smallCellSideLength
                            case 1:
                                x = smallCellSideLength + super.minimumInteritemSpacing + super.sectionInset.left
                                y = (0 * (smallCellSideLength + super.minimumLineSpacing)) + contentSize.height + super.sectionInset.top
                                cellwidth = 2 * smallCellSideLength  + super.minimumInteritemSpacing
                                cellheight = 2 * smallCellSideLength + super.minimumLineSpacing
                            case 2:
                                x = super.sectionInset.left
                                y = (1 * (smallCellSideLength + super.minimumLineSpacing)) + contentSize.height + super.sectionInset.top
                                cellwidth = smallCellSideLength
                                cellheight = smallCellSideLength
                            default :
                                x = 0; y = 0
                                cellwidth = 0; cellheight = 0
                                break
                            }
                            cellRect = CGRect(x: x, y: y, width: cellwidth, height: cellheight)
                            cells.append(cellRect)
                            if (height < cellRect.origin.y + cellRect.height) {
                                height = cellRect.origin.y + cellRect.height
                            }
                        }
                    // 2×2画像左
                    case 1:
                        for i in (0..<numberOfCellsInSection) {
                            switch i {
                            case 0:
                                x = super.sectionInset.left
                                y = contentSize.height + super.sectionInset.top
                                cellwidth = 2 * smallCellSideLength + super.minimumInteritemSpacing
                                cellheight = 2 * smallCellSideLength + super.minimumLineSpacing
                            case 1:
                                x = 2 * (smallCellSideLength + super.minimumInteritemSpacing) + super.sectionInset.left
                                y = 0 * (smallCellSideLength + super.minimumLineSpacing) + contentSize.height + super.sectionInset.top
                                cellwidth = smallCellSideLength
                                cellheight = smallCellSideLength
                            case 2:
                                x = 2 * (smallCellSideLength + super.minimumInteritemSpacing) + super.sectionInset.left
                                y = 1 * (smallCellSideLength + super.minimumLineSpacing) + contentSize.height + super.sectionInset.top
                                cellwidth = smallCellSideLength
                                cellheight = smallCellSideLength
                            default :
                                x = 0; y = 0
                                cellwidth = 0; cellheight = 0
                                break
                            }
                            cellRect = CGRect(x: x, y: y, width: cellwidth, height: cellheight)
                            cells.append(cellRect)
                            if (height < cellRect.origin.y + cellRect.height) {
                                height = cellRect.origin.y + cellRect.height
                            }
                            
                        }
                    default:
                        x = 0; y = 0
                        cellwidth = 0; cellheight = 0
                        break
                    }
                // 1×1画像のみ
                case 1,2:
                    for i in (0..<numberOfCellsInSection) {
                        switch i {
                        case 0:
                            x = super.sectionInset.left
                            y = contentSize.height + super.sectionInset.top
                            cellwidth = smallCellSideLength
                            cellheight = smallCellSideLength
                        case 1:
                            x = smallCellSideLength + super.minimumInteritemSpacing + super.sectionInset.left
                            y = contentSize.height + super.sectionInset.top
                            cellwidth = smallCellSideLength
                            cellheight = smallCellSideLength
                        case 2:
                            x = 2 * (smallCellSideLength + super.minimumInteritemSpacing) + super.sectionInset.left
                            y = contentSize.height + super.sectionInset.top
                            cellwidth = smallCellSideLength
                            cellheight = smallCellSideLength
                        default :
                            x = 0; y = 0
                            cellwidth = 0; cellheight = 0
                            break
                        }
                        cellRect = CGRect(x: x, y: y, width: cellwidth, height: cellheight)
                        cells.append(cellRect)
                        if (height < cellRect.origin.y + cellRect.height) {
                            height = cellRect.origin.y + cellRect.height
                        }
                    }
                default :
                    break
                }
                
                contentSize = CGSize(width: contentSize.width, height: height + super.minimumLineSpacing)
                sectionCells.append(cells)
                
            }
        }
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        var layoutAttributes = [UICollectionViewLayoutAttributes]()
        
        if let collectionView = self.collectionView {
            for i in 0..<collectionView.numberOfSections {
                let numberOfCellsInSection = collectionView.numberOfItems(inSection: i);
                for j in 0..<numberOfCellsInSection {
                    
                    let indexPath = IndexPath(row: j, section: i)
                    if let attributes = layoutAttributesForItem(at: indexPath) {
                        if (rect.intersects(attributes.frame)) {
                            layoutAttributes.append(attributes)
                        }
                    }
                }
            }
        }
        return layoutAttributes
    }
    
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        let attributes = super.layoutAttributesForItem(at: indexPath)
        attributes?.frame = sectionCells[indexPath.section][indexPath.row]
        return attributes
    }
    
    override var collectionViewContentSize : CGSize {
        return contentSize
    }
}
