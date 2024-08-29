//
//  ChaptersModel.swift
//  BhagavadGita
//
//  Created by Saketh Reddy on 26/08/24.
//

import Foundation

// MARK: - Chapters Struct

struct Chapters: Codable {
    
    // MARK: Properties
    
    let id: Int
    let name, slug, nameTransliterated, nameTranslated: String
    let versesCount, chapterNumber: Int
    let nameMeaning, chapterSummary, chapterSummaryHindi: String
    
    // MARK: CodingKeys Enum
    
    enum CodingKeys: String, CodingKey {
        case id, name, slug
        case nameTransliterated = "name_transliterated"
        case nameTranslated = "name_translated"
        case versesCount = "verses_count"
        case chapterNumber = "chapter_number"
        case nameMeaning = "name_meaning"
        case chapterSummary = "chapter_summary"
        case chapterSummaryHindi = "chapter_summary_hindi"
    }
}
