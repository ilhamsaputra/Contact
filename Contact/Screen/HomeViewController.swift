//
//  HomeViewController.swift
//  Contact
//
//  Created by ilhamsaputra on 26/01/21.
//

import UIKit

class HomeViewController: BaseViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private let viewmodel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = Constant.HOME_TITLE
        initUI()
    }
}

// MARK: - Setup UI
extension HomeViewController{
    func initUI() {
        initTableView()
        initButton()
    }
    
    func initTableView(){
        tableView.register(UINib(nibName: "ContactTableViewCell", bundle: nil), forCellReuseIdentifier: "ContactTableViewCell")
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        tableView.contentInset = UIEdgeInsets(top: 8, left: 0, bottom: 0, right: 0)
    }
    
    func initButton() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(onAddPressedPressed))
    }
}

// MARK: - Action
extension HomeViewController{
    
    @objc func onAddPressedPressed() {
        let vc = AddContactViewController()
        vc.delegate = self
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

// MARK: - tableView
extension HomeViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewmodel.listContact.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContactTableViewCell") as! ContactTableViewCell
        cell.data = self.viewmodel.listContact[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailViewController()
        vc.contact = self.viewmodel.listContact[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

// MARK: - Action
extension HomeViewController: AddContactViewControllerDelegate{
    func addContact(data: ContactData) {
        self.viewmodel.addContact(data: data)
        self.tableView.reloadData()
    }
}


