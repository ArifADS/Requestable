//
//  MockRequestable.swift
//  Requestable
//
//  Created by Arif De Sousa on 31/10/2019.
//  Copyright © 2019 adsousa. All rights reserved.
//

import Foundation

public protocol MockRequestable: Requestable {
  var resourceName: String { get }
  var extensionName: String { get }
}

public extension MockRequestable {
  var baseURL: String { return "" }
  var path: String { return "" }
  var query: [String : Any]? { nil }
  var method: HTTPMethod { .get }
  var body: Data? { nil }
  var headers: [String : String]? { nil }
  var extensionName: String { "json" }
  
  func request() -> URLRequest {
    let url = Bundle.main.url(forResource: resourceName, withExtension: extensionName)!
    return URLRequest(url: url)
  }
}
