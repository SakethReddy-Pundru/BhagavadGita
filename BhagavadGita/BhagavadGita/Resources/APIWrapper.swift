//
//  APIWrapper.swift
//  BhagavadGita
//
//  Created by Saketh Reddy on 26/08/24.
//

import Foundation

// MARK: - API Enum

/// Enum to manage API endpoints and base URLs.
enum API {
    static var baseURL: String {
        let environment = Environment()
        // Retrieve base URL from environment configuration and clean up backslashes.
        return environment.configuration(PlistKey.baseURL).replacingOccurrences(of: "\\", with: "")
    }
}

// MARK: - Headers Enum

/// Enum to manage API headers.
enum Headers {
    static var baseURL: String {
        return Environment().configuration(PlistKey.baseURL).replacingOccurrences(of: "\\", with: "")
    }
    static var kHostHeader: String {
        return Environment().configuration(PlistKey.kHostHeader).replacingOccurrences(of: "\\", with: "")
    }
    static var vHostHeader: String {
        return Environment().configuration(PlistKey.vHostHeader).replacingOccurrences(of: "\\", with: "")
    }
    static var kKeyHeader: String {
        return Environment().configuration(PlistKey.kKeyHeader).replacingOccurrences(of: "\\", with: "")
    }
    static var vKeyHeader: String {
        return Environment().configuration(PlistKey.vKeyHeader).replacingOccurrences(of: "\\", with: "")
    }
}

// MARK: - LongText Enum

/// Enum to manage long text values.
enum LongText {
    static var bagavadhGitaSceneSetUp: String {
        return Environment().configuration(PlistKey.settingUpScene)
    }
}
