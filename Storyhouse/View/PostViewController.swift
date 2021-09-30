//
//  PostViewController.swift
//  Storyhouse
//
//  Created by Gany Ganesh on 17/09/21.
//

import UIKit

class PostViewController: UIViewController {

    @IBOutlet weak var createPostView: UIView!
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createPostView.layer.borderWidth = 1
        createPostView.layer.borderColor = UIColor.systemOrange.cgColor
        createPostView.layer.cornerRadius = 10

        
    }
    
    @IBAction func postBtnTapped(_ sender: UIButton) {
    }
    
    
}
