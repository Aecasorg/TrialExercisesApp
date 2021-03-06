//
//  MTCMobileTrialsAPI.swift
//  TrialExercisesApp
//
//  Created by Henrik Gustavii on 06/03/2021.
//

import Foundation
import Moya

enum MTCMobileTrialsAPIService {
    case search(searchString: String)
    
    static let provider = MoyaProvider<MTCMobileTrialsAPIService>()
}

extension MTCMobileTrialsAPIService: TargetType {
    var baseURL: URL {
        return URL(string: "https://trials.mtcmobile.co.uk")!
    }
    
    var path: String {
        switch self {
        case .search:
            return "/api/football/1.0/search"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .search:
            return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .search(let searchString):
            return .requestParameters(parameters: ["searchString": searchString], encoding: URLEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        return ["Content-type": "application/json"]
    }
    
    
}
