//
//  GradeCell.swift
//  KumadaiPortalClient
//
//  Created by 戸高新也 on 2020/10/28.
//  Copyright © 2020 戸高新也. All rights reserved.
//

import SwiftUI
import KumadaiPortal

struct GradeCell: View {
    
    let grade: Grade
    
    var body: some View {
        
        VStack(alignment: .center, spacing: 8) {
            HStack(alignment: .top){
                Text(grade.subjectName).fontWeight(.bold)
                Spacer()
                Text("\(grade.yearAndSemester)").font(.subheadline)
            }.padding(.bottom, 8)
            
            HStack() {
                Image(systemName: "\(grade.unitCount).circle")
                
                Spacer()
                
                Image(systemName: "circle.fill").foregroundColor(grade.evaluation.color)
                Text(grade.evaluation.rawValue)
                
                Spacer()
                
                Image(systemName: grade.result ? "checkmark.circle" : "circle")
            }
        }
    }
}

extension Grade.Evaluation {
    var color: Color {
        switch self {
        case .failing:
            return .gray
        case .passing:
            return .green
        case .good:
            return .orange
        case .excellent:
            return .yellow
        }
    }
}
