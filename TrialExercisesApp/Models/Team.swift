//
//  Team.swift
//  TrialExercisesApp
//
//  Created by Henrik Gustavii on 06/03/2021.
//

import Foundation

struct Team: Codable, Identifiable {
    enum CodingKeys: String, CodingKey {
        case name = "teamName"
        case city = "teamCity"
        case stadium = "teamStadium"
    }
    let id = UUID()
    let name: String
    let city: String
    let stadium: String
}

extension Team {
    static var data: [Team] {
        [
            Team(name: "Bayern Munich", city: "Munich", stadium: "Allianz Arena"),
            Team(name: "Manchester City", city: "Manchester", stadium: "Etihad Stadium"),
            Team(name: "Inter Milan", city: "Milan", stadium: "San Siro Stadium")
        ]
    }
}

//"teamID": "45",
//"teamName": "FC Barcelona",
//"teamStadium": "Camp Nou",
//"isNation": "FALSE",
//"teamNationality": "Spain",
//"teamCity": "Barcelona"
