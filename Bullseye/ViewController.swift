//
//  ViewController.swift
//  Bullseye
//
//  Created by Appinventiv on 19/08/19.
//  Copyright © 2019 Appinventiv. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var currentvalue:Int = 0
    var targetValue:Int = 0
    var Score = 0
    var round = 0
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let roundedValue = slider.value.rounded()
        currentvalue = Int(roundedValue)
        
        reset()
        
        
    }
    @IBAction func showAlert() {
        let difference = abs(currentvalue - targetValue)
        var points = 100 - difference
        Score += points
        
        let title:String
        if difference == 0 {
            points += 100
            title = "Perfect"
        } else if difference < 5 {
            title = "You almost had it"
            if difference == 1 {
                points += 50
            }
        } else if difference < 10 {
            title = "Pretty good"
        }
        else {
            title = "Not even closer"
        }
        
        
        let message = "Your points is \(points)"
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default, handler: {
            action in self.newRound()
        })
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
    }
    
    @IBAction func sliderReader(_ slider: UISlider){
        //print("the value of slider is \(slider.value)")
        let roundedValue = slider.value.rounded()
        //print("the rounded value of slider is \(roundedValue)")
        currentvalue = Int(roundedValue)
        
    }
    
    func newRound(){
        targetValue = Int.random(in: 1...100)
        currentvalue = 50
        slider.value = Float(currentvalue)
        updateLabel()
        
    }
    func updateLabel(){
        label1.text = String(targetValue)
        label2.text = String(Score)
        round += 1
        label3.text = String(round)
    }
   @IBAction func reset(){
        Score = 0
        round = 0
        newRound()
    }
    
}

