//
//  Response.swift
//  Storyhouse
//
//  Created by Gany Ganesh on 20/09/21.
//

import Foundation

class ErrorResponse: NSObject {
    var status:String
    var message:String
    
    init(status:String,message:String) {
        self.status = status
        self.message = message
    }
}
