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

// Object holding stored properties for event, year, url
struct Event {
    let event: String
    let year: Int
    let url: String
}
// array of instaances, the data
var arrayOfEvents: [Event] = [Event(event: "Steve Wozniak was born", year: 1950, url: "https://en.wikipedia.org/wiki/Steve_Wozniak"),
                                Event(event: "Steve Jobs was born", year: 1955, url: "https://en.wikipedia.org/wiki/Steve_Jobs#Birth"),
                                Event(event: "Steve Jobs meets with Steve Wozniak for the first time", year: 1971, url: "https://en.wikipedia.org/wiki/Steve_Wozniak#Origins_of_Apple"),
                                Event(event: "Jobs drops out of Reed College", year: 1972, url: "https://en.wikipedia.org/wiki/Steve_Jobs"),
                                Event(event: "Jobs works for Atari", year: 1974, url: "https://en.wikipedia.org/wiki/Steve_Jobs"),
                                Event(event: "Apple Founded by Steve Jobs & Wozniak, Ronald Wayne.", year: 1976, url: "https://en.wikipedia.org/wiki/Apple_Inc.#History"),
                                Event(event: "Apple 2 released.", year: 1977, url: "https://en.wikipedia.org/wiki/Apple_II"),
                                Event(event: "Apple conducts an initial public offering of 4.6 million shares at $22 per share", year: 1980, url: "https://en.wikipedia.org/wiki/History_of_Apple_Inc."),
                                Event(event: "Apple introduces Lisa.", year: 1983, url: "https://en.wikipedia.org/wiki/Apple_Lisa"),
                                Event(event: "Macintosh introduced.", year: 1984, url: "https://en.wikipedia.org/wiki/Macintosh"),
                                Event(event: "Apple discontinues the Lisa after a disappointing run, and Steve Jobs leaves the company.", year: 1985, url: "https://en.wikipedia.org/wiki/Steve_Jobs"),
                                Event(event: "Apple buys Steve Jobs' company, NeXT Software.", year: 1996, url: "https://en.wikipedia.org/wiki/NeXT"),
                                Event(event: "In the wake of corporate shakeups and a sales slump, Apple welcomes Jobs back as interim CEO.", year: 1997, url: "https://simple.wikipedia.org/wiki/Steve_Jobs"),
                                Event(event: "The iMac, a streamlined personal computer, debuts", year: 1998, url: "https://en.wikipedia.org/wiki/IMac"),
                                Event(event: "Jobs becomes permanent CEO.", year: 2000, url: "https://simple.wikipedia.org/wiki/Steve_Jobs"),
                                Event(event: "The iPod MP3 player makes its debut.", year: 2001, url: "https://en.wikipedia.org/wiki/Steve_Jobs#iPod"),
                                Event(event: "Apple releases the Safari web browser.", year: 2003, url: "https://en.wikipedia.org/wiki/Safari_version_history"),
                                Event(event: "Apple rolls out its first Intel-based computers, the iMac and the MacBook Pro.", year: 2006, url: "https://en.wikipedia.org/wiki/Apple%27s_transition_to_Intel_processors"),
                                Event(event: "The iPhone is unveiled.", year: 2007, url: "https://en.wikipedia.org/wiki/IPhone"),
                                Event(event: "The iPad is announced.", year: 2010, url: "https://en.wikipedia.org/wiki/IPad"),
                                Event(event: "Steve Jobs dies", year: 2011, url: "https://www.cultofmac.com/447947/today-apple-history-steve-jobs-passes-away/"),
                                Event(event: "Apple Unveils the Apple Watch", year: 2014, url: "https://en.wikipedia.org/wiki/Apple_Watch"),
                                Event(event: "Apple unveils Apple Music", year: 2015, url: "https://en.wikipedia.org/wiki/Apple_Music"),
                                Event(event: "The European Union rules that Apple must pay Ireland $14.5 billion in back taxes", year: 2016, url: "https://en.wikipedia.org/wiki/Apple_Inc._litigation"),
                                Event(event: "Apple's market capitalization is $800 billion", year: 2017, url: "https://en.wikipedia.org/wiki/Apple_Inc."),
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
    print(roundEvents)
    return roundEvents
    
}

func appleEventProvider() -> Event {
    let randomNumber = GKRandomSource.sharedRandom().nextInt(upperBound: arrayOfEvents.count)
    let randomEvent = arrayOfEvents[randomNumber]
    return randomEvent
}

func newSet() -> (Event, Event, Event, Event) {
    var appleEvent1 = appleEventProvider()
    var appleEvent2 = appleEventProvider()
    var appleEvent3 = appleEventProvider()
    var appleEvent4 = appleEventProvider()
    
    while appleEvent2.event == appleEvent1.event {
        appleEvent2 = appleEventProvider()
    }
    
    while appleEvent3.event == appleEvent1.event || appleEvent3.event == appleEvent2.event {
        appleEvent3 = appleEventProvider()
    }
    
    while appleEvent4.event == appleEvent1.event || appleEvent4.event == appleEvent2.event || appleEvent4.event == appleEvent3.event {
        appleEvent4 = appleEventProvider()
    }
    return (appleEvent1, appleEvent2, appleEvent3, appleEvent4)
}



// self explanatory stuff.
var eventsPerRound = 4 // events per round
var eventsUsed = 0 // event used
var roundsPerGame = 5 // rounds per game, It says 5, but actually in the app itself there are 6, it counts 0 as 1.
var correctRounds = 0 // correct rounds
var roundsCompleted = 0 // rounds completed
var seconds = 60 // seconds of timer









