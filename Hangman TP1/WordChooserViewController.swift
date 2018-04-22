//
//  WordChooserViewController.swift
//  Hangman TP1 & 2
//
//  Created by Alexandre on 04/04/2018.
//  Copyright © 2018 Alexandre. All rights reserved.
//

import UIKit

class WordChooserViewController: UIViewController {

    lazy var words: [String] = []

    @IBOutlet weak var wordChooserTextField: UITextField!

    @IBAction func unwindToWordChooserVC(segue: UIStoryboardSegue) {
    }

    @IBAction func didPressLackImagination(_ sender: Any) {
        let path = Bundle.main.path(forResource: "words", ofType: "plist")
        let dict: NSArray = NSArray(contentsOfFile: path!)!
        for word in dict {
            words.append(word as! String)
        }
        let randomIndex = Int(arc4random_uniform(UInt32(words.count)))
        wordChooserTextField.text = words[randomIndex]
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "startGame" {
            if let destinationVC = segue.destination as? GamePlayViewController {
                let game = Game(word: wordChooserTextField.text!.uppercased())
                destinationVC.game = game
            }
        }
    }
}