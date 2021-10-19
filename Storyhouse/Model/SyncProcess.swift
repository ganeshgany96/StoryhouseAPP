//
//  SyncProcess.swift
//  Storyhouse
//
//  Created by Gany Ganesh on 18/09/21.
//

import UIKit
import Alamofire

class SyncProcess: NSObject {
    
    
    func GoogleResultUpload(url:String,objdata:Data,success SuccessBlock: @escaping (NSDictionary)->Void,  Failure FailureBlock: @escaping (NSDictionary)->Void){
        let objUrl = URL(string: url)
        var request = URLRequest(url: objUrl!)
        request.httpMethod = "POST"
        request.setValue("application/json;", forHTTPHeaderField: "Content-Type")
        request.httpBody  = objdata
        Alamofire.request(request).responseJSON { response in
            if response.result.isSuccess {
                SuccessBlock(response.result.value as! NSDictionary)
            }else if response.result.isFailure{
                FailureBlock(response.result.value as! NSDictionary)
            }
        }
    }
    
    func downloadimage(url:URL,SuccessBlock: @escaping (Data)->Void){
        Alamofire.request(url).response{ reponse in
            SuccessBlock(reponse.data!)
        }
        //        Alamofire.request(.GET, "https://robohash.org/123.png").response { (request, response, data, error) in
        //                self.myImageView.image = UIImage(data: data, scale:1)
        //            }
    }
    
    func CreatedPostUpload(url:String,objdata:Data,success SuccessBlock: @escaping (NSDictionary)->Void,  Failure FailureBlock: @escaping (NSDictionary)->Void){
        let objUrl = URL(string: url)
        print(objUrl!)
        var request = URLRequest(url: objUrl!)
        request.httpMethod = "POST"
        request.setValue("application/json;", forHTTPHeaderField: "Content-Type")
        request.httpBody  = objdata
        Alamofire.request(request).responseJSON { response in
            if response.result.isSuccess {
                SuccessBlock(response.result.value as! NSDictionary)
            }else if response.result.isFailure{
                FailureBlock(response.result.value as! NSDictionary)
            }
        }
    }
    
    func searchTitlePost(url:String,success SuccessBlock: @escaping (NSArray)->Void,  Failure FailureBlock: @escaping (NSArray)->Void){
        let objUrl = URL(string: url)
        print(objUrl!)
        Alamofire.request(url).responseJSON{ response in
            if response.result.isSuccess {

                SuccessBlock(response.result.value as! NSArray)

            }else if response.result.isFailure{
                FailureBlock(response.result.value  as! NSArray)
            }
        }
    }
    
    
    func Getallstorypost(url:String,success SuccessBlock: @escaping (NSArray)->Void,  Failure FailureBlock: @escaping (NSArray)->Void){
        let objUrl = URL(string: url)
        print(objUrl!)
        Alamofire.request(url).responseJSON{ response in
            if response.result.isSuccess {

                SuccessBlock(response.result.value as! NSArray)

            }else if response.result.isFailure{
                FailureBlock(response.result.value  as! NSArray)
            }
        }
    }
    
    func GetuserPost(url:String,success SuccessBlock: @escaping (NSArray)->Void,  Failure FailureBlock: @escaping (NSArray)->Void){
        let objUrl = URL(string: url)
        print(objUrl!)
        Alamofire.request(url).responseJSON{ response in
            if response.result.isSuccess {

                SuccessBlock(response.result.value as! NSArray)

            }else if response.result.isFailure{
                FailureBlock(response.result.value  as! NSArray)
            }
        }
    }
    
}
