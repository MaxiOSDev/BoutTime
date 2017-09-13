//
//  EventsModel.swift
//  Bout Time
//
//  Created by Max Ramirez on 9/6/17.
//  Copyright © 2017 MaxRamirez. All rights reserved.
//

import Foundation
import UIKit
import GameKit

struct Event {
    let event: String
    let year: Int
    let url: String
}

var arrayOfEvents: [Event] = [Event(event: "Steve Wozniak was born", year: 1950, url: ""),
                                Event(event: "Steve Jobs was born", year: 1955, url: ""),
                                Event(event: "Steve Jobs meets with Steve Wozniak for the first time", year: 1971, url: ""),
                                Event(event: "Jobs drops out of Reed College", year: 1973, url: ""),
                                Event(event: "Jobs works for Altari", year: 1974, url: ""),
                                Event(event: "Apple Founded by Steve Jobs & Wozniak, Ronald Wayne.", year: 1976, url: ""),
                                Event(event: "Apple 2 released.", year: 1977, url: ""),
                                Event(event: "Apple conduscts an initial public offering of 4.6 million shares at $22 per share", year: 1980, url: ""),
                                Event(event: "Apple introduces Lisa.", year: 1983, url: ""),
                                Event(event: "Macintosh introduced.", year: 1984, url: ""),
                                Event(event: "Apple discontinues the Lisa after a disappointing run, and Steve Jobs leaves the company.", year: 1985, url: ""),
                                Event(event: "Apple buys Steve Jobs' company, NeXT Software.", year: 1996, url: ""),
                                Event(event: "In the wake of corporate shakeups and a sales slump, Apple welcomes Jobs back as interim CEO.", year: 1997, url: ""),
                                Event(event: "The iMac, a streamlined personal computer, debuts", year: 1998, url: ""),
                                Event(event: "Jobs becomes permanent CEO.", year: 2000, url: ""),
                                Event(event: "The iPod MP3 player makes its debut.", year: 2001, url: ""),
                                Event(event: "Apple releases the Safari web browser.", year: 2003, url: ""),
                                Event(event: "Apple rolls out its first Intel-based computers, the iMac and the MacBook Pro.", year: 2006, url: ""),
                                Event(event: "The iPhone is unveiled.", year: 2007, url: ""),
                                Event(event: "The iPad is announced.", year: 2010, url: ""),
                                Event(event: "Steve Jobs dies", year: 2011, url: ""),
                                Event(event: "Apple Unveils the Apple Watch", year: 2014, url: ""),
                                Event(event: "Apple unveils Apple Music", year: 2015, url: ""),
                                Event(event: "The European Union rules that Apple must pay Ireland $14.5 billion in back taxes", year: 2016, url: ""),
                                Event(event: "Apple's market capitalization is $800 billion", year: 2017, url: ""),
                                ]

// randomizes events and doesnt repeat
func randomizedEvents() -> [Event] {
    var roundEvents = [Event]()
    var eventIndex = Array(0...(arrayOfEvents.count - 1))
    var eventRoundIndex = [Int]()
    
    for _ in 1...4 {
        let randomNum = GKRandomSource.sharedRandom().nextInt(upperBound: eventIndex.count)
        eventRoundIndex.append(eventIndex[randomNum])
        eventIndex.remove(at: randomNum)
    }
    
    var i = 0
    while i < eventRoundIndex.count {
        roundEvents.append(arrayOfEvents[eventRoundIndex[i]])
        i += 1
    }
    
    return roundEvents
}

// self explanatory stuff.
var eventsPerRound = 4 // events per round
var eventsUsed = 0 // event used
var roundsPerGame = 6 // rounds per game
var correctRounds = 0 // correct rounds
var roundsCompleted = 0 // rounds completed
var indexOfSelectedEvents: Int = 0 // index that I never used because of trial and error stuff
var seconds = 60 // seconds of timer









