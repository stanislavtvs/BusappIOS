//
//  profileModel.swift
//  BusApp
//
//  Created by Jordan on 14.11.2024.
//

import Foundation

// This struct represents the user's profile.
struct ProfileModel {
    var firstName: String
    var lastName: String
    var email: String
    var profileImageURL: String?
    var phoneNumber: String?
    var bio: String?

    // Initializer to set up a new profile.
    init(firstName: String, lastName: String, email: String, profileImageURL: String? = nil, phoneNumber: String? = nil, bio: String? = nil) {
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.profileImageURL = profileImageURL
        self.phoneNumber = phoneNumber
        self.bio = bio
    }
    
    // Example of how to fetch or update a profile from a dictionary or other source
    static func fromDictionary(_ dictionary: [String: Any]) -> ProfileModel? {
        guard let firstName = dictionary["firstName"] as? String,
              let lastName = dictionary["lastName"] as? String,
              let email = dictionary["email"] as? String else {
            return nil
        }
        
        let profileImageURL = dictionary["profileImageURL"] as? String
        let phoneNumber = dictionary["phoneNumber"] as? String
        let bio = dictionary["bio"] as? String
        
        return ProfileModel(firstName: firstName, lastName: lastName, email: email, profileImageURL: profileImageURL, phoneNumber: phoneNumber, bio: bio)
    }
    
    // Convert the profile model to a dictionary for easier saving (e.g., to Firestore, a database, etc.)
    func toDictionary() -> [String: Any] {
        var dict: [String: Any] = [
            "firstName": firstName,
            "lastName": lastName,
            "email": email
        ]
        
        if let profileImageURL = profileImageURL {
            dict["profileImageURL"] = profileImageURL
        }
        
        if let phoneNumber = phoneNumber {
            dict["phoneNumber"] = phoneNumber
        }
        
        if let bio = bio {
            dict["bio"] = bio
        }
        
        return dict
    }
}
