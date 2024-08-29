//
//  NetworkManager.swift
//  BhagavadGita
//
//  Created by Saketh Reddy on 26/08/24.
//

import Foundation

// MARK: - NetworkService Protocol

/// Protocol defining the requirements for making a clean API call.
protocol NetworkService {
    
    /// Makes a clean API call with the specified parameters.
    /// - Parameters:
    ///   - url: The URL for the API call.
    ///   - httpMethod: The HTTP method to use (e.g., GET, POST).
    ///   - headers: A dictionary of headers to include in the request.
    ///   - returnType: The expected return type for decoding the response.
    ///   - completion: A closure that gets called with the result of the API call.
    func makeCleanAPICall<T:Decodable>(
        url: URL,
        httpMethod: HTTPMethod,
        headers: [String: String],
        returnType: T.Type,
        completion: @escaping(Result<T, Error>) -> Void)
}

// MARK: - NetworkManager Class

/// Singleton class that implements the `NetworkService` protocol to handle network requests.
class NetworkManager: NetworkService {
    
    // MARK: - Singleton Instance
    
    /// Shared instance of `NetworkManager` to be used across the app.
    static let sharedInstance : NetworkManager = NetworkManager()
    
    // MARK: - Network Call Method
    
    /// Makes a clean API call with the specified parameters.
    /// - Parameters:
    ///   - url: The URL for the API call.
    ///   - httpMethod: The HTTP method to use (e.g., GET, POST).
    ///   - headers: A dictionary of headers to include in the request.
    ///   - returnType: The expected return type for decoding the response.
    ///   - completion: A closure that gets called with the result of the API call.
    func makeCleanAPICall<T>(
        url: URL,
        httpMethod: HTTPMethod,
        headers: [String : String],
        returnType: T.Type,
        completion: @escaping (Result<T, Error>) -> Void) where T : Decodable
    {
        var request = URLRequest(url: url)
        request.httpMethod = httpMethod.rawValue
        request.allHTTPHeaderFields = headers
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let data = data else {
                completion(.failure(NetworkError.noData))
                return
            }
            do {
                let apiResponse = try JSONDecoder().decode(returnType, from: data)
                completion(.success(apiResponse))
            } catch {
                completion(.failure(NetworkError.noData))
            }
        }
        
        task.resume()
    }
}

// MARK: - NetworkError Enum

/// Enum representing potential errors during a network request.
enum NetworkError: Error {
    case invalidURL
    case noData
}
