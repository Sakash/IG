//
//  NewsEndPoint.swift
//  IG_Assignment
//
//  Created by Sakshi Jain on 10/12/21.
//

import Foundation

enum NetworkEnvironment {
    case test
    case production
    case staging
}

public enum DashboardApi {
    case dashboard
}

extension DashboardApi: EndPointType {
    
    var environmentBaseURL: String {
        switch NetworkManager.environment {
        case .production: return "https://content.dailyfx.com/api/v1/"
        case .test: return "https://content.dailyfx.com/api/v1/"
        case .staging: return "https://content.dailyfx.com/api/v1/"
        }
    }
    
    var baseURL: URL {
        guard let url = URL(string: environmentBaseURL) else { fatalError("baseURL could not be configured.")}
        return url
    }
    
    var path: String {
        switch self {
        case .dashboard:
            return "dashboard"
        }
    }
    
    var httpMethod: HTTPMethod {
        return .get
    }
    
    var task: HTTPTask {
        switch self {
        case .dashboard:
            return .request
        }
    }
    
    var headers: HTTPHeaders? {
        return nil
    }
}
