//
//  TopFavTableViewCell.swift
//  Storyhouse
//
//  Created by Gany Ganesh on 19/10/21.
//

import UIKit

class TopFavTableViewCell: UITableViewCell {

    @IBOutlet weak var storydesc: UITextView!
    @IBOutlet weak var titilelbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
