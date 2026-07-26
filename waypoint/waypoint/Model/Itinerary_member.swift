//
//  Itinerary_members.swift
//  waypoint
//
//  Created by joeyi on 24/7/26.
//

import Foundation

struct ItineraryMember: Decodable, Identifiable {
    let id: UUID
    let itinerary_id: UUID
    let user_id: UUID
    let role: String
    let joined_at: Date
}

