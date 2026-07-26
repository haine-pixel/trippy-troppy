//
//  Activity.swift
//  waypoint
//
//  Created by joeyi on 24/7/26.
//

import Foundation

struct Activity: Decodable, Identifiable {
    let id: UUID
    let itinerary_id: UUID
    let created_by: UUID
    let type: String
    let title: String
    let address: String
    let provider: String
    let external_place_id: String
    let start_datetime: Date
    let end_datetime: Date
    let notes: String
    let display_order: Int
    let created_at: Date
    let updated_at: Date
}
