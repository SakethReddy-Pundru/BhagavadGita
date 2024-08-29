//
//  HTTPMethod.swift
//  BhagavadGita
//
//  Created by Saketh Reddy on 26/08/24.
//

import Foundation

// MARK: - HTTPMethod Struct

/// A struct representing HTTP methods, conforming to `RawRepresentable`, `Equatable`, and `Hashable`.
struct HTTPMethod: RawRepresentable, Equatable, Hashable {
    
    // MARK: - HTTP Method Constants
    
    static let connect = HTTPMethod(rawValue: "CONNECT")
    static let delete = HTTPMethod(rawValue: "DELETE")
    static let get = HTTPMethod(rawValue: "GET")
    static let post = HTTPMethod(rawValue: "POST")
    static let put = HTTPMethod(rawValue: "PUT")
    
    let rawValue: String
    
    // MARK: - Initializer
    
    /// Initializes an `HTTPMethod` with the given raw string value.
    /// - Parameter rawValue: The raw string value of the HTTP method.
    init(rawValue: String) {
        self.rawValue = rawValue
    }
}
