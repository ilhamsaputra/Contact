//
//  BaseRequest.swift
//  Contact
//
//  Created by ilhamsaputra on 26/01/21.
//

import Foundation

// protocol for create service
protocol BaseRequest {
    associatedtype ResponseType: Codable
    
    func method() -> BaseNetwork.Method
    func setUrl() -> URL
}
