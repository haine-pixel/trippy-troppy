//
//  profiles.swift
//  waypoint
//
//  Created by joeyi on 24/7/26.
//

import Foundation

struct Profile: Decodable, Identifiable {
    let id: UUID
    let first_name: String
    let last_name: String
    let email: String
    let phone: String
    let avatar_url: String
    let created_at: Date
    let updated_at: Date
}
