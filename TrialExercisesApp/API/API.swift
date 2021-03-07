//
//  API.swift
//  TrialExercisesApp
//
//  Created by Henrik Gustavii on 06/03/2021.
//

import Foundation
import Moya

enum APIService {
    case search(searchString: String)
    case searchType(searchString: String, searchType: searchType, offset: Int)
    static let provider = MoyaProvider<APIService>()
}

enum searchType: String {
    case players
    case teams
}

extension APIService: TargetType {
    var baseURL: URL {
        return URL(string: "https://trials.mtcmobile.co.uk")!
    }
    
    var path: String {
            return "/api/football/1.0/search"
    }
    
    var method: Moya.Method {
            return .get
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .search(let searchString):
            return .requestParameters(parameters: ["searchString": searchString], encoding: URLEncoding.default)
        case .searchType(let searchString, let searchType, let offset):
            return .requestParameters(parameters: ["searchString": searchString, "searchType": searchType.rawValue, "offset": offset], encoding: URLEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        return ["Content-type": "application/json"]
    }
    
    
}
