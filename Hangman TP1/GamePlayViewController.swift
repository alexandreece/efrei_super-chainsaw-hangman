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
    lazy var pauseView = UIView()
    var game: Game?

    override func viewDidLoad() {
        super.viewDidLoad()
        game!.nbEssais = hangmanImages.count
        labelWord.text! = addSpacesBetweenCharacters(string: game!.foundLetters)
    }

    @IBAction func didPressLetter(_ sender: UIButton) {
        let letter = sender.currentTitle!.first!
        sender.isEnabled = false
        game!.play(letter: letter, del: self)
    }

    @IBAction func didPressPause(_ sender: Any) {
        pauseView.frame = view.bounds
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = pauseView.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        pauseView.addSubview(blurEffectView)
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
        button.center = pauseView.center
        button.setTitleColor(.green, for: .normal)
        button.setTitle("Resume", for: .normal)
        button.addTarget(self, action: #selector(didPressResume), for: .touchUpInside)
        pauseView.addSubview(button)
        view.addSubview(pauseView)
    }

    @objc func didPressResume(sender: Any) {
        pauseView.removeFromSuperview()
    }
}

extension GamePlayViewController: GameDelegate {
    func updateLabel(label: String) {
        labelWord.text = label
    }

    func updateImageView(image: Int) {
        hangmanImageView.image = hangmanImages[image]
    }

    func endGame(won: Bool) {
        if won {
            let popupEndGame = UIAlertController(title: "Gagné !", message: "Vous avez trouvé toutes les lettres. Rejouez !", preferredStyle: .alert)
            let actionRestart = UIAlertAction(title: "Recommencer", style: .default) { (action: UIAlertAction) in
                self.performSegue(withIdentifier: "unwindSegueRestart", sender: self)
            }
            popupEndGame.addAction(actionRestart)
            self.present(popupEndGame, animated: true, completion: nil)
        } else {
            let popupEndGame = UIAlertController(title: "Perdu ! Le mot était \(game!.word).", message: "Vous avez utilisé tous vos essais. Réessayez !", preferredStyle: .alert)
            let actionRestart = UIAlertAction(title: "Recommencer", style: .default) { (action: UIAlertAction) in
                self.performSegue(withIdentifier: "unwindSegueRestart", sender: self)
            }
            popupEndGame.addAction(actionRestart)
            self.present(popupEndGame, animated: true, completion: nil)
        }
    }
}