//
//  BumpkinViewController.swift
//  BaseTabBarCustom
//
//  Created by Quoc Nguyen Vuong on 05/12/2024.
//

import UIKit
import AMTabView

class BumpkinViewController: UIViewController, TabItem {
    
    //MARK: Properties
    
    var tabImage: UIImage? {
        return UIImage(named: "tab2")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(hex: "2A153E")
    }
}
