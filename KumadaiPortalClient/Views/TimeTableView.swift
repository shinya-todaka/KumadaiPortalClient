//
//  TimeTableView.swift
//  KumadaiPortalClient
//
//  Created by 戸高新也 on 2020/10/23.
//  Copyright © 2020 戸高新也. All rights reserved.
//

import KumadaiPortal
import SwiftUI

struct TimeTableView: View {
    
    @ObservedObject var viewModel = TimeTableViewModel(semester: .second)
    let weeks = ["月", "火", "水", "木", "金"]
    
    var body: some View {
        
        Group {
            if viewModel.isLoading {
                ProgressView()
            } else {
                TimeTable(timeTable: viewModel.timetable)
            }
        }
        .onAppear(perform: {
            viewModel.fetchData()
        })
    }
}


