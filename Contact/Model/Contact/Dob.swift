//
//  Dob.swift
//  
//  Created on January 26, 2021

import Foundation

struct Dob : Codable {
    
    let age : Int?
    let date : String?
    
    enum CodingKeys: String, CodingKey {
        case age = "age"
        case date = "date"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        age = try values.decodeIfPresent(Int.self, forKey: .age)
        date = try values.decodeIfPresent(String.self, forKey: .date)
    }
    
}
