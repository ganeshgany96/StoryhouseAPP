//
//  SearchViewController.swift
//  Storyhouse
//
//  Created by Gany Ganesh on 17/09/21.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var searchtableview: UITableView!
    @IBOutlet weak var searchBarView: UISearchBar!
    var searchActive : Bool = false
    var arrobj = [NSArray]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /* Setup delegates */
        searchtableview.delegate = self
        searchtableview.dataSource = self
        searchBarView.delegate = self
    }
    


}

extension SearchViewController:UITableViewDelegate{
    
}
extension SearchViewController :UITableViewDataSource{
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
           return 1
       }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return arrobj.count
       }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "search", for: indexPath) as! SearchPostTableViewCell
        let obj = arrobj as! [NSDictionary]
        let objpost = obj[indexPath.row]
        cell.title.text = (objpost.value(forKey: "title") as! String)
        cell.storydescription.text = (objpost.value(forKey: "stroydecription") as! String)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
}
extension SearchViewController:UISearchBarDelegate{
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
            searchActive = true;
        }

    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
            searchActive = false;
        }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
            searchActive = false;
        }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchActive = false
        self.searchBarView.endEditing(true)
    }
    
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        let sync = SyncProcess()
        let host = Host()
        let url = "\(host.searchreq)\(searchText.lowercased())"
        if searchText.count>=1{
            sync.searchTitlePost(url: url) { respose in
                self.arrobj = respose as! [NSArray]
                self.searchtableview.reloadData()
            } Failure: { response in
                print(response)
            }
        }
        
        
    }
}

