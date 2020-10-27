//
//  Mocks.swift
//  KumadaiPortalClient
//
//  Created by 戸高新也 on 2020/10/22.
//  Copyright © 2020 戸高新也. All rights reserved.
//

import KumadaiPortal

extension KumadaiPortal {
    static var mockTimetable: [[Period?]?] = [
        [.init(courses: [.init(courseId: "1", name: "原子力工学", lms: 2)]),
         .init(courses: [.init(courseId: "2", name: "流体機械", lms: 2)]),
         nil,
         nil,
         nil,
         nil,
         nil
        ],
        [.init(courses: [.init(courseId: "3", name: "熱力学第二", lms: 2)]),
         .init(courses: [.init(courseId: "4", name: "制御工学第二", lms: 2)]),
         .init(courses: [.init(courseId: "5", name: "設計製図", lms: 2)]),
         .init(courses: [.init(courseId: "6", name: "設計製図", lms: 2)]),
         nil,
         nil,
         nil],
        [nil,
         nil,
         nil,
         nil,
         nil,
         nil,
         nil],
        [.init(courses: [.init(courseId: "7", name: "流体機械", lms: 2)]),
         .init(courses: [.init(courseId: "8", name: "原子力工学", lms: 2)]),
         nil,
         nil,
         nil,
         nil,
         nil],
        [.init(courses: [.init(courseId: "9", name: "制御第二", lms: 2)]),
         .init(courses: [.init(courseId: "10", name: "熱力学第二", lms: 2)]),
         nil,
         nil,
         nil,
         nil,
         nil
        ]
    ]
}

extension KumadaiPortal {
    static let mockGrades: [Grade?] = [
        Grade(no: "1", subjectName: "原子力工学", unitCount: "2", yearAndSemester: "2020 / 後期", evaluation: "優", result: "合"),
        Grade(no: "2", subjectName: "熱力学第二", unitCount: "3", yearAndSemester: "2020 / 後期", evaluation: "秀", result: "不可")
        ]
}
