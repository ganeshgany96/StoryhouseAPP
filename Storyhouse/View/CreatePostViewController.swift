//
//  CreatePostViewController.swift
//  Storyhouse
//
//  Created by Gany Ganesh on 18/09/21.
//

import UIKit
import Speech
import AVKit
import NRSpeechToText
class CreatePostViewController: UIViewController, UITextViewDelegate,UITextFieldDelegate,SFSpeechRecognizerDelegate {
    @IBOutlet weak var imgmic: UIImageView!
    
    @IBOutlet var btnimg: UITapGestureRecognizer!
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
        self.titletxtfld.delegate = self
        self.storyTxtView.delegate = self
        
        
    }
    
    @IBAction func imgMicImg(_ sender: Any) {
        
        NRSpeechToText.shared.authorizePermission { (authorize) in
            if authorize {
                if NRSpeechToText.shared.isRunning {
                    NRSpeechToText.shared.stop()
                    OperationQueue.main.addOperation {
                        print("started...")
//                        self.microphoneButton.setTitle("Start Recording", for: .normal)
                    }
                }
                else {
                    OperationQueue.main.addOperation {
                        print("stop...")
//                        self.microphoneButton.setTitle("Stop Recording", for: .normal)
                    }
                    self.startRecording()
                }
            }
        }
    }
    func startRecording() {
        NRSpeechToText.shared.startRecording {(result: String?, isFinal: Bool, error: Error?) in
            if error == nil {
                self.storyTxtView.text = result
            }
        }
    }
    
    func speechRecognizer(_ speechRecognizer: SFSpeechRecognizer, availabilityDidChange available: Bool) {
        // Called when the availability of the given recognizer changes
        
    }
    
    
    @IBAction func uploadBtnTapped(_ sender: UIButton) {
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
        let useraccount = GoogleObject.sharedInstance
        post.useraccountid = Int64(useraccount.useraccountid)
        let dict = ["title":post.title,"stroydecription":post.storyDescription,"isPost":post.isPost,"isDraft":post.isDraft,"useraccountid":post.useraccountid] as [String : Any]
        
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
        post.isPost = false
        post.isDraft = true
        dbopGet.GetUserAccountDetail()
        let useraccount = GoogleObject.sharedInstance
        post.useraccountid = Int64(useraccount.useraccountid)
        let dict = ["title":post.title,"stroydecription":post.storyDescription,"isPost":post.isPost,"isDraft":post.isDraft,"useraccountid":post.useraccountid] as [String : Any]
        
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
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.titletxtfld.resignFirstResponder()
        return true
    }
    /* Updated for Swift 4 */
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if(text == "\n") {
            storyTxtView.resignFirstResponder()
            return false
        }
        return true
    }
    /* Older versions of Swift */
    func textView(textView: UITextView, shouldChangeTextInRange range: NSRange, replacementText text: String) -> Bool {
        if(text == "\n") {
            storyTxtView.resignFirstResponder()
            return false
        }
        return true
    }
    
}
extension CreatePostViewController{
    
    func postUpload(data:Data){
        let dboperation =  DBoperation()
        let host = Host()
        let sync = SyncProcess()
        let user = GoogleObject.sharedInstance
        sync.CreatedPostUpload(url: host.postupload, objdata: data,success: { result in
            print(result)
            user.storyid = result["useraccountid"]  as! Int
            dboperation.InsertCreatedPost(post: self.post)
            
            //            self.objuseraccount.useraccountid = result["useraccountid"]  as! Int
            //            dboperation.InsertGoogleObject(obj: self.objuseraccount)
        },Failure: { result in
            print(result) } )
    }
}


