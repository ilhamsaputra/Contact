//
//  ContactTableViewCell.swift
//  Contact
//
//  Created by ilhamsaputra on 26/01/21.
//

import UIKit
import SDWebImage

class ContactTableViewCell: UITableViewCell {

    @IBOutlet weak var baseView: UIView!
    @IBOutlet weak var contactImageView: UIImageView!
    @IBOutlet weak var contactNameLabel: UILabel!
    
    var data:ContactData? {
        didSet {
            setData()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        baseView.setRoundedShadowView()
        contactImageView.layer.cornerRadius = 8
        selectionStyle = .none
    }
}

// MARK: - Data
extension ContactTableViewCell {
    private func setData() {
        let fullName = "\(data?.name?.first ?? "") \(data?.name?.last ?? "" )"
        contactNameLabel.text = fullName
        if let url = URL(string: data?.picture?.thumbnail ?? ""){
            contactImageView.sd_setImage(with: url, placeholderImage: UIImage(named: "placeholder"), completed: nil)
        }else{
            contactImageView.image = UIImage(named: "placeholder")
        }
    }
}
