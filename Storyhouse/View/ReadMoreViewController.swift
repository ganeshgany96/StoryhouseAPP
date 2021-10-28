//
//  ReadMoreViewController.swift
//  Storyhouse
//
//  Created by Gany Ganesh on 27/10/21.
//

import UIKit
import WebKit

class ReadMoreViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()

      intialload()
    }
    
    func intialload (){
        let yourhtmlstring = "<b>The harmMan</i></b> <p>A papal decree of 1493 had assigned all land in the New World west of 50 degrees W longitude to Spain and all the land east of that line to Portugal. Magellan offered to prove that the East Indies fell under Spanish authority. On September 20, 1519, Magellan set sail from Spain with five ships. More than a year later, one of these ships was exploring the topography of South America in search of a water route across the continent. This ship sank, but the remaining four ships searched along the southern peninsula of South America. Finally they found the passage they sought near 50 degrees S latitude. Magellan named this passage the Strait of All Saints, but today it is known as the Strait of Magellan.</p>"
        let font = "<font face='Montserrat-Regular' size='13' color= 'black'>%@"
        let html = String(format: font, yourhtmlstring)
        webView.loadHTMLString(html, baseURL: nil)

    }
    
}
