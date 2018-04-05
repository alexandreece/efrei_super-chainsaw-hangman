//
//  ViewController.swift
//  HangMan TP1
//
//  Created by Alexandre on 28/03/2018.
//  Copyright © 2018 Alexandre. All rights reserved.
//

import UIKit

class GamePlayViewController: UIViewController {

    @IBOutlet weak var labelWord: UILabel!
    @IBOutlet weak var hangmanImageView: UIImageView!
    let hangmanImages = [#imageLiteral(resourceName:"Hangman-0"), #imageLiteral(resourceName:"Hangman-1"), #imageLiteral(resourceName:"Hangman-2"), #imageLiteral(resourceName:"Hangman-3"), #imageLiteral(resourceName:"Hangman-4"), #imageLiteral(resourceName:"Hangman-5"), #imageLiteral(resourceName:"Hangman-6")]
    var word: String?
    var nbEchecs = 0
    var foundLetters = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        //Resets everything in case you restart the game
        nbEchecs = 0
        labelWord.text = ""
        hangmanImageView.image = nil
        foundLetters = ""
        for case let button as UIButton in self.view.subviews {
            button.isEnabled = true //Resets all uibuttons
        }
        for _ in word! {
            foundLetters = "\(foundLetters)_"
        }
        labelWord.text! = addSpacesInBetweenCharacters(string: foundLetters)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func didPressLetter(_ sender: UIButton) {
        let letter = sender.currentTitle!.first!
        sender.isEnabled = false

        if isLetterInWord(letter: letter, word: word!) {
            var position = 0
            for character in word! {
                if character == letter {
                    foundLetters = "\(foundLetters.prefix(position))\(letter)\(foundLetters.dropFirst(position + 1))"
                }
                position += 1
            }

            labelWord.text = addSpacesInBetweenCharacters(string: foundLetters)

            if foundLetters == word! {
                labelWord.text = "GAGNÉ"

                let popupEndGame = UIAlertController(title: "Gagné !", message: "Vous avez trouvé toutes les lettres. Rejouez !", preferredStyle: .alert)
                let actionRestart = UIAlertAction(title: "Recommencer", style: .default) { (action: UIAlertAction) in
                    self.viewDidLoad()
                }
                popupEndGame.addAction(actionRestart)

                self.present(popupEndGame, animated: true, completion: nil)
            }
        } else {
            nbEchecs += 1

            hangmanImageView.image = hangmanImages[nbEchecs - 1]

            if nbEchecs == hangmanImages.count {
                labelWord.text = "PERDU"

                let popupEndGame = UIAlertController(title: "Perdu ! Le mot était \(word!).", message: "Vous avez utilisé tous vos essais. Réessayez !", preferredStyle: .alert)
                let actionRestart = UIAlertAction(title: "Recommencer", style: .default) { (action: UIAlertAction) in
                    self.viewDidLoad()
                }
                popupEndGame.addAction(actionRestart)

                self.present(popupEndGame, animated: true, completion: nil)
            }
        }
    }
}
