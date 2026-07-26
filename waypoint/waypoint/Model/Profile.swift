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
    let avatar_url: String
    let password: String
    let created_at: Date
    let updated_at: Date
}

// GET a user, can use to check if user exists, retrieves user info
func getProfileByID(id: UUID) async -> Profile? {
    do {
        let profile: Profile = try await supabase
            .from("profiles")
            .select()
            .eq("id", value: id)
            .single()
            .execute()
            .value
        
        return profile
        
    } catch {
        print("Error retrieving data: \(error)")
        
        return nil
    }
}

//GET all users
func getProfiles() async -> [Profile]? {
    do {
        let profiles: [Profile] = try await supabase
            .from("profiles")
            .select()
            .execute()
            .value
        
        return profiles
    } catch {
        print("Error retrieving data: \(error)")
        
        return nil
    }
}

// -- POST a profile
func createProfile(id: UUID, first_name: String, last_name: String, email: String, avatar_url: String, password: String) async -> Bool {
    let profile = Profile(id: id, first_name: first_name, last_name: last_name, email: email, avatar_url: avatar_url, password: password, created_at: Date(), updated_at: Date())
    
    do {
        try await supabase
            .from("profiles")
            .insert(profile)
            .execute()
        
        return true
    } catch {
        print("Error creating profile: \(error)")

        return false
    }
}

/*
 func updateProfile(id: UUID, phone_number: String? = nil, email: String? = nil) async -> Bool {
    // initialise an empty dict -> [:], [String: String] means it could be Phone_number -> Value
    var updates: [String: String] = [:]
    
    if let phone_number = phone_number {
        updates["phone_number"] = phone_number
    }
    
    if let email = email {
        updates["email"] = email
    }
    
    // if both value = nil
    if updates.isEmpty {
        return true
    }
    
    do {
        try await supabase
            .from("profiles")
            .update(updates)
            .eq("id", value: id)
            .execute()
        
        return true
    } catch {
        print("Error updating profile: \(error)")

        return false
    }
}


func updatePhone(id: UUID, phone_number: String) async -> Bool {
    do {
        try await supabase
            .from("profiles")
            .update(["phone_number": phone_number])
            .eq("id", value: id)
            .execute()
        
        return true
    } catch {
        print("Error updating phone number: \(error)")

        return false
    }
}
 */

// -- PUT user's email
func updateEmail(id: UUID, email: String) async -> Bool {
    do {
        try await supabase
            .from("profiles")
            .update(["email": email])
            .eq("id", value: id)
            .execute()
        
        return true
    } catch {
        print("Error updating email: \(error)")

        return false
    }
}
 

// -- DELETE a profile
func deleteProfile(id: UUID) async -> Bool {
    do {
        try await supabase
            .from("profiles")
            .delete()
            .eq("id", value: id)
            .execute()
        
        return true
    } catch {
        print("Error deleting profile: \(error)")

        return false
    }
}

// -- example for PUT
/*
 try await supabase
   .from("instruments")
   .update(["name": "piano"])
   .eq("id", value: 1)
   .execute()
 */

// -- example for POST
/*
 struct Instrument: Encodable {
   let id: Int
   let name: String
 }

 let instrument = Instrument(id: 1, name: "ukelele")

 try await supabase
   .from("instruments")
   .insert(instrument)
   .execute()
 */


// -- example for GET
/*
 struct Instrument: Decodable {
   let id: Int
   let name: String
 }

 let instruments: [Instrument] = try await supabase
   .from("instruments")
   .select()
   .execute()
   .value
 */

// -- example for POST
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
