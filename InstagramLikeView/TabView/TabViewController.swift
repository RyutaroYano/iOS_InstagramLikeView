//
//  TabViewViewController.swift
//  InstagramLikeView
//
//  Created by Ryutaro Yano on 2019/04/06.
//  Copyright © 2019 RY. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class TabViewController: ButtonBarPagerTabStripViewController {
    
    override func viewDidLoad() {
        // タブバーの背景色
        settings.style.buttonBarBackgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        // タブの色
        settings.style.buttonBarItemBackgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        // タブの文字サイズ
        settings.style.buttonBarItemFont = UIFont.systemFont(ofSize: 15)
        // カーソルの色
        settings.style.selectedBarBackgroundColor = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)
        // 選択しているタブタイトルの文字色を変更
        changeCurrentIndexProgressive = { (oldCell: ButtonBarViewCell?, newCell: ButtonBarViewCell?, progressPercentage: CGFloat, changeCurrentIndex: Bool, animated: Bool) -> Void in
            guard changeCurrentIndex == true else { return }
            oldCell?.label.textColor = #colorLiteral(red: 0.340322766, green: 0.355843925, blue: 0.4121289433, alpha: 1)
            newCell?.label.textColor = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)
        }
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        var vcs: [UIViewController] = []
        let table1 =  UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ImageListViewController") as! ImageListViewController
        table1.noteBookName = "ALL"
        vcs.append(table1)
        let table2 =  UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ImageListViewController") as! ImageListViewController
        table2.noteBookName = "スタッフ"
        vcs.append(table2)
        let table3 =  UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ImageListViewController") as! ImageListViewController
        table3.noteBookName = "外観"
        vcs.append(table3)
        let table4 =  UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ImageListViewController") as! ImageListViewController
        table4.noteBookName = "内観"
        vcs.append(table4)
        let table5 =  UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ImageListViewController") as! ImageListViewController
        table5.noteBookName = "メニュー"
        vcs.append(table5)
        return vcs
    }
    
}
