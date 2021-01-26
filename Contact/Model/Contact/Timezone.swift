//
//  Timezone.swift
//  
//  Created on January 26, 2021

import Foundation

struct Timezone : Codable {
    
    let descriptionField : String?
    let offset : String?
    
    enum CodingKeys: String, CodingKey {
        case descriptionField = "description"
        case offset = "offset"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        descriptionField = try values.decodeIfPresent(String.self, forKey: .descriptionField)
        offset = try values.decodeIfPresent(String.self, forKey: .offset)
    }
    
}
