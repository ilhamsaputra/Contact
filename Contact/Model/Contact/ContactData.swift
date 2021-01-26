//
//  ContactData.swift
//  
//  Created on January 26, 2021

import Foundation

struct ContactData : Codable {
    
    let cell : String?
    let dob : Dob?
    let email : String?
    let gender : String?
    let location : Location?
    let name : Name?
    let phone : String?
    let picture : Picture?
    
    enum CodingKeys: String, CodingKey {
        case cell = "cell"
        case dob = "dob"
        case email = "email"
        case gender = "gender"
        case location = "location"
        case name = "name"
        case phone = "phone"
        case picture = "picture"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        cell = try values.decodeIfPresent(String.self, forKey: .cell)
        dob = try values.decodeIfPresent(Dob.self, forKey: .dob)
        email = try values.decodeIfPresent(String.self, forKey: .email)
        gender = try values.decodeIfPresent(String.self, forKey: .gender)
        location = try values.decodeIfPresent(Location.self, forKey: .location)
        name = try values.decodeIfPresent(Name.self, forKey: .name)
        phone = try values.decodeIfPresent(String.self, forKey: .phone)
        picture = try values.decodeIfPresent(Picture.self, forKey: .picture)
    }
    
}
