//
//  PeriodCell.swift
//  KumadaiPortalClient
//
//  Created by 戸高新也 on 2020/10/28.
//  Copyright © 2020 戸高新也. All rights reserved.
//

import KumadaiPortal
import SwiftUI

struct PeriodCell: View {
    let period: Period?
    var body: some View {
        if let name = period?.courses.first?.name {
            Text(name)
        } else {
            Color.white
        }
    }
}
