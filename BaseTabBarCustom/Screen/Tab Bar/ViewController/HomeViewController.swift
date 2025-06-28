//
//  HomeViewController.swift
//  BaseTabBarCustom
//
//  Created by Quoc Nguyen Vuong on 04/12/2024.
//

import UIKit
import AMTabView

class HomeViewController: UIViewController, TabItem {
    
    //MARK: Properties
    
    var tabImage: UIImage? {
        return UIImage(named: "tab1")
    }

    //MARK: ViewController lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(hex: "2A153E")
    }


}
