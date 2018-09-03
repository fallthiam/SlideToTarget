//
//  ViewController.swift
//  SlideToTarget
//
//  Created by Fall Thiam on 2018-08-31.
//  Copyright © 2018 diversussum. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var currentValue: Int = 0
    var targetValue: Int = 0
    @IBOutlet weak var slider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startNewRound()
    }

    @IBAction func showAlert(){
        let message = "Current value is \(currentValue)" +
        " the target value is \(targetValue)"
        let alert = UIAlertController(title: "Current value is :", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "ok", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func sliderValue(_ slider: UISlider){
        let roundedValue = slider.value.rounded()
        currentValue = Int(roundedValue)
        targetValue = Int(arc4random_uniform(99)) + 1
    }
    
    func startNewRound(){
        targetValue = Int(arc4random_uniform(99)) + 1
        currentValue = 50
        slider.value = Float(currentValue)
    }

}

