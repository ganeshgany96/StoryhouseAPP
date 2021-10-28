//
//  Host.swift
//  Storyhouse
//
//  Created by Gany Ganesh on 18/09/21.
//

import UIKit

let strPath = "http://192.168.1.5:1030"

class Host: NSObject {
    let googleupload = "\(strPath)/googleResultUpload"
    let postupload = "\(strPath)/postResultUpload"
    let infoupload = "\(strPath)/infodetail"
    let searchreq = "\(strPath)/SearchPost/"
    let getallpost = "\(strPath)/Getallpost"
    let getuserpost = "\(strPath)/Getuserstory/"
}
