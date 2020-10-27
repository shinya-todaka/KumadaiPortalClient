//
//  RootView.swift
//  KumadaiPortalClient
//
//  Created by 戸高新也 on 2020/10/28.
//  Copyright © 2020 戸高新也. All rights reserved.
//

import SwiftUI

struct RootView: View {
    
    @EnvironmentObject var authService: AuthenticationService
    
    var body: some View{
        switch authService.authState {
        case .pending:
            Text("pending")
        case .authenticated:
            ContentView()
        case .notAuthenticated:
            SignInView()
        }
    }
}
