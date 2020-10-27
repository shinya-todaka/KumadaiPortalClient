//
//  Array+safeSubscript.swift
//  KumadaiPortalClient
//
//  Created by 戸高新也 on 2020/10/22.
//  Copyright © 2020 戸高新也. All rights reserved.
//

extension Array {
    subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
