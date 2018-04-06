//
//  Game.swift
//  Hangman TP1
//
//  Created by Alexandre on 06/04/2018.
//  Copyright © 2018 Alexandre. All rights reserved.
//

import Foundation

protocol GameDelegate {
    func updateLabel(label: String)
    func updateImageView(image: Int)
    func endGame(won: Bool)
}

class Game {

    var word: String
    var nbEchecs: Int
    var foundLetters: String
    var nbEssais: Int

    init(word: String) {
        nbEchecs = 0
        foundLetters = String()
        nbEssais = Int()
        self.word = word
        for _ in word {
            foundLetters = "\(foundLetters)_"
        }
    }

    func play(letter: Character, del: GameDelegate) {
        if word.contains(letter) {
            var position = 0
            for character in word {
                if character == letter {
                    foundLetters = "\(foundLetters.prefix(position))\(letter)\(foundLetters.dropFirst(position + 1))"
                }
                position += 1
            }
            del.updateLabel(label: addSpacesBetweenCharacters(string: foundLetters))
            if foundLetters == word {
                del.endGame(won: true)
            }
        } else {
            nbEchecs += 1
            del.updateImageView(image: nbEchecs - 1)
            if nbEchecs == nbEssais {
                del.endGame(won: false)
            }
        }
    }
}

func addSpacesBetweenCharacters(string: String) -> String {
    var result = ""
    for character in string {
        result = "\(result)\(character) "
    }
    return result
}