//
//  CookieManager.swift
//  KumadaiPortalClient
//
//  Created by 戸高新也 on 2020/10/23.
//  Copyright © 2020 戸高新也. All rights reserved.
//

import Foundation

class CookieManager {
    
    static let shared = CookieManager()
    
    private init() {}
    
    var beforeCookies: [HTTPCookie] = []
    
    static func deleteAllCookies() {
        HTTPCookieStorage.shared.cookies?.forEach({ (cookie) in
            HTTPCookieStorage.shared.deleteCookie(cookie)
        })
    }
    
    func monitoringStart() {
        print("–---------monitoring cookies start -------------")
        NotificationCenter.default.addObserver(self, selector: #selector(handleCookiesChanged), name: .NSHTTPCookieManagerCookiesChanged, object: nil)
    }
    
    @objc func handleCookiesChanged(notification: Notification) {
        guard let cookieStorage = notification.object as? HTTPCookieStorage, let cookies = cookieStorage.cookies else {
            return
        }
        
        let addedCookies = cookies.filter { (cookie) -> Bool in
            return beforeCookies.filter { $0.domain == cookie.domain && $0.path == cookie.path && $0.name == cookie.name }.first == nil
        }
        
        let updatedCookeis = cookies.compactMap { (cookie) -> HTTPCookie? in
            return beforeCookies.filter { $0.domain == cookie.domain && $0.path == cookie.path && $0.name == cookie.name }.first
        }
        
        let removedCookies = beforeCookies.filter { (cookie) -> Bool in
            return cookies.filter { $0.domain == cookie.domain && $0.path == cookie.path && $0.name == cookie.name }.first == nil
        }
        
        for (i,cookies) in [addedCookies,updatedCookeis,removedCookies].enumerated() {
            let info = i == 0 ? "added" : i == 1 ? "updated" : "removed"
            if cookies.count != 0 {
                print("\n----------\(info)----------\n")
            }
            for cookie in cookies {
                print("domain: \(cookie.domain) path: \(cookie.path) name: \(cookie.name) value: \(cookie.value) expireDate: \(cookie.expiresDate)")
            }
        }
        
        self.beforeCookies = cookies
    }
    
}
