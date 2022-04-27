//
//  ViewController.swift
//  SimpleCalculator
//
//  Created by Lakith Pusarla on 27/04/22.
//  Copyright © 2022 Lakith Pusarla. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        displayLabel.text = "0"
    }

    
    @IBOutlet weak var displayLabel: UILabel!
    
    @IBAction func keyPressed(_ sender: UIButton) {
        print(sender.tag)
        if sender.tag == 15{
            displayLabel.text = "0"
        } else {
            displayLabel.text = String(sender.tag)
        }
        
        
    }
    
    @IBAction func noResponse(_ sender: UIButton){
        displayLabel.text = "Currently not working"
    }
    
    func changeLabel(_ text: Int){
        displayLabel.text = String(text)
    }
    
}

