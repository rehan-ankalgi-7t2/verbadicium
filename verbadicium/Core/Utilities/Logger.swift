//
//  Untitled.swift
//  verbadicium
//
//  Created by Rehan on 02/12/25.
//

import Foundation

enum Logger {
    static func log(_ items: Any...) {
        #if DEBUG
        print(items.map{ _ in "\\($0)" }.joined(separator: " "))
        #endif
    }
}
