//
//  URLRequest+cURL.swift
//  Requestable
//
//  Created by Arif De Sousa on 22/10/2018.
//  Copyright © 2018 adsousa. All rights reserved.
//

import Foundation

extension URLRequest {
    public var cURL: String {
        guard let url = self.url else { return "" }
        var baseCommand = "curl \(url.absoluteString)"
        
        if self.httpMethod == "HEAD" {
            baseCommand += " --head"
        }
        
        var command = [baseCommand]
        
        if let method = self.httpMethod, method != "GET" && method != "HEAD" {
            command.append("-X \(method)")
        }
        
        if let headers = self.allHTTPHeaderFields {
            for (key, value) in headers where key != "Cookie" {
                command.append("-H '\(key): \(value)'")
            }
        }
        
        if let data = self.httpBody, let body = String(data: data, encoding: .utf8) {
            command.append("-d '\(body)'")
        }
        
        return command.joined(separator: " \\\n\t")
    }
}


