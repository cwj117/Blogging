//
//  ViewController.swift
//  UnownedVsWeak
//
//  Created by Kiran Jasvanee on 10/15/18.
//  Copyright © 2018 Kiran Jasvanee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "CheckWeakSelf" {
            if let destinationController = segue.destination as? UnownedVsWeakViewController {
                destinationController.referenceChoice = .weak
            }
        }
        if segue.identifier == "CheckUnownedSelf" {
            if let destinationController = segue.destination as? UnownedVsWeakViewController {
                destinationController.referenceChoice = .unowned
            }
        }
    }
}

