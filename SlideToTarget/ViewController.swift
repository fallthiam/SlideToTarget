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
    var round: Int = 0
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var totalScoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //let targetIconImage = UIImage(named: "target_icon.png")
        //targetIconImage.set
        //slider.setThumbImage(targetIconImage, for: .normal)
        startNewRound()
        
    }

    @IBAction func showAlert(){
        var roundScore: Int
        var title: String
        let difference = getDifference()
        var bonus: Int = 0
        if difference == 0 {
            bonus = 100
        }
        roundScore = 100 - difference + bonus
        title = getAlertTitle(difference: difference)
        totalScore += roundScore
        let message = "You get \(roundScore) points"
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "ok", style: .default, handler: {
            action in
            self.startNewRound()
        })
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func sliderValue(_ slider: UISlider){
        let roundedValue = slider.value.rounded()
        currentValue = Int(roundedValue)
    }
    
    func startNewRound(){
        round += 1
        targetValue = Int(arc4random_uniform(99)) + 1
        updateLabels()
        currentValue = 50
        slider.value = Float(currentValue)
        
    }
    
    func updateLabels(){
        let targetToDisplay = String(targetValue)
        targetLabel.text = targetToDisplay
        totalScoreLabel.text = String(totalScore)
        roundLabel.text = String(round)
    }
    
    func getDifference() -> Int {
        var difference:Int = targetValue - currentValue
        if difference < 0 {
            difference *= -1
        }
        return difference
    }
    
    func getAlertTitle(difference: Int) -> String{
        if difference == 0 {
            return "Perfect !!!"
        }
        else if difference <= 5 {
            return "Almost perfect !"
        }
        else if difference <= 15 {
            return "Good"
        }
        else {
            return "So far..."
        }
    }
    
    @IBAction func reset(){
        totalScore = 0
        round = 0
        startNewRound()
    }

}

