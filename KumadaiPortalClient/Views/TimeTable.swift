//
//  TimeTable.swift
//  KumadaiPortalClient
//
//  Created by 戸高新也 on 2020/10/28.
//  Copyright © 2020 戸高新也. All rights reserved.
//

import KumadaiPortal
import SwiftUI

struct TimeTable: View {
    let firstRowItems = ["月", "火", "水", "木", "金"]
    let firstColumnItems = ["1", "2", "3", "4", "5", "6", "7"]
    
    let timeTable: [[Period?]?]
    
    var body: some View {
        GeometryReader { proxy in
            FixedSizeTable(size: proxy.size, rows: 8, columns: 6,firstRowHeight: 30, firstColumnWidth: 30, firstRowItems: firstRowItems, firstColumnItems: firstColumnItems, innerContent: { innerRow, innerColumn in
                if let periods = timeTable[safe: innerColumn].flatMap{ $0 }  {
                    if let period = periods[safe: innerRow] {
                        PeriodCell(period: period)
                    }
                }
            })
        }
    }
}
