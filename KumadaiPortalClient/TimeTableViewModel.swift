//
//  TimeTableViewModel.swift
//  KumadaiPortalClient
//
//  Created by 戸高新也 on 2020/10/22.
//  Copyright © 2020 戸高新也. All rights reserved.
//

import Foundation
import KumadaiPortal
import Combine

class TimeTableViewModel: ObservableObject {
    @Published var timetable: [[Period?]?] = []
    @Published var timeTableError: Error?
    
    let semester: Semester
    
    enum Semester {
        case first
        case second
    }
    
    func fetchData() {
        KumadaiPortal.shared.getTimeTable { (timetableResponse, error) in
            if let error = error {
                self.timeTableError = error
                return
            }
            
            DispatchQueue.main.async {
                if let timetable = timetableResponse?.courses._2020?.second?.timetable {
                    self.timetable = timetable
                }
            }
            
        }
    }
    
    init(semester: Semester) {
        self.semester = semester
    }
}
