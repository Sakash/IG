//
//  EndPointTypeProtocol.swift
//  IG_Assignment
//
//  Created by Sakshi Jain on 10/12/21.
//

import Foundation

public typealias HTTPHeaders = [String:String]
public typealias Parameters = [String:Any]

enum HTTPMethod: String {
    case get = "GET"
    case put = "PUT"
    case post = "POST"
    case patch = "PATCH"
    case delete = "DELETE"
}

enum HTTPTask {
    case request
    case requestParameters(bodyParameters: Parameters? , urlParameters: Parameters?)
    case requestParametersAndHeaders(bodyParameters: Parameters? , urlParameters: Parameters?, additionalHeaders: HTTPHeaders)
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

public protocol ParameterEncoder {
 static func encode(urlRequest: inout URLRequest, with parameters: Parameters) throws
}

public struct URLParameterEncoder: ParameterEncoder {
    public static func encode(urlRequest: inout URLRequest, with parameters: Parameters) throws {
        guard let url = urlRequest.url else { throw NetworkError.URLEmpty }
        
        if var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false) {
            urlComponents.queryItems = [URLQueryItem]()
            
            for (key, value) in parameters {
                let queryItem = URLQueryItem(name: key, value: "\(value)".addingPercentEncoding(withAllowedCharacters: .urlHostAllowed))
                urlComponents.queryItems?.append(queryItem)
            }
            urlRequest.url = urlComponents.url
        }
        
        if urlRequest.value(forHTTPHeaderField: "Content-type") == nil {
            urlRequest.setValue("application/x-www-form-urlencoded; charset=utf-8", forHTTPHeaderField: "Content-type")
        }
    }
}

public struct JSONParameterEncoder: ParameterEncoder {
    public static func encode(urlRequest: inout URLRequest, with parameters: Parameters) throws {
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
            urlRequest.httpBody = jsonData
            
            if urlRequest.value(forHTTPHeaderField: "Content-type") == nil {
                urlRequest.setValue("application/json", forHTTPHeaderField: "Content-type")
            }
        } catch {
            throw NetworkError.encodingError
        }
    }
}
