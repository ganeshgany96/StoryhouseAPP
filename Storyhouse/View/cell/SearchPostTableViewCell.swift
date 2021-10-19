//
//  SearchPostTableViewCell.swift
//  Storyhouse
//
//  Created by Gany Ganesh on 01/10/21.
//

import UIKit

class SearchPostTableViewCell: UITableViewCell {

    @IBOutlet weak var postview: UIView!
    
    @IBOutlet weak var title: UILabel!
    
    @IBOutlet weak var storydescription: UITextView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        postview.layer.borderWidth = 1
        postview.layer.borderColor = UIColor.systemOrange.cgColor
        postview.layer.cornerRadius = 10
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
