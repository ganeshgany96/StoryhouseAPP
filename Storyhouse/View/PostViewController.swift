//
//  PostViewController.swift
//  Storyhouse
//
//  Created by Gany Ganesh on 17/09/21.
//

import UIKit

class PostViewController: UIViewController {

    @IBOutlet weak var createPostView: UIView!
    @IBOutlet weak var draftTableview: UITableView!

    var arrlist = [Post]() as NSArray
    override func viewDidLoad() {
        super.viewDidLoad()
        border()
       
    }
  
    override func viewDidAppear(_ animated: Bool) {
        let dboper = DBoperationGet()
        arrlist = dboper.GetDraftPost()
        self.draftTableview.reloadData()
    }
    
    @IBAction func postBtnTapped(_ sender: UIButton) {
        
    }
    
    func border(){
        createPostView.layer.borderWidth = 1
        createPostView.layer.borderColor = UIColor.systemOrange.cgColor
        createPostView.layer.cornerRadius = 10
        draftTableview.layer.borderWidth = 1
        draftTableview.layer.borderColor = UIColor.systemOrange.cgColor
        draftTableview.layer.cornerRadius = 10
    }
    
}
extension PostViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrlist.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "draft", for: indexPath) as! DraftListTableViewCell
        let objpost = arrlist[indexPath.row] as! Post
        cell.title.text = objpost.title
        cell.storydiscription.text = objpost.storyDescription
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
    
}
extension PostViewController:UITableViewDelegate{
    
}
