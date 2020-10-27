//
//  SceneDelegate.swift
//  KumadaiPortalClient
//
//  Created by 戸高新也 on 2020/10/21.
//  Copyright © 2020 戸高新也. All rights reserved.
//

import UIKit
import SwiftUI
import KumadaiPortal

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        let authService = AuthenticationService()
        let contentView = RootView().environmentObject(authService)
        
        #if DEVELOP
            let (username, password): (String, String) = {
                guard let filePath = Bundle.main.path(forResource: "KumadaiPortal-Info", ofType: "plist") else {
                  fatalError("Couldn't find file 'TMDB-Info.plist'.")
                }
                let plist = NSDictionary(contentsOfFile: filePath)
                guard let username = plist?.object(forKey: "username") as? String, let password = plist?.object(forKey: "password") as? String else {
                  fatalError("Couldn't find key 'API_KEY' in 'TMDB-Info.plist'.")
                }
                return (username, password)
            }()
            authService.login(username: username, password: password)
        #endif
        
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = UIHostingController(rootView: contentView)
            self.window = window
            window.makeKeyAndVisible()
        }
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
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


struct SceneDelegate_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
