//
//  String.swift
//  Contact
//
//  Created by ilhamsaputra on 26/01/21.
//

import Foundation

extension String {
    func trimPhoneNumber() -> String{
        if self.isEmpty{
            return ""
        }else{
            return self.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
        }
    }
}
