//
//  SceneDelegate.swift
//  ShipExApp
//
//  Created by Ibrahim Diab on 10/10/2022.
//

import UIKit
import FirebaseAuth

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowsSene = (scene as? UIWindowScene) else { return }
        window = UIWindow()
        window?.windowScene = windowsSene
        
        let navController = UINavigationController()
        navController.isNavigationBarHidden = true
        window?.rootViewController = navController
        let user = Auth.auth().currentUser
        if user != nil
        {
            print("User is signin ")
            let tabbar = TabbarController()
            navController.setViewControllers([tabbar], animated: true)
            window?.makeKeyAndVisible()
        }
        else
        {
            print("sign out")
            let homeVc  = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Loging") as! LoginAndSignUpVc
            navController.setViewControllers([homeVc], animated: true)
        }
        
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }
    
    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }
    
    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }
    
    
}

