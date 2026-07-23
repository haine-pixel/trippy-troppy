//
//  Flight.swift
//  waypoint
//
//  Created by joeyi on 24/7/26.
//

import Foundation

struct Flight: Decodable, Identifiable {
    let id: UUID
    let airline: String
    let flight_number: String
    let departure_airport: String
    let arrival_airport: String
    let departure_terminal: String
    let arrival_terminal: String
    let departure_gate: String
    let arrival_gate: String
    let seat: String
    let booking_reference: String
    let created_at: Date
}
