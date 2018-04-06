//
//  GamePlayViewController.swift
//  Hangman TP1 & 2
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
        for _ in word! {
            foundLetters = "\(foundLetters)_"
        }
        labelWord.text! = addSpacesBetweenCharacters(string: foundLetters)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func didPressLetter(_ sender: UIButton) {
        let letter = sender.currentTitle!.first!
        sender.isEnabled = false
        updateGame(vc: self, letter: letter)
    }

    @IBAction func didPressPause(_ sender: Any) {
    }
}