//
//  Saved_place.swift
//  waypoint
//
//  Created by joeyi on 24/7/26.
//

import Foundation

struct SavedPlaces: Decodable, Identifiable {
    let id: UUID
    let user_id: UUID
    let provider: String
    let external_place_id: String
    let name: String
    let address: String
    let created_at: Date
}
