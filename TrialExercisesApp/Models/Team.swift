//
//  Team.swift
//  TrialExercisesApp
//
//  Created by Henrik Gustavii on 06/03/2021.
//

import Foundation

struct Team {
    enum CodingKeys: String, CodingKey {
        case name = "teamName"
        case city = "teamCity"
        case stadium = "teamStadium"
    }
    let name: String
    let city: String
    let stadium: String
}

//"teamID": "45",
//"teamName": "FC Barcelona",
//"teamStadium": "Camp Nou",
//"isNation": "FALSE",
//"teamNationality": "Spain",
//"teamCity": "Barcelona"
