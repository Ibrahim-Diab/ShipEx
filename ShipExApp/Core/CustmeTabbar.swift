//
//  CustmeTabbar.swift
//  ShipExApp
//
//  Created by Ibrahim Diab on 12/10/2022.
//

import Foundation
//
//  TabbarController.swift


import UIKit

class TabbarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
  
        //my  ViewControllers
        let homeController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomeVc") as! HomeVc
       
       let profileVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "profile") as! profileVc
      
  
        // Tabbar
        let profiletab = UITabBarItem(title: "profile", image: UIImage(named: "Icon-1"), tag: 1)
//
       let hometab = UITabBarItem(title: "Home", image: UIImage(named: "Home"), tag: 0)
//
        // tabbarControl
        profileVC.tabBarItem = profiletab

        homeController.tabBarItem = hometab
        
        //
        
        let tabControllers = [homeController,profileVC]
        self.tabBarController?.setViewControllers(tabControllers, animated: true)
        self.viewControllers = tabControllers
        tabBar.backgroundColor = #colorLiteral(red: 0.5960784314, green: 0.6588235294, blue: 0.9725490196, alpha: 1)
        tabBar.tintColor = .white
        
        
        // Do any additional setup after loading the view.
    }
    
    
    
    
    
    // MARK: - Delegate method
    func tabBarController(tabBarController: UITabBarController, shouldSelectViewController viewController: UIViewController) -> Bool {
        print("Ahmed")
        return true
    }
    
    
    
}
