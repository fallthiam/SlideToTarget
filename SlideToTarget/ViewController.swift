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
    var totalScore: Int = 0
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startNewRound()
    }

    @IBAction func showAlert(){
        var roundScore: Int
        roundScore = getRoundScore()
        totalScore += roundScore
        let message = "You get \(roundScore) points" +
        "your total score is \(totalScore)"
        let alert = UIAlertController(title: "Result", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "ok", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        startNewRound()
    }
    
    @IBAction func sliderValue(_ slider: UISlider){
        let roundedValue = slider.value.rounded()
        currentValue = Int(roundedValue)
    }
    
    func startNewRound(){
        targetValue = Int(arc4random_uniform(99)) + 1
        updateLabels()
        currentValue = 50
        slider.value = Float(currentValue)
    }
    
    func updateLabels(){
        let targetToDisplay = String(targetValue)
        targetLabel.text = targetToDisplay
    }
    
    func getRoundScore() -> Int{
        var difference:Int = targetValue - currentValue
        if difference < 0 {
            difference *= -1
        }
        return 100 - difference
    }

}

