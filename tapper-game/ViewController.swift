//
//  ViewController.swift
//  tapper-game
//
//  Created by Anthony Murphy on 10/18/15.
//  Copyright © 2015 4oh2 Studios. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Variables
    var maxTaps: Int = 0
    var currentTaps: Int = 0
    
    
    //Outlets
    @IBOutlet weak var logoImg: UIImageView!
    @IBOutlet weak var howManyTapsTxt: UITextField!
    @IBOutlet weak var playBtn: UIButton!

    @IBOutlet weak var tapBtn: UIButton!
    @IBOutlet weak var tapsLabel: UILabel!
    
    //Functions
    func updateTapsLabel() {
        tapsLabel.text = "\(currentTaps) Taps"
    }
    
    func isGameOver() -> Bool {
        if currentTaps >= maxTaps {
            return true
        } else {
            return false
        }
    }
    
    func restartGame() {
        maxTaps = 0
        howManyTapsTxt.text = ""
        
        logoImg.hidden = false
        playBtn.hidden = false
        howManyTapsTxt.hidden = false
        
        tapBtn.hidden = true
        tapsLabel.hidden =  true
    }
    
    //Actions
    @IBAction func onPlayBtnPressed(sender: UIButton!) {
        
        if howManyTapsTxt.text != nil && howManyTapsTxt.text != "" {

            logoImg.hidden = true
            howManyTapsTxt.hidden = true
            playBtn.hidden = true
            
            tapBtn.hidden = false
            tapsLabel.hidden = false
            
            maxTaps = Int(howManyTapsTxt.text!)!
            currentTaps = 0
            
            updateTapsLabel()
        
        }
        
    }
    
    @IBAction func onCoinTap(sender: UIButton!) {
        
        currentTaps++
        updateTapsLabel()
        
        if isGameOver() {
            restartGame()
        }
    }

}

