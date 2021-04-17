//
//  RequestData.swift
//  FoodDelivery
//
//  Created by Ganesh Somani on 17/04/21.
//

import Foundation

public enum HTTPMethod: String {
    case get = "GET"
    case put = "PUT"
    case post = "POST"
    case delete = "DELETE"
}

public protocol RequestData {
    var path: String { get }
    var method: HTTPMethod { get }
    var params: [String: Any?]? { get }
    var headers: [String: String]? { get }
}

extension RequestData {
    var method: HTTPMethod {
        return .get
    }
    
    var params: [String: Any?]? {
        return nil
    }
    
    var headers: [String: String]? {
        return nil
    }
}
