//
//  Requestable.swift
//  Requestable
//
//  Created by Arif De Sousa on 22/10/2018.
//  Copyright © 2018 adsousa. All rights reserved.
//

import Foundation

public enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

public protocol Requestable {
    var baseURL: String { get }
    var path: String { get }
    var query: [String: Any]? { get }
    var method: HTTPMethod { get }
    var body: Data? { get }
    var headers: [String: String]? { get }
    func request() -> URLRequest
}

public extension Requestable {
    
    func request() -> URLRequest {
        var comps = URLComponents(string: baseURL)!
        comps.path = path
        comps.queryItems = query?.queryItems
        
        var req = URLRequest(url: comps.url!)
        req.allHTTPHeaderFields = headers
        req.httpMethod = method.rawValue
        req.httpBody = body
        return req
    }
}
