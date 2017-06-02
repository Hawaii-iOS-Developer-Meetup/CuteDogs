//
//  AppDelegate.swift
//  CuteDogs
//
//  Created by pair on 6/1/17.
//  Copyright © 2017 pair. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        let persistentContainer = NSPersistentContainer(name: "Model")
        
        persistentContainer.loadPersistentStores { (_, error) in
            guard error == nil else { fatalError() }
            
            DispatchQueue.main.async {
                let context = persistentContainer.viewContext
                
                let storyboard = UIStoryboard(name:"Main", bundle: nil)
                guard let viewController = storyboard.instantiateViewController(withIdentifier: "vc1") as? ViewController else { fatalError() }
                viewController.managedObjectContext = context
                
                let nav = UINavigationController(rootViewController: viewController)
                self.window?.rootViewController = nav
            }
            
        }
        
        
        return true
    }


}

