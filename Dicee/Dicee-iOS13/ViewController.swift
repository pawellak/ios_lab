//
//  ViewController.swift
//  Dicee-iOS13
//
//  Created by Angela Yu on 11/06/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
   
    @IBOutlet weak var diceImageViewOne: UIImageView!
    @IBOutlet weak var diceImageViewTwo: UIImageView!
    @IBOutlet weak var diceButton: UIButton!
        
    @IBAction func onDicePressed(_ sender: UIButton) {
        var firstDice = getDiceName(number:Int.random(in: 1...6))
        var secondDice = getDiceName(number:Int.random(in: 1...6))
        
        diceImageViewOne.image =  UIImage(named: firstDice)
        diceImageViewTwo.image =  UIImage(named: secondDice)
        
    }

    func getDiceName(number: Int) -> String {
      switch number {
        case 1:
            return "DiceOne"
        case 2:
            return "DiceTwo"
        case 3:
            return "DiceThree"
        case 4:
            return "DiceFour"
      case 5:
          return "DiceFive"
      case 6:
          return "DiceSix"
        default:
          return ""
        }
    }
}

