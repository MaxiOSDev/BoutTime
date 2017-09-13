//
//  ViewController.swift
//  Bout Time
//
//  Created by Max Ramirez on 9/5/17.
//  Copyright © 2017 MaxRamirez. All rights reserved.


// WARNING! NEEDS REFACTORING. PLEASE BARE WITH ME
import UIKit
import GameKit
// variable with randomized events that doesnt repeat
var appleHistoricalEvents = randomizedEvents()

class ViewController: UIViewController {
    

    // Timer variable
    var timer = Timer()
    var isTimerRunning = false
    

    // variables assigned the index of events
    var event1 = appleHistoricalEvents[0]
    var event2 = appleHistoricalEvents[1]
    var event3 = appleHistoricalEvents[2]
    var event4 = appleHistoricalEvents[3]
    // outlets for labels and buttons
    @IBOutlet weak var timerLabel: UILabel!

    @IBOutlet weak var event01: UIButton!
    @IBOutlet weak var event02: UIButton!
    @IBOutlet weak var event03: UIButton!
    @IBOutlet weak var event04: UIButton!
    
    
    @IBOutlet weak var downButton01: UIButton!
    @IBOutlet weak var downButton02: UIButton!
    @IBOutlet weak var downButton03: UIButton!
    @IBOutlet weak var upButton01: UIButton!
    @IBOutlet weak var upButton02: UIButton!
    @IBOutlet weak var upButton03: UIButton!
    @IBOutlet weak var nextRoundSuccess: RoundButton!
    @IBOutlet weak var nextRoundFailure: RoundButton!

    
    
    
    override func viewDidLoad() {
       super.viewDidLoad()
       setupGame()
        runTimer()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    // moves my buttons text up and down, uses another helper method all the way below.
    @IBAction func moveDirection(_ sender: UIButton) {
      
        switch sender.tag {
        case 1: moveTitleOfButtons(event01, destination: event02)
            
        case 2: moveTitleOfButtons(event02, destination: event01)
            
        case 3: moveTitleOfButtons(event02, destination: event03)
            
        case 4: moveTitleOfButtons(event03, destination: event02)
            
        case 5: moveTitleOfButtons(event03, destination: event04)
            
        case 6: moveTitleOfButtons(event04, destination: event03)
            
        default: break
        }
        
        
    }
    // simply goes to next round
    @IBAction func performNextRound(_ sender: RoundButton) {
       // roundOfQuiz.arrayOfEvents.removeAll()
        nextRound()
        timer.invalidate()
        runTimer()
    }
    // shake gesture func
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            timerLabel.isHidden = true
            timer.invalidate()
          checkAnswer()
            roundsCompleted += 1
        }
    }
    // one of the biggets headaches of my life. I always seem to get failure. Even if it is in the right order.
    func checkAnswer() {
        if event1.year <= event2.year && event2.year <= event3.year && event3.year <= event4.year {
            nextRoundSuccess.isHidden = false
            correctRounds += 1
        } else {
            nextRoundFailure.isHidden = false
        }
        
        
    }
    // function to take me to next round OR to perform the segue going to the score vc
    func nextRound() {
        if roundsCompleted == roundsPerGame {
            performSegue(withIdentifier: "segue", sender: nil)
        } else {
            displayEvent()
            resetTimer()
            timerLabel.isHidden = false
            runTimer()
            nextRoundSuccess.isHidden = true
            nextRoundFailure.isHidden = true
            
        }
    }
    // timer functions
    func runTimer() {
    timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(ViewController.updateTimer)), userInfo: nil, repeats: true)
    }
    
    func updateTimer() {
        if seconds < 1 {
            timer.invalidate()
            Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(myTimerTick), userInfo: nil, repeats: false)
        } else if seconds <= 10 {
            seconds -= 1
            timerLabel.text = "\(seconds)"
        } else {
            seconds -= 1
            timerLabel.text = "\(seconds)"
        }
    }
    
    func myTimerTick() {
        let directionButtons = [downButton01, downButton02, downButton03, upButton01, upButton02, upButton03]
        for button in directionButtons {
            button?.isEnabled = false
        }

    }
    
    func resetTimer() {
        seconds = 60
        timerLabel.text = "\(seconds)"
        
    }
    // displaying my events. YAY APPLE
    func displayEvent() {
        
        appleHistoricalEvents = randomizedEvents()
        event1 = appleHistoricalEvents[0]
        event2 = appleHistoricalEvents[1]
        event3 = appleHistoricalEvents[2]
        event4 = appleHistoricalEvents[3]
    
        event01.setTitle(event1.event, for: .normal)
        event02.setTitle(event2.event, for: .normal)
        event03.setTitle(event3.event, for: .normal)
        event04.setTitle(event4.event, for: .normal)
        
        let directionButtons = [downButton01, downButton02, downButton03, upButton01, upButton02, upButton03]
        for button in directionButtons {
            button?.isEnabled = true
        }
    }
    // setup the game
    func setupGame() {
        eventsPerRound = 4
        eventsUsed = 0
        correctRounds = 0
        indexOfSelectedEvents = 0
        seconds = 60
        displayEvent()
        //randomEvents()
        nextRoundFailure.isHidden = true
        nextRoundSuccess.isHidden = true
        
        
    }
    // function that moves the buttons titles which is then used in the case statment above
    func moveTitleOfButtons(_ original: UIButton, destination: UIButton) {
        let firstTitle = original.title(for: .normal)
        let secondTitle = destination.title(for: .normal)
        
        original.setTitle(secondTitle, for: .normal)
        destination.setTitle(firstTitle, for: .normal)
    }

}












