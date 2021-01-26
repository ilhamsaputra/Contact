//
//  ListContactService.swift
//  Contact
//
//  Created by ilhamsaputra on 26/01/21.
//

import Foundation

// Service Configuration for List Movie Request
class ListContactService: BaseRequest {
    typealias ResponseType = ContactListModel
    
    var url:String = ""
    
    func method() -> BaseNetwork.Method {
        return .get
    }
    
    func setUrl() -> URL {
        return URL(string: url)!
    }
}
