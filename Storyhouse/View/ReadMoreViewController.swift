//
//  ReadMoreViewController.swift
//  Storyhouse
//
//  Created by Gany Ganesh on 27/10/21.
//

import UIKit
import WebKit

class ReadMoreViewController: UIViewController {

    var arrobj = NSDictionary()
    @IBOutlet weak var webView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()

      intialload()
    }
    @IBAction func backBtnTapped(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    func intialload (){
        let title = arrobj.value(forKey: "title") as! String
        let storydescription = arrobj.value(forKey: "stroydecription") as! String
        let yourhtmlstring = "<b>\(title)</i></b> <p>\(storydescription)</p>"
        let font = "<font face='Montserrat-Regular' size='13' color= 'black'>%@"
        let html = String(format: font, yourhtmlstring)
        webView.loadHTMLString(html, baseURL: nil)

    }
    
}
