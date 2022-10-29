//
//  VideoModel.swift
//  Animals in Africa
//
//  Created by APPLE on 09/10/22.
//

import Foundation

struct Video: Codable, Identifiable {
    let id: String
    let name: String
    let headline: String
    var thumbnail: String {
        "video-\(id)"
    }
}
