//
//  GoogleLoginViewController.swift
//  Storyhouse
//
//  Created by Gany Ganesh on 15/09/21.
//

import UIKit
import GoogleSignIn
import Alamofire
class GoogleLoginViewController: UIViewController {
    
    @IBOutlet weak var loginbtn: GIDSignInButton!
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    let signInConfig = GIDConfiguration.init(clientID: "686401286353-5rd5bskj2shhogsl3mdj36vqff0kk3n7.apps.googleusercontent.com")
    let objuseraccount = GoogleObject()
    let sync = SyncProcess()
    let host = Host()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.indicator.isHidden = true
        self.loginbtn.colorScheme = GIDSignInButtonColorScheme.dark
        self.loginbtn.style = GIDSignInButtonStyle.wide
        
    }
    
    
    @IBAction func loginInBtnTapped(_ sender: GIDSignInButton) {
        GIDSignIn.sharedInstance.signIn(with: signInConfig, presenting: self) { [self] user, error in
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let mainTabBarController = storyboard.instantiateViewController(identifier: "tabbar")
            self.present(mainTabBarController, animated: true, completion: nil)
            guard error == nil else { return }
            guard let user = user else { return }
            let emailAddress = user.profile!.email
            let fullName = user.profile!.name
            //            let givenName = user.profile!.givenName
            //            let familyName = user.profile!.familyName
            let profilePicUrl = user.profile?.imageURL(withDimension: 320)
            self.imagedowload(img: profilePicUrl!)
            let dict = ["fullname":fullName,"email":emailAddress]
            self.objuseraccount.fullname = fullName
            self.objuseraccount.email = emailAddress
//            self.objuseraccount.profile = profilePicUrl
            if let json = try? JSONSerialization.data(withJSONObject: dict, options: []) {
                let data = Data(json)
                self.indicator.isHidden = false
                self.indicator.startAnimating()
                DispatchQueue.main.async {
                    self.googleUpload(data: data)
                    self.indicator.stopAnimating()
                }
                
                
            }
        }
    }
}

extension GoogleLoginViewController{
    
    func googleUpload(data:Data){
        let dboperation =  DBoperation()
        sync.GoogleResultUpload(url: host.googleupload, objdata: data,success: { result in
            self.objuseraccount.useraccountid = result["useraccountid"]  as! Int
            dboperation.InsertGoogleObject(obj: self.objuseraccount)
        },Failure: { result in
            print(result) } )
    }
    func imagedowload(img:URL){
        sync.downloadimage(url:img, SuccessBlock: { result in
            print(result)
            
        } )
    }
}
