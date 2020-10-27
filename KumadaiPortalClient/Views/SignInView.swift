//
//  SignInView.swift
//  KumadaiPortalClient
//
//  Created by 戸高新也 on 2020/10/23.
//  Copyright © 2020 戸高新也. All rights reserved.
//

import Combine
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
            LoginView()
        }
    }
}

struct LoginView: View {
    
    @State var username: String = ""
    @State var password: String = ""
    
    @EnvironmentObject var authService: AuthenticationService
     
    var body: some View {
        VStack(alignment: .center, spacing: 50) {
            
            Text("KumadaiPortal")
                .font(.system(size: 20, weight: .heavy))
            
            VStack(spacing: 24) {
                
                TextField("username", text: $username)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(maxWidth: 200)
                
                SecureField("password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(maxWidth: 200)
                
                Button(action: {
                    authService.login(username: username, password: password)
                }, label: {
                    Text("Login")
                        .fontWeight(.medium)
                        .frame(minWidth: 160)
                        .foregroundColor(.white)
                        .padding(12)
                        .background(Color.accentColor)
                        .cornerRadius(8)
                })
            }
        }
    }
}
