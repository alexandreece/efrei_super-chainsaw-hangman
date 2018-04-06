//
//  WordChooserViewController.swift
//  Hangman TP1 & 2
//
//  Created by Alexandre on 04/04/2018.
//  Copyright © 2018 Alexandre. All rights reserved.
//

import UIKit

class WordChooserViewController: UIViewController {

    @IBOutlet weak var wordChooserTextField: UITextField!
    @IBAction func unwindToWordChooserVC(segue: UIStoryboardSegue) {
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