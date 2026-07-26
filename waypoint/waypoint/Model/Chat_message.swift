//
//  Chat_messages.swift
//  waypoint
//
//  Created by joeyi on 24/7/26.
//

import Foundation

struct ChatMessage: Decodable, Identifiable {
    let id: UUID
    let user_id: UUID
    let role: String
    let message: String
    let created_at: Date
}
