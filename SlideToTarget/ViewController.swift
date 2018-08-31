//
//  ViewController.swift
//  SlideToTarget
//
//  Created by Fall Thiam on 2018-08-31.
//  Copyright © 2018 diversussum. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func showAlert(){
        let alert = UIAlertController(title: "Hello world", message: "This is my first app", preferredStyle: .alert)
        let action = UIAlertAction(title: "Awesome", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }


}

