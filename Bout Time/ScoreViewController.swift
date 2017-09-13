//
//  ScoreViewController.swift
//  Bout Time
//
//  Created by Max Ramirez on 9/6/17.
//  Copyright © 2017 MaxRamirez. All rights reserved.
//

import UIKit

class ScoreViewController: UIViewController {
   
    
    @IBOutlet weak var resultsLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        displayScore()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func displayScore() {
        if correctRounds == roundsCompleted {
            resultsLabel.text = "\(correctRounds) out of 6"
            scoreLabel.text = "100%! Nice job!"
        } else if correctRounds != roundsCompleted {
            resultsLabel.text = "\(correctRounds) out of 6"
            scoreLabel.text = "We aim for perfection here at Apple. Try Again!"
        }
    }


}
