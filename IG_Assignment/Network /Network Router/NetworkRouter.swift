//
//  NetworkRouter.swift
//  IG_Assignment
//
//  Created by Sakshi Jain on 11/12/21.
//

import Foundation

public typealias NetworkRouterCompletion = (_ data: Data?, _ response: URLResponse?, _ error: Error?) -> Void

protocol NetworkRouter: AnyObject {
    associatedtype EndPoint: EndPointTypeProtocol
    
    func request(_ route: EndPoint, completion: @escaping NetworkRouterCompletion)
    func cancel()
}
