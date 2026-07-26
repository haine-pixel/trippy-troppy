//
//  Expense_split.swift
//  waypoint
//
//  Created by joeyi on 24/7/26.
//

import Foundation

struct Expense_split: Decodable, Identifiable {
    let id: UUID
    let expense_id: UUID
    let user_id: UUID
    let amount: Double
    let status: String
}
