//
//  ViewController.swift
//  lifeCounter
//
//  Created by Lindsy M on 4/21/25.
//

import UIKit

class Player {
    var name : String
    var playerNum : Int
    var lifeCount = 20
    
    var lifeCountLabel = UILabel()
    let playerNameLabel = UILabel()
    let lifeChange = UITextField()
    let lifeAdd = UIButton()
    let lifeSub = UIButton()
    let lost = UILabel()
    
    var horizontalStack = UIStackView()
    
    
    init(name : String, playerNum : Int) {
        self.name = name
        self.playerNum = playerNum
        
        horizontalStack.distribution = .fillEqually
        horizontalStack.spacing = 10
        horizontalStack.alignment = .center
        
        playerNameLabel.text = "player \(playerNum)"
        playerNameLabel.font = UIFont.systemFont(ofSize: 36, weight: .bold)
        horizontalStack.addArrangedSubview(playerNameLabel)
        
        lifeCountLabel.text = "20"
        lifeCountLabel.font = UIFont.systemFont(ofSize: 28)
        horizontalStack.addArrangedSubview(lifeCountLabel)
        
        lifeChange.placeholder = "enter quantity"
        lifeChange.font = UIFont.systemFont(ofSize: 20)
        horizontalStack.addArrangedSubview(lifeChange)

        
        lifeAdd.setTitle("+", for: .normal)
        lifeAdd.tag = playerNum
        lifeAdd.backgroundColor = .systemBlue
        horizontalStack.addArrangedSubview(lifeAdd)
        
        lifeSub.setTitle("-", for: .normal)
        lifeSub.tag = playerNum
        lifeSub.backgroundColor = .systemBlue
        lifeSub.setTitleColor(.white, for: .normal)
        horizontalStack.addArrangedSubview(lifeSub)
        
        lost.text = "player \(playerNum) LOSES!"
        lost.textColor = .red
        horizontalStack.addArrangedSubview(lost)
        lost.isHidden = true;
    }
    
    deinit {
        print("deleted")
    }
}



class ViewController: UIViewController {
    var p1 = Player(name: "player 1", playerNum: 1)
    var p2 = Player(name: "player 2", playerNum: 2)
    var p3 = Player(name: "player 3", playerNum: 3)
    var p4 = Player(name: "player 4", playerNum: 4)
    var allPlayers : [Player] = []
    
    var playerNum = 4;
    @IBOutlet weak var addPlayers: UIButton!
    @IBOutlet weak var removePlayers: UIButton!
    
    @IBOutlet weak var history: UIButton!
    var allHistory : [UILabel] = []
    
    @IBOutlet weak var vertStack: UIStackView!
    

    @IBAction func changeNumPlayers (_ sender: UIButton) {
        if(sender == addPlayers) {
            playerNum = playerNum + 1
            let temp = Player(name: "player \(playerNum)", playerNum: playerNum)
            setUpPlayer(temp)
        } else {
            let temp = allPlayers.removeLast()
            vertStack.removeArrangedSubview(temp.horizontalStack)
            temp.horizontalStack.removeFromSuperview()
            playerNum = playerNum - 1
        }
        
        if (playerNum < 8) {
            addPlayers.isHidden = false
        } else {
            addPlayers.isHidden = true
        }
        
        if (playerNum > 2) {
            removePlayers.isHidden = false
        } else {
            removePlayers.isHidden = true
        }
    }
    
    func setUpPlayer(_ player: Player) {
        
        player.lifeAdd.addTarget(self, action: #selector(addHandler(_:)), for: .touchUpInside)
        player.lifeSub.addTarget(self, action: #selector(subHandler(_:)), for: .touchUpInside)
        allPlayers.append(player)
        vertStack.addArrangedSubview(player.horizontalStack)
        
    }
    
    
    @objc func addHandler (_ sender: UIButton) {
        addPlayers.isHidden = true
        removePlayers.isHidden = true
        
        let temp = sender.tag - 1
        let change = Int(allPlayers[temp].lifeChange.text ?? "0")
        allPlayers[temp].lifeCount = allPlayers[temp].lifeCount + (change ?? 0)
        allPlayers[temp].lifeCountLabel.text = String(allPlayers[temp].lifeCount)
        
        if let change = Int(allPlayers[temp].lifeChange.text ?? "0"), change != 0 {
            var addHistory = UILabel()
            addHistory.text = "\(allPlayers[temp].name) lost \(change) life"
            allHistory.append(addHistory)
        }
    }
    
    @objc func subHandler (_ sender: UIButton) {
        addPlayers.isHidden = true
        removePlayers.isHidden = true
        
        let temp = sender.tag - 1
        let change = Int(allPlayers[temp].lifeChange.text ?? "0")
        allPlayers[temp].lifeCount = allPlayers[temp].lifeCount - (change ?? 0)
        allPlayers[temp].lifeCountLabel.text = String(allPlayers[temp].lifeCount)
        
        if (allPlayers[temp].lifeCount <= 0) {
            allPlayers[temp].lost.isHidden = false
        }
        
        if let change = Int(allPlayers[temp].lifeChange.text ?? "0"), change != 0 {
            var addHistory = UILabel()
            addHistory.text = "\(allPlayers[temp].name) lost \(change) life"
            allHistory.append(addHistory)
        }
    }
    
    @IBAction func historyRequested (_ sender: UIButton) {
        performSegue(withIdentifier: "goToNext", sender: self)
    }
    
    
      
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToNext" {
            let destinationVC = segue.destination as? SecondViewController
            destinationVC?.allHistory = allHistory

        }
    }



    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        setUpPlayer(p1)
        setUpPlayer(p2)
        setUpPlayer(p3)
        setUpPlayer(p4)
        
    }

}





