//
//  Name.swift
//  
//  Created on January 26, 2021

import Foundation

struct Name : Codable {
    
    let first : String?
    let last : String?
    let title : String?
    
    enum CodingKeys: String, CodingKey {
        case first = "first"
        case last = "last"
        case title = "title"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        first = try values.decodeIfPresent(String.self, forKey: .first)
        last = try values.decodeIfPresent(String.self, forKey: .last)
        title = try values.decodeIfPresent(String.self, forKey: .title)
    }
    
}
