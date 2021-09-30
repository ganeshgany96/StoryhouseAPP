//
//  CreatePostViewController.swift
//  Storyhouse
//
//  Created by Gany Ganesh on 18/09/21.
//

import UIKit

class CreatePostViewController: UIViewController {

    @IBOutlet weak var titletxtfld: UITextField!
    @IBOutlet weak var storyTxtView: UITextView!
    @IBOutlet weak var uploadBtn: UIButton!
    @IBOutlet weak var saveBtn: UIButton!
    @IBOutlet weak var editbtn: UIButton!
    let post = Post()
    override func viewDidLoad() {
        super.viewDidLoad()
        CornerRadius()
       BorderColor()
        
    }
  
    @IBAction func uploadBtnTapped(_ sender: UIButton) {
    
        let useraccount = GoogleObject()
        let dbopGet = DBoperationGet()
        if let title = self.titletxtfld!.text {
            if title.count>3 {
                post.title = title
            }else{
                return
            }
        }
        if let stroydiscription = self.storyTxtView!.text {
            if stroydiscription.count>50 {
                post.storyDescription = stroydiscription
            }else{
                return
            }
        }
        post.isPost = true
        post.isDraft = false
        dbopGet.GetUserAccountDetail()
        post.useraccountid = Int64(useraccount.useraccountid)
        post.storyid += 1
        let dict = ["title":post.title,"storydescription":post.storyDescription,"isPost":post.isPost,"isDraft":post.isDraft,"useraccountid":post.useraccountid,"storyid":post.storyid] as [String : Any]

        
        if let json = try? JSONSerialization.data(withJSONObject: dict, options: []) {
            let data = Data(json)
//            self.indicator.isHidden = false
//            self.indicator.startAnimating()
//            DispatchQueue.main.async {
                self.postUpload(data: data)
//                self.indicator.stopAnimating()
//            }
            
            
        }
        
        dismiss(animated: true)
    }
    
    @IBAction func saveBtnTapped(_ sender: UIButton) {
     
    }
    
    @IBAction func backBtnTapped(_ sender: Any) {
        
    }
    @IBAction func editBtnTapped(_ sender: UIButton) {
        
        if let title = self.titletxtfld!.text {
            if title.count>3 {
                if (editbtn.title(for: .normal) == "Save") {
                    editbtn.setTitle("Edit", for: .normal)
                    self.titletxtfld.resignFirstResponder()
                    self.titletxtfld.isEnabled = false
                }else if (editbtn.title(for: .normal) == "Edit") {
                    editbtn.setTitle("Save", for: .normal)
                    self.titletxtfld.isEnabled = true
                    self.titletxtfld.becomeFirstResponder()
                }
            }
        }
        
        
        
        
    }
    
    
    func CornerRadius(){
        uploadBtn.layer.cornerRadius = 5
        saveBtn.layer.cornerRadius = 5
        titletxtfld.layer.cornerRadius = 15
        storyTxtView.layer.cornerRadius = 8
        editbtn.layer.cornerRadius = 8
    }
    
    func BorderColor(){
        storyTxtView.layer.borderWidth = 1
        storyTxtView.layer.borderColor = UIColor.systemOrange.cgColor
        titletxtfld.layer.borderWidth = 1
        titletxtfld.layer.borderColor = UIColor.systemOrange.cgColor
    }
    
}
extension CreatePostViewController{
    
    func postUpload(data:Data){
        let dboperation =  DBoperation()
        let host = Host()
        let sync = SyncProcess()
        sync.CreatedPostUpload(url: host.postupload, objdata: data,success: { result in
            print(result)
            dboperation.InsertCreatedPost(post: self.post)
            
            //            self.objuseraccount.useraccountid = result["useraccountid"]  as! Int
            //            dboperation.InsertGoogleObject(obj: self.objuseraccount)
        },Failure: { result in
            print(result) } )
    }
}


