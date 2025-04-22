//
//  ViewController.swift
//  lifeCounter
//
//  Created by Lindsy M on 4/21/25.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var p2Life: UILabel!
    @IBOutlet weak var p2AddOne: UIButton!
    @IBOutlet weak var p2SubOne: UIButton!
    @IBOutlet weak var p2AddFive: UIButton!
    @IBOutlet weak var p2SubFive: UIButton!
    var p2LifeCount = 20

    
    @IBOutlet weak var p1Life: UILabel!
    @IBOutlet weak var p1AddOne: UIButton!
    @IBOutlet weak var p1SubOne: UIButton!
    @IBOutlet weak var p1AddFive: UIButton!
    @IBOutlet weak var p1SubFive: UIButton!
    var p1LifeCount = 20
    
    @IBOutlet weak var loserMsg: UILabel!
    
    @IBAction func p1LifeChange(_ sender: UIButton) {
        if (sender == p1AddOne) {
            p1LifeCount = p1LifeCount + 1
        } else if (sender == p1SubOne) {
            p1LifeCount = p1LifeCount - 1
        } else if (sender == p1AddFive) {
            p1LifeCount = p1LifeCount + 5
        } else if (sender == p1SubFive) {
            p1LifeCount = p1LifeCount - 5
        }
        
        p1Life.text = String(p1LifeCount)
        print(p1LifeCount)
        if (p1LifeCount <= 0) {
            loserMsg.text = "player 1 LOSES!"
            loserMsg.isHidden = false
        }
    }
    
    @IBAction func p2LifeChange(_ sender: UIButton) {
        if (sender == p2AddOne) {
            p2LifeCount = p2LifeCount + 1
        } else if (sender == p2SubOne) {
            p2LifeCount = p2LifeCount - 1
        } else if (sender == p2AddFive) {
            p2LifeCount = p2LifeCount + 5
        } else if (sender == p2SubFive) {
            p2LifeCount = p2LifeCount - 5
        }
        
        p2Life.text = String(p2LifeCount)
        print(p2LifeCount)
        if (p2LifeCount <= 0) {
            loserMsg.text = "player 2 LOSES!"
            loserMsg.isHidden = false
        }
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        loserMsg.isHidden = true
    }
    
    


}

