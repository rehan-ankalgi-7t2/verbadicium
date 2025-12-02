//
//  Extensions.swift
//  verbadicium
//
//  Created by Rehan on 02/12/25.
//

import Foundation
import SwiftUI

extension String {
    var isBlank: Bool { trimmingCharacters(in: .whitespacesAndNewlines).isEmpty }
}

extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
