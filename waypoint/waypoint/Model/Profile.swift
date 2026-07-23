//
//  profiles.swift
//  waypoint
//
//  Created by joeyi on 24/7/26.
//

import Foundation
import Supabase

// codable -> read n write
// decodable -> read
// encodable -> write
struct Profile: Codable, Identifiable {
    let id: UUID
    let first_name: String
    let last_name: String
    let email: String
    let phone: String
    let avatar_url: String
    let password: String
    let created_at: Date
    let updated_at: Date
}



// -- example
// country code maybe can detect by ip add, unless add an attri for country code
/*
func addNewProfile() async {
    let now = Date()
    
    let newProfile = Profile(
        id: UUID(),
        first_name: "Joe",
        last_name: "Ng",
        email: "joeyi2004ng@gmail.com",
        phone: "88222337",
        avatar_url: "www.x.com",
        created_at: now,
        updated_at: now
    )
    
    do {
        try await supabase
            .from("profiles")
            .insert(newProfile)
            .execute()
        print("Successfully added profiles")
    } catch {
        print("Error inserting data: \(error)")
    }
}
*/
