//
//  SettingViewController.swift
//  BaseTabBarCustom
//
//  Created by Quoc Nguyen Vuong on 05/12/2024.
//

import UIKit
import AMTabView

class SettingViewController: UIViewController, TabItem {
    
    //MARK: Properties
    
    var tabImage: UIImage? {
        return UIImage(named: "tab4")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(hex: "2A153E")
        // Do any additional setup after loading the view.
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
