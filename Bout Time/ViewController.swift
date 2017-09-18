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
var appleHistoricalEvents = newSet()

class ViewController: UIViewController {
    
    var displayScore = "" // to hold the place of dispalyScore
    var link = "" // hold place of link
    var selectedLink = "" // hold place of selectedLink
    // Timer variable
    var timer = Timer()
    var isTimerRunning = false
    

    // variables assigned the index of events
    var event1 = appleHistoricalEvents.0
    var event2 = appleHistoricalEvents.1
    var event3 = appleHistoricalEvents.2
    var event4 = appleHistoricalEvents.3
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
    
    @IBOutlet weak var learnMore: UIButton!
    
    
    override func viewDidLoad() {
       super.viewDidLoad()
       setupGame()
        runTimer()
        view.layer.cornerRadius = 10
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    // Hides the status bar
    override var prefersStatusBarHidden: Bool {
        return true
    }
    // The next 6 IBAction functions move the text up and down
    @IBAction func moveLowerMiddleUp(_ sender: Any) {
        //upButton02
        moveUpperMiddleDown(Any.self)
    }
    
    @IBAction func moveUpperMiddleDown(_ sender: Any) {
        //downButton02
        let tempEventTwo = appleHistoricalEvents.1
        let tempEventThree = appleHistoricalEvents.2
        
        //SwapEvents
        appleHistoricalEvents.1 = tempEventThree
        appleHistoricalEvents.2 = tempEventTwo
        
        moveTitleOfButtons(event02, destination: event03)
    }
    
    @IBAction func moveUpperMiddleUp(_ sender: Any) {
        //upButton01
        moveTopDown(Any.self)
    }
    
    @IBAction func moveTopDown(_ sender: Any) {
        //downButton01
        let tempEventOne = appleHistoricalEvents.0
        let tempEventTwo = appleHistoricalEvents.1
        
        appleHistoricalEvents.0 = tempEventTwo
        appleHistoricalEvents.1 = tempEventOne
        moveTitleOfButtons(event01, destination: event02)
    }
    
    @IBAction func moveLowerMiddleDown(_ sender: Any) {
        //downButton03
        moveBottomEventUp(Any.self)
    }
    
    @IBAction func moveBottomEventUp(_ sender: Any) {
        //upButton03
        let tempEventThree = appleHistoricalEvents.2
        let tempEventFour = appleHistoricalEvents.3
        
        appleHistoricalEvents.2 = tempEventFour
        appleHistoricalEvents.3 = tempEventThree
        
        moveTitleOfButtons(event03, destination: event04)
    }
    

    // simply goes to next round
    @IBAction func performNextRound(_ sender: RoundButton) {
        nextRound()
        timer.invalidate()
        runTimer()
    }
    // Assigns the url of the data to its own button/text
    @IBAction func learnMore(_ sender: UIButton) {
        switch sender {
        case event01: link = event1.url
        selectedLink = "Learn More"
            performSegue(withIdentifier: "segue1", sender: appleHistoricalEvents.0.url)
        case event02: link = event2.url
        selectedLink = "Learn More"
            performSegue(withIdentifier: "segue2", sender: appleHistoricalEvents.1.url)
        case event03: link = event3.url
        selectedLink = "Learn More"
            performSegue(withIdentifier: "segue3", sender: appleHistoricalEvents.2.url)
        case event04: link = event4.url
        selectedLink = "Learn More"
            performSegue(withIdentifier: "segue4", sender: appleHistoricalEvents.3.url)
        default: break
        }
    }
    
    // shake gesture func
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            timerLabel.isHidden = true
            timer.invalidate()
            checkAnswer()
            let directionButtons = [downButton01, downButton02, downButton03, upButton01, upButton02, upButton03]
            for button in directionButtons {
                button?.isEnabled = false
            }
            print(roundsCompleted)
            learnMore.setTitle("Tap Event To learn more", for: .normal)
        }
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if selectedLink == "Game Over" {
//            let newView = segue.destination as! ScoreViewController
//            newView.title = displayScore
//        } else
            if selectedLink == "Learn More" {
            let learnMoreView = segue.destination as! WebViewController
            learnMoreView.link = link
        }
    }
    
    // Check Answer func to check the order of events
    func checkAnswer() {
        if appleHistoricalEvents.0.year <= appleHistoricalEvents.1.year && appleHistoricalEvents.1.year <= appleHistoricalEvents.2.year && appleHistoricalEvents.2.year <= appleHistoricalEvents.3.year {
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
            roundsCompleted = 0
        } else {
            roundsCompleted += 1
            displayEvent()
            learnMore.setTitle("Shake to check answer", for: .normal)
            resetTimer()
            timerLabel.isHidden = false
            timerLabel.text = "1:00"
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
        } else {
            seconds -= 1
            timerLabel.text = "0:\(seconds)"
        }
        
        if seconds < 1 {
            timer.invalidate()
            timerLabel.isHidden = true
            checkAnswer()
            roundsCompleted += 1
            print(roundsCompleted)
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
        timerLabel.text = "0:\(seconds)"
        
    }
    
    // displaying my events. YAY APPLE
    func displayEvent() {
        
        appleHistoricalEvents = newSet()
        event1 = appleHistoricalEvents.0
        event2 = appleHistoricalEvents.1
        event3 = appleHistoricalEvents.2
        event4 = appleHistoricalEvents.3
    
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
        seconds = 60
        displayEvent()
        //randomEvents()
        nextRoundFailure.isHidden = true
        nextRoundSuccess.isHidden = true
        
        
    }
    
    // function that moves the buttons titles which is then used in the switch statment above
    func moveTitleOfButtons(_ original: UIButton, destination: UIButton) {
        let firstTitle = original.title(for: .normal)
        let secondTitle = destination.title(for: .normal)
        
        original.setTitle(secondTitle, for: .normal)
        destination.setTitle(firstTitle, for: .normal)
    }

}











