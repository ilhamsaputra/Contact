//
//  ContactListModel.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on January 26, 2021

import Foundation

struct ContactListModel : Codable {
    
    let results : [ContactData]?
    
    enum CodingKeys: String, CodingKey {
        case results = "results"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        results = try values.decodeIfPresent([ContactData].self, forKey: .results)
    }
    
}
