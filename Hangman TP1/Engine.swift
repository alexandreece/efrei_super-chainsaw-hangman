//
//  Engine.swift
//  Hangman TP1
//
//  Created by Alexandre on 05/04/2018.
//  Copyright © 2018 Alexandre. All rights reserved.
//

import UIKit

func isLetterInWord(letter: Character, word: String) -> Bool {
    return word.contains(letter)
}

func addSpacesBetweenCharacters(string: String) -> String {
    var result = ""
    for character in string {
        result = "\(result)\(character) "
    }
    return result
}

func updateGame(vc: GamePlayViewController, letter: Character) {
    if isLetterInWord(letter: letter, word: vc.word!) {
        var position = 0
        for character in vc.word! {
            if character == letter {
                vc.foundLetters = "\(vc.foundLetters.prefix(position))\(letter)\(vc.foundLetters.dropFirst(position + 1))"
            }
            position += 1
        }

        vc.labelWord.text = addSpacesBetweenCharacters(string: vc.foundLetters)

        if vc.foundLetters == vc.word! {
            let popupEndGame = UIAlertController(title: "Gagné !", message: "Vous avez trouvé toutes les lettres. Rejouez !", preferredStyle: .alert)
            let actionRestart = UIAlertAction(title: "Recommencer", style: .default) { (action: UIAlertAction) in
                vc.performSegue(withIdentifier: "unwindSegueRestart", sender: vc)
            }
            popupEndGame.addAction(actionRestart)
            vc.present(popupEndGame, animated: true, completion: nil)
        }
    } else {
        vc.nbEchecs += 1
        vc.hangmanImageView.image = vc.hangmanImages[vc.nbEchecs - 1]
        if vc.nbEchecs == vc.hangmanImages.count {
            vc.labelWord.text = "PERDU"
            let popupEndGame = UIAlertController(title: "Perdu ! Le mot était \(vc.word!).", message: "Vous avez utilisé tous vos essais. Réessayez !", preferredStyle: .alert)
            let actionRestart = UIAlertAction(title: "Recommencer", style: .default) { (action: UIAlertAction) in
                vc.performSegue(withIdentifier: "unwindSegueRestart", sender: vc)
            }
            popupEndGame.addAction(actionRestart)
            vc.present(popupEndGame, animated: true, completion: nil)
        }
    }
}