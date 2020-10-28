//
//  FixedSizeTable.swift
//  KumadaiPortalClient
//
//  Created by 戸高新也 on 2020/10/28.
//  Copyright © 2020 戸高新也. All rights reserved.
//

import SwiftUI

struct FixedSizeTable<Content: View>: View {
    let size: CGSize
    
    let rows: Int
    let columns: Int
    
    let firstRowHeight: CGFloat
    let firstColumnWidth: CGFloat
    
    let firstRowItems: [String]
    let firstColumnItems: [String]
    
    let innerContent: (Int, Int) -> Content?
    
    init(size: CGSize, rows: Int, columns: Int, firstRowHeight: CGFloat, firstColumnWidth: CGFloat, firstRowItems: [String], firstColumnItems: [String], @ViewBuilder innerContent: @escaping (Int,Int) -> Content?) {
        self.size = size
        
        self.columns = columns
        self.rows = rows
        
        self.firstColumnWidth = firstColumnWidth
        self.firstRowHeight = firstRowHeight
        
        self.firstRowItems = firstRowItems
        self.firstColumnItems = firstColumnItems
        
        self.innerContent = innerContent
    }
    
    var body: some View {
        VStack(spacing: 0){
            
            ForEach(0..<rows) { row in
                
                HStack(spacing: 0) {
                    
                    ForEach(0..<columns) { column in
                        contentForPosition(row: row, column: column)
                            .frame(width: widthForPosition(row: row, column: column), height: heightForPosition(row: row, column: column))
                            .border(Color.black, width: 0.8)
                    }
                }
            }
        }
    }
    
    private func widthForPosition(row: Int, column: Int) -> CGFloat {
        if column == 0 {
            return firstColumnWidth
        } else {
            return abs((self.size.width - firstColumnWidth) / CGFloat(self.columns - 1))
        }
    }
    
    private func heightForPosition(row: Int, column: Int) -> CGFloat {
        if row == 0 {
            return firstRowHeight
        } else {
            return abs((self.size.height - firstRowHeight) / CGFloat(self.rows - 1))
        }
    }
    
    @ViewBuilder
    private func contentForPosition(row: Int, column: Int) -> some View {
        if case (1...rows, 0) = (row, column){
            Text(firstColumnItems[row - 1])
        } else if case (0, 1...columns) = (row, column) {
            Text(firstRowItems[column - 1])
        } else if case (1...rows, 1...columns) = (row, column){
            if let innerContent = innerContent(row - 1, column - 1) {
                innerContent
            } else {
                Spacer()
            }
        } else {
            Spacer()
        }
    }
}
