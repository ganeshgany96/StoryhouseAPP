//
//  StoryHouseViewController.swift
//  Storyhouse
//
//  Created by Gany Ganesh on 17/09/21.
//

import UIKit

class StoryHouseViewController: UIViewController {
    
    @IBOutlet weak var storyhouseTable: UITableView!
    
    
    var arrobj = [NSArray]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let sync = SyncProcess()
        let objurl = Host()
        sync.Getallstorypost(url: objurl.getallpost) { response in
            self.arrobj = response as! [NSArray]
            self.storyhouseTable.reloadData()
        } Failure: { response in
            self.arrobj = response as! [NSArray]
        }
    }
    
    
    
}

extension StoryHouseViewController:UITableViewDelegate{
    
}
extension StoryHouseViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrobj.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "story", for: indexPath) as! ShoryHouseTableViewCell
        let obj = arrobj as! [NSDictionary]
        let objpost = obj[indexPath.row]
        cell.stroydescription.text = (objpost.value(forKey: "stroydecription") as! String)
        cell.userTitle.text = (objpost.value(forKey: "title") as! String)
        cell.username.text = (objpost.value(forKey: "fullname") as! String)
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 315
        
    }
    
    
}
