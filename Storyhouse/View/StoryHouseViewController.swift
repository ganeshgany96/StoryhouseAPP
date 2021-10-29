//
//  StoryHouseViewController.swift
//  Storyhouse
//
//  Created by Gany Ganesh on 17/09/21.
//

import UIKit

class StoryHouseViewController: UIViewController {
    
    @IBOutlet weak var storyhouseTable: UITableView!
    
    var readbtn = Int()
    
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
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
   
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
        cell.likeBtb.tag = indexPath.row
        cell.likeBtb.addTarget(self, action: #selector(likebtn(sender:)), for: .touchUpInside)
        cell.subscribeBtn.addTarget(self, action: #selector(subscribe(sender:)), for: .touchUpInside)
        cell.readmoreBtn.tag = indexPath.row
        cell.readmoreBtn.addTarget(self, action: #selector(readmore(sender:)), for: .touchUpInside)
        


        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 315
        
    }
    @objc func readmore(sender: UIButton){
        self.readbtn = sender.tag
        performSegue(withIdentifier: "ReadMoreViewController", sender: sender.tag)
    }
    @objc func subscribe(sender: UIButton){
        let obj = arrobj as! [NSDictionary]
        let infodetai = obj[sender.tag]
        let storyid = infodetai.value(forKey: "storyid")
        let useraccountid = infodetai.value(forKey: "useraccountid")
        let likes = "2"
        let subscribe = "1"
        let dict = ["storyid": storyid,"useraccountid":useraccountid,"likes":likes,"subscribe":subscribe]
        if let json = try? JSONSerialization.data(withJSONObject: dict, options: []) {
            let data = Data(json)
            DispatchQueue.main.async {
                self.infoUpload(data: data)
            }
        }
        if sender.currentImage == UIImage(systemName: "person.fill.checkmark"){
            sender.setImage(UIImage(systemName: "person.fill.xmark"), for: .normal)
        }else{
            sender.setImage(UIImage(systemName: "person.fill.checkmark"), for: .normal)
        }
    }
    @objc func likebtn(sender: UIButton){
        let obj = arrobj as! [NSDictionary]
        let infodetai = obj[sender.tag]
        let storyid = infodetai.value(forKey: "storyid")
        let useraccountid = infodetai.value(forKey: "useraccountid")
        let likes = "2"
        let subscribe = "1"
        let dict = ["storyid": storyid,"useraccountid":useraccountid,"likes":likes,"subscribe":subscribe]
        if let json = try? JSONSerialization.data(withJSONObject: dict, options: []) {
            let data = Data(json)
            DispatchQueue.main.async {
                self.infoUpload(data: data)
            }
        }
        if sender.currentImage == UIImage(systemName: "heart"){
            sender.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        }else{
            sender.setImage(UIImage(systemName: "heart"), for: .normal)
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? ReadMoreViewController {
            let obj = arrobj as! [NSDictionary]
            vc.arrobj = obj[readbtn]
        }
    }
}
extension StoryHouseViewController{
    
    func infoUpload(data:Data){
        let host = Host()
        let sync = SyncProcess()
        sync.infoDeatilUpload(url: host.infoupload, objdata: data) { result in
            print(result)
        } Failure: { result in
            print(result)
        }

    }
}

