//
//  TabBarViewController.swift
//  fondueTimer
//
//  Created by Andy Becker on 2/16/19.
//  Copyright © 2019 Andy Becker. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {

    var specialColor: ForkColor?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let color = specialColor {
            UITabBar.appearance().barTintColor = color.color
            navigationController?.navigationBar.barTintColor = color.color
            
            if color.tone == tone.Dark {
                navigationController?.navigationBar.tintColor = UIColor.lightText;
                UITabBar.appearance().tintColor = UIColor.lightText
            } else {
                navigationController?.navigationBar.tintColor = UIColor.darkText;
                UITabBar.appearance().tintColor = UIColor.darkText
            }
        }
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18)], for: .normal)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBar.items?[0].title = "Steak"
        self.tabBar.items?[1].title = "Chicken"
        self.tabBar.items?[2].title = "Seafood"
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
