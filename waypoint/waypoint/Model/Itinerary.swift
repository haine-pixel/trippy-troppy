//
//  Itineraries.swift
//  waypoint
//
//  Created by joeyi on 24/7/26.
//

import Foundation

struct Itinerary: Decodable, Identifiable {
    let id: UUID
    let owner_id: UUID
    let title: String
    let description: String
    let start_date: Date
    let end_date: Date
    let cover_image: String
    let created_at: Date
    let updated_at: Date
}
