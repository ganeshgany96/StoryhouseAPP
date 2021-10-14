//
//  DBoperationGet.swift
//  Storyhouse
//
//  Created by Gany Ganesh on 28/09/21.
//

import UIKit
import CoreData

class DBoperationGet: NSObject {

    private func Context()->NSManagedObjectContext{
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        return context
    }
    
    func GetUserAccountDetail(){
        let context =  Context()
        let entity =  Entity()
        let request  = NSFetchRequest<NSFetchRequestResult>(entityName:entity.useraccount )
        do {
            let result = try context.fetch(request)
            let user = GoogleObject.sharedInstance
            for data in result as! [NSManagedObject] {
                user.useraccountid = data.value(forKey: "useraccountid") as! Int
            }
          }catch let err as NSError {
              print(err.debugDescription)
          }
    }
    
    func GetDraftPost()->NSArray{
        let context =  Context()
        let entity =  Entity()
        let request  = NSFetchRequest<NSFetchRequestResult>(entityName:entity.post )
        request.returnsObjectsAsFaults = false
        let isdraft = "1"
        request.predicate = NSPredicate(format: "isDraft == %@", isdraft)
        var arrobj = [Any]()
        do {
            let result = try context.fetch(request)
            for data in result as! [NSManagedObject] {
                let objpost = Post()
                objpost.storyid = Int64(data.value(forKey: "storyid") as! Int)
                objpost.title = data.value(forKey: "title") as! String
                objpost.storyDescription = data.value(forKey: "storyDescription") as! String
                arrobj.append(objpost)
            }
          }catch let err as NSError {
              print(err.debugDescription)
          }
        return arrobj as NSArray
    }
    
}
