//
//  SecondViewController.swift
//  lifeCounter
//
//  Created by Lindsy M on 4/24/25.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var vertStack: UIStackView!
    var allHistory : [UILabel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if (allHistory.count >= 1) {
            for index in 0 ... allHistory.count - 1 {
                vertStack.addArrangedSubview(allHistory[index])
            }
        }
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
