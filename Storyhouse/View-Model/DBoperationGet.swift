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
        let request  = NSFetchRequest<NSFetchRequestResult>(entityName:entity.post )
        do {
            let result = try context.fetch(request)
            let user = GoogleObject()
            for data in result as! [NSManagedObject] {
                user.useraccountid = data.value(forKey: "useraccountid") as! Int
            }
          }catch let err as NSError {
              print(err.debugDescription)
          }
    }
}
