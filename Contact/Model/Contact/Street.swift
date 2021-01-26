//
//  Street.swift
//  
//  Created on January 26, 2021

import Foundation

struct Street : Codable {
    
    let name : String?
    let number : Int?
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case number = "number"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        number = try values.decodeIfPresent(Int.self, forKey: .number)
    }
    
}
