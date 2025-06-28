//
//  TabBarViewController.swift
//  BaseTabBarCustom
//
//  Created by Quoc Nguyen Vuong on 04/12/2024.
//

import UIKit
import AMTabView

class TabBarViewController: AMTabsViewController {
    
    //MARK: ViewController lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTabsController()
        selectedTabIndex = 0
    }
    
    private func setTabsController() {
        let homeVC = HomeViewController()
        let bumpkinVC = BumpkinViewController()
        let fireworkVC = FireworkViewController()
        let settingVC = SettingViewController()
    
        viewControllers = [
            homeVC,
            bumpkinVC,
            fireworkVC,
            settingVC
        ]
    }
    
    override func tabDidSelectAt(index: Int) {
        super.tabDidSelectAt(index: index)
    }
}

