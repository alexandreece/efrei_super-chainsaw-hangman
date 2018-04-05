//
//  Engine.swift
//  Hangman TP1
//
//  Created by Alexandre on 05/04/2018.
//  Copyright © 2018 Alexandre. All rights reserved.
//

import Foundation

func isLetterInWord(letter: Character, word: String) -> Bool {
    return word.contains(letter)
}

func addSpacesInBetweenCharacters(string: String) -> String {
    var result = ""
    for character in string {
        result = "\(result)\(character) "
    }
    return result
}
