//
//  AppEnvironment.swift
//  verbadicium
//
//  Created by Rehan on 02/12/25.
//

import Foundation

struct AppEnvironment {
    let apiBaseURL: URL

    static var `default`: AppEnvironment {
        AppEnvironment(apiBaseURL: URL(string: AppConfig.baseURL)!)
    }
}
