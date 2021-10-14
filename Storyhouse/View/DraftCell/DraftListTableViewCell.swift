//
//  DraftListTableViewCell.swift
//  Storyhouse
//
//  Created by Gany Ganesh on 30/09/21.
//

import UIKit

class DraftListTableViewCell: UITableViewCell {

    @IBOutlet weak var draftView: UIView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var storydiscription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        draftView.layer.borderWidth = 1
        draftView.layer.borderColor = UIColor.systemOrange.cgColor
        draftView.layer.cornerRadius = 10
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
