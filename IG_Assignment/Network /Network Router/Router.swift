//
//  Router.swift
//  IG_Assignment
//
//  Created by Sakshi Jain on 11/12/21.
//

import Foundation

class Router<EndPoint: EndPointTypeProtocol>: NetworkRouter {
    private var task: URLSessionTask?
    
    func request(_ route: EndPoint, completion: @escaping NetworkRouterCompletion) {
        let session = URLSession.shared
        do {
            let request = try self.buildRequest(from: route)
            task = session.dataTask(with: request, completionHandler: { data, response, error in
                completion(data, response, error)
            })
        } catch {
            completion(nil, nil, error)
        }
        self.task?.resume()
    }
    
    private func buildRequest(from route: EndPoint) throws -> URLRequest {
        let url = route.baseUrl.appendingPathComponent(route.path)
        var request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalAndRemoteCacheData, timeoutInterval: 10.0)
        
        request.httpMethod = route.httpMethod.rawValue
        
        do {
            
            switch route.task {
            case .request:
                request.setValue("application/json", forHTTPHeaderField: "Content-type")
            case .requestParameters(let bodyParameters,
                                    let urlParameters):
                try self.configureParameters(bodyParameters: bodyParameters, urlParameters: urlParameters, request: &request)
            case .requestParametersAndHeaders(let bodyParameters,
                                              let urlParameters,
                                              let additionalHeaders):
                
                self.addAdditionalHeaders(additionalheaders: additionalHeaders, request: &request)
                try self.configureParameters(bodyParameters: bodyParameters, urlParameters: urlParameters, request: &request)
            }
            return request
        } catch {
            throw error
        }
    }
    
    fileprivate func configureParameters(bodyParameters: Parameters?, urlParameters: Parameters?, request: inout URLRequest) throws {
        do {
            if let bodyParameters = bodyParameters {
                try JSONParameterEncoder.encode(urlRequest: &request, with: bodyParameters)
            }
            
            if let urlParameters = urlParameters {
                try JSONParameterEncoder.encode(urlRequest: &request, with: urlParameters)
            }
        } catch {
            throw error
        }
    }
    
    fileprivate func addAdditionalHeaders(additionalheaders: HTTPHeaders?, request: inout URLRequest) {
        guard let additionalheaders = additionalheaders else {
            return
        }
        
        for (key, value) in additionalheaders {
            request.setValue(value, forHTTPHeaderField: key)
        }
    }
    
    func cancel() {
        self.task?.cancel()
    }
}
