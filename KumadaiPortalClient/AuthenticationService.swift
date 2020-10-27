//
//  AuthenticationService.swift
//  KumadaiPortalClient
//
//  Created by 戸高新也 on 2020/10/23.
//  Copyright © 2020 戸高新也. All rights reserved.
//

import Combine
import SwiftUI
import KumadaiPortal

enum SignInState {
    case authenticated
    case notAuthenticated
    case pending
}

class AuthenticationService: ObservableObject {
    
    @Published var authState: SignInState = .notAuthenticated
    
    func login(username: String, password: String) {
        
        KumadaiPortal.shared.login(username: username, password: password) { (error) in
            if let error = error {
                
                print(error)
                
                CookieManager.deleteAllCookies()
                
                DispatchQueue.main.async {
                    self.authState = .notAuthenticated
                }
                return
            }
            
            print("sigin in success!!")
            DispatchQueue.main.async {
                self.authState = .authenticated
            }
        }
    }
}
