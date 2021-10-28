//
//  AccountViewController.swift
//  Storyhouse
//
//  Created by Gany Ganesh on 17/09/21.
//

import UIKit

class AccountViewController: UIViewController {

    @IBOutlet weak var topTableView: UITableView!
    
    var arrobj = [NSArray]()
    override func viewDidLoad() {
        super.viewDidLoad()
        let sync = SyncProcess()
        let host = Host()
        let dbopGet = DBoperationGet()
        dbopGet.GetUserAccountDetail()
        let useraccount = GoogleObject.sharedInstance
        let urls = "\(host.getuserpost)\(useraccount.useraccountid)"
        sync.Getallstorypost(url:urls) { response in
            self.arrobj = response as! [NSArray]
            self.topTableView.reloadData()
        } Failure: { response in
            self.arrobj = response as! [NSArray]
        }
    }


}
extension AccountViewController:UITableViewDelegate{
    
}
extension AccountViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrobj.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "top", for: indexPath) as! TopFavTableViewCell
        let obj = arrobj as! [NSDictionary]
        let objpost = obj[indexPath.row]
        cell.storydesc.text = (objpost.value(forKey: "stroydecription") as! String)
        cell.titilelbl.text = (objpost.value(forKey: "title") as! String)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
        
    }
    
    
}

