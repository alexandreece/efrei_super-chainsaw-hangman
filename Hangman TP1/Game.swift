//
//  Game.swift
//  Hangman TP1
//
//  Created by Alexandre on 06/04/2018.
//  Copyright © 2018 Alexandre. All rights reserved.
//

import Foundation

class Game {

    var word: String
    var nbEchecs: Int
    var foundLetters: String
    var nbEssais: Int

    init() {
        nbEchecs = 0
        foundLetters = ""
        nbEssais = Int()
        word = String()
        for _ in word {
            foundLetters = "\(foundLetters)_"
        }
    }

    func play(letter: Character) {
        if isLetterInWord(letter: letter, word: word) {
            var position = 0
            for character in word {
                if character == letter {
                    foundLetters = "\(foundLetters.prefix(position))\(letter)\(foundLetters.dropFirst(position + 1))"
                }
                position += 1
            }
            if foundLetters == word {
                //END WON
            }
        } else {
            nbEchecs += 1
            //UPDATE IMAGE
            if nbEchecs == nbEssais {
                //END LOST
            }
        }
    }
}

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
