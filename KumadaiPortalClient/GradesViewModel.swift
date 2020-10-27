//
//  GradesViewModel.swift
//  KumadaiPortalClient
//
//  Created by 戸高新也 on 2020/10/23.
//  Copyright © 2020 戸高新也. All rights reserved.
//

import Foundation
import KumadaiPortal
import Combine

class GradesViewModel: ObservableObject {
    @Published var grades: [Grade] = []
    @Published var timeTableError: Error?
    
    func fetchData() {
        KumadaiPortal.shared.getSeiseki { (grades, error) in
            if let error = error {
                
                print(error)
                DispatchQueue.main.async {
                    self.timeTableError = error
                }
                return
            }
            
            if let grades = grades {
                
                DispatchQueue.main.async {
                    self.grades = grades
                }
            }
        }
    }
}
