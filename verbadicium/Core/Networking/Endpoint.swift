//
//  Endpoint.swift
//  verbadicium
//
//  Created by Rehan on 02/12/25.
//

import Foundation

struct Endpoint {
    let url: URL
    var request: URLRequest { URLRequest(url: url) }
}
