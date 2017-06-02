//
//  ViewController.swift
//  CuteDogs
//
//  Created by pair on 6/1/17.
//  Copyright © 2017 pair. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    @IBOutlet weak var dogNameTextfield: UITextField!
    var managedObjectContext: NSManagedObjectContext!
    
    @IBAction func handleAddDogButtontapped(_ sender: Any) {
        guard let name = dogNameTextfield.text else { return }
        print(managedObjectContext)
        guard let dog = NSEntityDescription.insertNewObject(forEntityName: "Dog", into: managedObjectContext) as? Dog else { fatalError() }
        dog.name = name
        
        try! managedObjectContext.save()
        dogNameTextfield.text = ""
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let showDogViewcontroller = segue.destination as? ShowDogViewController else { fatalError() }
        showDogViewcontroller.managedObjectContext = managedObjectContext
    }


}

