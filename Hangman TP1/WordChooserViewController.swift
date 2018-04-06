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

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func unwindToWordChooserVC(segue: UIStoryboardSegue) {
    }

    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "startGame" {
            if let destinationVC = segue.destination as? GamePlayViewController {
                destinationVC.word = wordChooserTextField.text!.uppercased()
            }
        }
    }
}