//
//  Player.swift
//  TrialExercisesApp
//
//  Created by Henrik Gustavii on 06/03/2021.
//

import Foundation

struct Player: Codable, Identifiable {
    enum CodingKeys: String, CodingKey {
        case id = "playerID"
        case firstName = "playerFirstName"
        case surname = "playerSecondName"
        case age = "playerAge"
        case club = "playerClub"
    }
    
    let id: String
    let firstName: String
    let surname: String
    let age: String
    let club: String
    
}

extension Player {
    static var data: [Player] {
        [
            Player(id: "1", firstName: "Robert", surname: "Lewandowski", age: "33", club: "Bayern Munich"),
            Player(id: "2", firstName: "Lionel", surname: "Messi", age: "34", club: "Barcelona"),
            Player(id: "3", firstName: "Cristian", surname: "Ronaldo", age: "36", club: "Juventus")
        ]
    }
}

//    "playerID": "236626",
//    "playerFirstName": "Sergio",
//    "playerSecondName": "Ruiz Barcelona",
//    "playerNationality": "Spanish",
//    "playerAge": "33",
//    "playerClub": "Unknown"
