//
//  Location.swift
//  
//  Created on January 26, 2021

import Foundation

struct Location : Codable {
    
    let city : String?
    let coordinates : Coordinate?
    let country : String?
    let postcode : Int?
    let state : String?
    let street : Street?
    let timezone : Timezone?
    
    enum CodingKeys: String, CodingKey {
        case city = "city"
        case coordinates = "coordinates"
        case country = "country"
        case postcode = "postcode"
        case state = "state"
        case street = "street"
        case timezone = "timezone"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        city = try values.decodeIfPresent(String.self, forKey: .city)
        coordinates = try values.decodeIfPresent(Coordinate.self, forKey: .coordinates)
        country = try values.decodeIfPresent(String.self, forKey: .country)
        postcode = try values.decodeIfPresent(Int.self, forKey: .postcode)
        state = try values.decodeIfPresent(String.self, forKey: .state)
        street = try values.decodeIfPresent(Street.self, forKey: .street)
        timezone = try values.decodeIfPresent(Timezone.self, forKey: .timezone)
    }
    
}
