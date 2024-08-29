//
//  Environment.swift
//  BhagavadGita
//
//  Created by Saketh Reddy on 26/08/24.
//

import Foundation

// MARK: - Environment Struct

/// A struct to handle environment-specific configurations loaded from the `Info.plist` file.
public struct Environment {
    
    // MARK: - Private Properties
    
    /// Dictionary representation of the `Info.plist` file.
    fileprivate var infoDict: [String: Any]  {
        get {
            if let dict = Bundle.main.infoDictionary {
                return dict
            } else {
                fatalError("Plist file not found")
            }
        }
    }
    
    // MARK: - Public Methods
    
    /// Retrieves configuration values from the `Info.plist` based on the provided key.
    /// - Parameter key: The key to look up in the `Info.plist`.
    /// - Returns: The configuration value as a `String`.
    public func configuration(_ key: PlistKey) -> String {
        switch key {
        case .baseURL:
            guard let baseURL = infoDict[PlistKey.baseURL.value()] as? String else { return "" }
            return baseURL
        case .kHostHeader:
            guard let hostHeaderK = infoDict[PlistKey.kHostHeader.value()] as? String else { return "" }
            return hostHeaderK
        case .vHostHeader:
            guard let hostHeaderV = infoDict[PlistKey.vHostHeader.value()] as? String else { return "" }
            return hostHeaderV
        case .kKeyHeader:
            guard let keyHeaderK = infoDict[PlistKey.kKeyHeader.value()] as? String else { return "" }
            return keyHeaderK
        case .vKeyHeader:
            guard let keyHeaderV = infoDict[PlistKey.vKeyHeader.value()] as? String else { return "" }
            return keyHeaderV
        case.settingUpScene:
            guard let sceneSetUp = infoDict[PlistKey.settingUpScene.value()] as? Array<Any>,
                  let paragraphs = NSArray(array: sceneSetUp) as? [String]
            else { return "" }
            let fullText = paragraphs.joined(separator: "\n\n")
            return fullText
        }
    }
}
