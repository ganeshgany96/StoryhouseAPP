//
//  ShoryHouseTableViewCell.swift
//  Storyhouse
//
//  Created by Gany Ganesh on 01/10/21.
//

import UIKit

class ShoryHouseTableViewCell: UITableViewCell {

    @IBOutlet weak var houseview: UIView!
    @IBOutlet weak var profileview: UIView!
    
    @IBOutlet weak var likeview: UIView!
    
    @IBOutlet weak var imgView: UIImageView!
    
    @IBOutlet weak var username: UILabel!
    
    @IBOutlet weak var userTitle: UILabel!
    @IBOutlet weak var subscribeBtn: UIButton!
    
    @IBOutlet weak var likeBtb: UIButton!
    @IBOutlet weak var readmoreBtn: UIButton!
    @IBOutlet weak var stroydescription: UITextView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        houseview.layer.borderWidth = 1
        houseview.layer.borderColor = UIColor.systemOrange.cgColor
        houseview.layer.cornerRadius = 10
        likeview.layer.borderWidth = 1
        likeview.layer.borderColor = UIColor.systemOrange.cgColor
        likeview.layer.cornerRadius = 10
        profileview.layer.borderWidth = 1
        profileview.layer.borderColor = UIColor.systemOrange.cgColor
        profileview.layer.cornerRadius = 10
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
