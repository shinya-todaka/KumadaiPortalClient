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
    
    var body: some View {
        GeometryReader { geometry in
            HStack(alignment: .center, spacing: 0) {
                
                ForEach(0..<5, id: \.self) { column in
                    
                    VStack(alignment: .center, spacing: 0) {
                        
                        ForEach(0..<7, id: \.self) { row in
                            
                            if let periods = viewModel.timetable[safe: column], let period = periods?[safe: row] {
                                PeriodCell(period: period).frame(width: geometry.size.width / 5, height: geometry.size.height / 7, alignment: .center).border(Color.black)
                            } else {
                                Color.white.frame(width: geometry.size.width / 5, height: geometry.size.height / 7, alignment: .center).border(Color.black)
                            }
                        }
                    }
                }
            }
        }.navigationTitle("TimeTable")
        .onAppear(perform: {
            viewModel.fetchData()
        })
    }
}
