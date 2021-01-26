//
//  DetailViewController.swift
//  Contact
//
//  Created by ilhamsaputra on 26/01/21.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var contactDataView: UIView!
    @IBOutlet weak var contactImageView: UIImageView!
    @IBOutlet weak var contactNameLabel: UILabel!
    @IBOutlet weak var contactAddressLabel: UILabel!
    @IBOutlet weak var contactCoordinateLabel: UILabel!
    
    var contact:ContactData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        initData()
    }
}

// MARK: - Setup UI
extension DetailViewController{
    func initUI() {
        contactDataView.setRoundedShadowView()
        contactImageView.layer.cornerRadius = 8
    }
    
    func initData(){
        let address = "\(contact?.location?.street?.name ?? "") \(contact?.location?.street?.number ?? 0), \(contact?.location?.city ?? ""), \(contact?.location?.state ?? "" )"
        
        contactNameLabel.text = "\(contact?.name?.first ?? "") \(contact?.name?.last ?? "" )"
        contactAddressLabel.text = address
        contactCoordinateLabel.text = "\(contact?.location?.coordinates?.latitude ?? ""), \(contact?.location?.coordinates?.latitude ?? "" )"
        
        if let url = URL(string: contact?.picture?.large ?? ""){
            contactImageView.sd_setImage(with: url, placeholderImage: UIImage(named: "placeholder"), completed: nil)
        }else{
            contactImageView.image = UIImage(named: "placeholder")
        }
    }
}
