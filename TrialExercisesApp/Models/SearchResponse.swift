//
//  SearchResponse.swift
//  TrialExercisesApp
//
//  Created by Henrik Gustavii on 06/03/2021.
//

import Foundation


struct SearchResponse: Codable {
    let result: Result
    
    struct Result: Codable {
        var players: [Player]?
        var teams: [Team]?
    }
}
