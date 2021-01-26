//
//  AddContactViewController.swift
//  Contact
//
//  Created by ilhamsaputra on 26/01/21.
//

import UIKit

protocol AddContactViewControllerDelegate: AnyObject {
    func addContact(data:ContactData)
}

class AddContactViewController: BaseViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private let viewmodel = AddContactViewModel()
    
    weak var delegate: AddContactViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        fetchListContact()
    }
}

// MARK: - Setup UI
extension AddContactViewController{
    func initUI() {
        self.title = Constant.HOME_ADD_CONTACT
        
        initTableView()
        initSpinner()
    }
    
    func initSpinner(){
        self.viewmodel.showProgress = { [weak self] in
            self?.showHUD(view: self?.view)
        }
        
        self.viewmodel.hideProgress = {
            self.hideHUD()
        }
    }
    
    func initTableView(){
        tableView.register(UINib(nibName: "ContactTableViewCell", bundle: nil), forCellReuseIdentifier: "ContactTableViewCell")
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        tableView.contentInset = UIEdgeInsets(top: 8, left: 0, bottom: 0, right: 0)
    }
}


// MARK: - Request
extension AddContactViewController{
    
    func fetchListContact() {
        self.viewmodel.getListContact()
        
        // success response
        self.viewmodel.successRequest = { [weak self] in
            self?.tableView.reloadData()
            self?.tableView.layoutIfNeeded()
        }
        
        // failure response
        self.viewmodel.failureRequest = { [weak self] in
            self?.createAlert(message: self?.viewmodel.errorMessage ?? "", firstCompletion: {
                self?.dismiss(animated: true, completion: nil)
            })
        }
    }
}


// MARK: - tableView
extension AddContactViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewmodel.listContact.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContactTableViewCell") as! ContactTableViewCell
        cell.data = self.viewmodel.listContact[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.delegate?.addContact(data: self.viewmodel.listContact[indexPath.row])
        self.navigationController?.popViewController(animated: true)
    }
}



