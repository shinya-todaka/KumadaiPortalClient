//
//  ContentView.swift
//  KumadaiPortalClient
//
//  Created by 戸高新也 on 2020/10/21.
//  Copyright © 2020 戸高新也. All rights reserved.
//

import SwiftUI
import KumadaiPortal

struct ContentView: View {
    
    var body: some View {
        TabView {
            
            NavigationView {
                TimeTableView()
                .navigationBarTitle("時間割")
                .navigationBarTitleDisplayMode(.inline)
            }
            .tabItem {
                Image(systemName: "calendar.circle.fill")
                Text("時間割")
            }
            .tag(1)
            
            NavigationView {
                GradesView()
                .navigationBarTitle("成績")
                .navigationBarTitleDisplayMode(.inline)
            }
            .tabItem {
                Image(systemName: "table.fill")
                Text("成績")
            }.tag(2)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

