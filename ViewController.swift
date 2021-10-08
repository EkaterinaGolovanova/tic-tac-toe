//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by Ekaterina Golovanova on 6/20/20.
//  Copyright © 2020 Ekaterina Golovanova. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var button_0: UIButton!
    @IBOutlet var button_1: UIButton!
    @IBOutlet var button_2: UIButton!
    @IBOutlet var button_3: UIButton!
    @IBOutlet var button_4: UIButton!
    @IBOutlet var button_5: UIButton!
    @IBOutlet var button_6: UIButton!
    @IBOutlet var button_7: UIButton!
    @IBOutlet var button_8: UIButton!
    @IBOutlet var playAgainButton: UIButton!
    @IBOutlet var winnerLabel: UILabel!

    var activeUser = 1 // Cross
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    var winSets = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7],
    [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    var gameIsActive = true

    @IBAction func userplay(_ sender: UIButton) {
        // Start the game
        if (gameState[sender.tag] == 0 && gameIsActive) {
            gameState[sender.tag] = activeUser
            if (activeUser == 1) {
                sender.setImage(UIImage(named: "Cross.png"), for: UIControl.State())
                activeUser = 2
            }
            else {
                sender.setImage(UIImage(named: "Nought.png"), for: UIControl.State())
                activeUser = 1
            }
        }
        // Check for a winner
        for winSet in winSets {
            if gameState[winSet[0]] != 0 && gameState[winSet[0]] == gameState[winSet[1]] && gameState[winSet[1]] == gameState[winSet[2]] {
                gameIsActive = false
                if gameState[winSet[0]] == 1 {
                    winnerLabel.text = "CROSS HAS WON!"
                } else {
                    winnerLabel.text = "NOUGHT HAS WON!"
                }
                playAgainButton.isHidden = false
                winnerLabel.isHidden = false
                return
            }
        }
        gameIsActive = false

        for i in gameState {
            if i == 0 {
                gameIsActive = true
                break
            }
        }
        if gameIsActive == false {
            winnerLabel.text = "IT'S A TIE!"
            winnerLabel.isHidden = false
            playAgainButton.isHidden = false
        }
    }

    @IBAction func playAgain(_ sender: UIButton) {
        gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        activeUser = 1
        gameIsActive = true

        playAgainButton.isHidden = true
        winnerLabel.isHidden = true

        button_0.setImage(nil, for: UIControl.State())
        button_1.setImage(nil, for: UIControl.State())
        button_2.setImage(nil, for: UIControl.State())
        button_3.setImage(nil, for: UIControl.State())
        button_4.setImage(nil, for: UIControl.State())
        button_5.setImage(nil, for: UIControl.State())
        button_6.setImage(nil, for: UIControl.State())
        button_7.setImage(nil, for: UIControl.State())
        button_8.setImage(nil, for: UIControl.State())
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

