//
//  DBoperation.swift
//  Storyhouse
//
//  Created by Gany Ganesh on 25/09/21.
//

import UIKit
import CoreData

class DBoperation: NSObject {
 
    private func Context()->NSManagedObjectContext{
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        return context
    }
    func saveContext() {
      let context = Context()
      if context.hasChanges {
        do {
          try context.save()
        } catch {
          let nserror = error as NSError
          fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }
      }
    }
    
    func InsertGoogleObject(obj:GoogleObject){
        let context = Context()
        let objentity = Entity()
        let entity =  NSEntityDescription.entity(forEntityName: objentity.useraccount, in: context)
        let newuser = NSManagedObject(entity: entity!, insertInto: context)
        newuser.setValue(obj.useraccountid, forKey: "useraccountid")
        newuser.setValue(obj.fullname, forKey:"fullname" )
        newuser.setValue(obj.email, forKey: "email")
        saveContext()
    }
    
    func InsertCreatedPost(post:Post){
        let context = Context()
        let objentity = Entity()
        let objgoog = GoogleObject.sharedInstance
        let entity =  NSEntityDescription.entity(forEntityName: objentity.post, in: context)
        let objpost = NSManagedObject(entity: entity!, insertInto: context)
        objpost.setValue(post.title, forKey: "title")
        objpost.setValue(post.storyDescription, forKey: "storyDescription")
        objpost.setValue(post.isDraft, forKey: "isDraft")
        objpost.setValue(post.isPost, forKey: "isPost")
        objpost.setValue(objgoog.useraccountid, forKey: "useraccountid")
        objpost.setValue(objgoog.storyid, forKey: "storyid")
        saveContext()
    }
    
    
    
}
