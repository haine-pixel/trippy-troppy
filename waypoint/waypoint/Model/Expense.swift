//
//  Expense.swift
//  waypoint
//
//  Created by joeyi on 24/7/26.
//

import Foundation

struct Expense: Decodable, Identifiable {
    let id: UUID
    let itinerary_id: UUID
    let activity_id: UUID
    let paid_by: UUID
    let title: String
    let amount: Double
    let currency: String
    let expense_date: Date
    let receipt_url: String
    let notes: String
    let created_at: Date
}
