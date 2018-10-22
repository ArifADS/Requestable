//
//  Dictionary+QueryItems.swift
//  Requestable
//
//  Created by Arif De Sousa on 22/10/2018.
//  Copyright © 2018 adsousa. All rights reserved.
//

import Foundation

public extension Dictionary where Key == String {
    
    var queryItems: [URLQueryItem] {
        return self.flatMap { recQuery(key: $0.key, value: $0.value) }
    }
    
    private func recQuery(key: String, value: Any) -> [URLQueryItem] {
        if let v = value as? [Any] {
            return v.flatMap{ recQuery(key: key + "[]", value: $0) }
        } else {
            return [URLQueryItem(name: key, value: (value as AnyObject).description)]
        }
    }
}
