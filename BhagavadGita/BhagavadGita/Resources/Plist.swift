//
//  Plist.swift
//  BhagavadGita
//
//  Created by Saketh Reddy on 26/08/24.
//

import Foundation

// MARK: - PlistKey Enum

/// Enum to define the keys used to access values in the `Info.plist` file.
public enum PlistKey {
    case baseURL
    case kHostHeader
    case vHostHeader
    case kKeyHeader
    case vKeyHeader
    case settingUpScene
    
    // MARK: - Methods
    
    /// Provides the string representation of each `PlistKey`.
    /// - Returns: The corresponding key as a `String`.
    func value() -> String {
        switch self {
        case .baseURL:
            return "baseURL"
        case .kHostHeader:
            return "kHostHeader"
        case .vHostHeader:
            return "vHostHeader"
        case .kKeyHeader:
            return "kKeyHeader"
        case .vKeyHeader:
            return "vKeyHeader"
        case .settingUpScene:
            return "bhagavad_gita_scene"
        }
    }
}
