//
//  EndPointTypeProtocol.swift
//  IG_Assignment
//
//  Created by Sakshi Jain on 10/12/21.
//

import Foundation

public typealias HTTPHeaders = [String: String]

enum HTTPMethod: String {
    case get = "GET"
    case put = "PUT"
    case post = "POST"
    case patch = "PATCH"
    case delete = "DELETE"
}

enum HTTPTask {
    case request
    case requestParameters(bodyParameters: Parameters?, urlParameters: Parameters?)
    case requestParametersAndHeaders(bodyParameters: Parameters?, urlParameters: Parameters?, additionalHeaders: HTTPHeaders)
}

enum NetworkError: String, Error {
    case parametersNil = "Parameters were nil"
    case encodingError = "Encoding Failed"
    case URLEmpty = "URL is empty"
}

protocol EndPointTypeProtocol {
    var baseUrl: URL {get}
    var path: String {get}
    var httpMethod: HTTPMethod {get}
    var task: HTTPTask {get}
    var headers: HTTPHeaders {get}
}
