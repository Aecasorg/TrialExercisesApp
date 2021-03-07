//
//  Team.swift
//  TrialExercisesApp
//
//  Created by Henrik Gustavii on 06/03/2021.
//

import Foundation

struct Team: Codable, Identifiable {
    enum CodingKeys: String, CodingKey {
        case id = "teamID"
        case name = "teamName"
        case city = "teamCity"
        case stadium = "teamStadium"
    }
    let id: String
    let name: String
    let city: String
    let stadium: String
}

extension Team {
    static var data: [Team] {
        [
            Team(id: "4", name: "Bayern Munich", city: "Munich", stadium: "Allianz Arena"),
            Team(id: "5", name: "Manchester City", city: "Manchester", stadium: "Etihad Stadium"),
            Team(id: "6", name: "Inter Milan", city: "Milan", stadium: "San Siro Stadium")
        ]
    }
}

//"teamID": "45",
//"teamName": "FC Barcelona",
//"teamStadium": "Camp Nou",
//"isNation": "FALSE",
//"teamNationality": "Spain",
//"teamCity": "Barcelona"
