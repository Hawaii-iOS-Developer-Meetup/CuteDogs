//
//  ShowDogViewController.swift
//  CuteDogs
//
//  Created by pair on 6/1/17.
//  Copyright © 2017 pair. All rights reserved.
//

import UIKit
import CoreData


class ShowDogViewController: UIViewController {
    
    @IBOutlet weak var dogNameLabel: UILabel!
    var managedObjectContext: NSManagedObjectContext!

    override func viewDidLoad() {
        super.viewDidLoad()

        let fetchRequest = NSFetchRequest<Dog>(entityName: "Dog")
        let predicate = NSPredicate(format:"name CONTAINS %@", "Benji")
        fetchRequest.predicate = predicate
        let dogs = try! managedObjectContext.fetch(fetchRequest)
        if let firstDog = dogs.first {
            dogNameLabel.text = firstDog.name
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
