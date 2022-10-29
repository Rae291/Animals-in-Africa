//
//  AnimalModel.swift
//  Animals in Africa
//
//  Created by APPLE on 06/10/22.
//

import Foundation

struct Animal: Codable, Identifiable {
    let id: String
    let name: String
    let pname : String
    let headline: String
    let description: String
    let link: String
    let image: String
    let gallery: [String]
    let fact: [String]
}
