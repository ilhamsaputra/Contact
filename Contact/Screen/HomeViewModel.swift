//
//  HomeViewModel.swift
//  Contact
//
//  Created by ilhamsaputra on 26/01/21.
//

import Foundation

class HomeViewModel {
    
    var listContact:[ContactData] = []

    func addContact(data: ContactData) {
        if listContact.count > 0 {
            if !listContact.contains(where: {$0.phone?.trimPhoneNumber() == data.phone?.trimPhoneNumber() }) {
                self.listContact.append(data)
            }
        }else{
            self.listContact.append(data)
          
        }
    }
}
