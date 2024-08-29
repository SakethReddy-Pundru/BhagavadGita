//
//  ChaptersViewModel.swift
//  BhagavadGita
//
//  Created by Saketh Reddy on 26/08/24.
//

import Foundation

// MARK: - ChapterViewModelDelegate Protocol

protocol ChapterViewModelDelegate: AnyObject {
    func didFetchChapters(_ chapters: [Chapters])
    func didFailWithError(_ error: Error)
}

// MARK: - ChapterViewModel Class

class ChapterViewModel {
    
    // MARK: Properties
    
    private let networkService: NetworkService
    weak var delegate: ChapterViewModelDelegate?

    // MARK: Initialization
    
    init(networkService: NetworkService) {
        self.networkService = networkService
    }

    // MARK: Public Methods
    
    func loadChapters() {
        guard let url = URL(string: "\(API.baseURL)?skip=0&limit=18") else {
            self.delegate?.didFailWithError(NetworkError.invalidURL)
            return
        }
        let headers = [
            Headers.kHostHeader: Headers.vHostHeader,
            Headers.kKeyHeader: Headers.vKeyHeader
        ]
        
        networkService.makeCleanAPICall(
            url: url,
            httpMethod: .get,
            headers: headers,
            returnType: [Chapters].self)
        { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let data):
                self.delegate?.didFetchChapters(data)
            case .failure(let error):
                self.delegate?.didFailWithError(error)
            }
        }
    }
}
