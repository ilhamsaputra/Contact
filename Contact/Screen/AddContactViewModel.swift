//
//  AddContactViewModel.swift
//  Contact
//
//  Created by ilhamsaputra on 26/01/21.
//

import Foundation

class AddContactViewModel {
    
    var showProgress: (() -> ())?
    var hideProgress: (() -> ())?
    var successRequest: (() -> ())?
    var failureRequest: (() -> ())?
    
    var contact:ContactData?
    var listContact:[ContactData] = []
    var errorMessage:String = ""
    
    func getListContact() {
        self.showProgress?()
        let listContactService = ListContactService()
        listContactService.url = Constant.BASE_URL + "?results=5&exc=login,registered,id,nat&nat=us&noinfo"
        BaseNetwork.request(req: listContactService) { (result) in
            self.hideProgress?()
            switch result{
            case.success(let response):
                self.listContact = response.results ?? []
                self.successRequest?()
            case .failure(let error):
                self.errorMessage = error ?? ""
                self.failureRequest?()
            }
        }
    }
}
