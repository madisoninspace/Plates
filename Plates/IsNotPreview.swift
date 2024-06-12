//
//  IsNotPreview.swift
//  Plates
//
//  Created by Madison L.H. Wass on 6/11/24.
//  Copyright © 2024 Madison L.H. Wass. All rights reserved.
//

import Foundation

var isNotPreview: Bool {
    if ProcessInfo.processInfo.environment["XCODE_RUNNING_FOR_PREVIEWS"] != "1" {
        return true
    } else {
        return false
    }
}
