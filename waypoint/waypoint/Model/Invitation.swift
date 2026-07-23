//
//  Invitation.swift
//  waypoint
//
//  Created by joeyi on 24/7/26.
//

import Foundation

struct Invitation: Decodable, Identifiable {
    let id: UUID
    let itinerary_id: UUID
    let created_by: UUID
    let invite_token: String
    let expires_at: Date
    let created_at: Date
}
