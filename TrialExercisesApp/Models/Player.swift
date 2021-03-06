//
//  Player.swift
//  TrialExercisesApp
//
//  Created by Henrik Gustavii on 06/03/2021.
//

import Foundation

struct Player: Codable {
    enum CodingKeys: String, CodingKey {
        case firstName = "playerFirstName"
        case surname = "playerSecondName"
        case age = "playerAge"
        case club = "playerClub"
    }
    
    let firstName: String
    let surname: String
    let age: Int
    let club: String
    
}

//    "playerID": "236626",
//    "playerFirstName": "Sergio",
//    "playerSecondName": "Ruiz Barcelona",
//    "playerNationality": "Spanish",
//    "playerAge": "33",
//    "playerClub": "Unknown"
