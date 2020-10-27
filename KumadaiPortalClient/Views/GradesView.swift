//
//  GradesView.swift
//  KumadaiPortalClient
//
//  Created by 戸高新也 on 2020/10/23.
//  Copyright © 2020 戸高新也. All rights reserved.
//

import KumadaiPortal
import SwiftUI

struct GradesView: View {
    
    @ObservedObject var gradesViwModel = GradesViewModel()
    
    var body: some View {
        List(gradesViwModel.grades, id: \.no) { grade in
            HStack {
                Text(grade.subjectName)
                Spacer()
                Text(grade.evaluation.rawValue)
            }
           
        }
        .onAppear(perform: {
            gradesViwModel.fetchData()
        })
    }
}
