//
//  Commands.swift
//  AccieoUtils
//
//  Created by Accieo on 26.08.23.
//

import Foundation

// Dark Mode
let shellToggleDark =
    "osascript -e 'tell app \"System Events\" to tell appearance preferences to set dark mode to true'"
let shellToggleLight =
    "osascript -e 'tell app \"System Events\" to tell appearance preferences to set dark mode to false'"

// Caffeinate
var shellCaffeinate = "caffeinate"
let shellCaffeinateKill = "killall -q caffeinate"

// QuickTime Player
let screenRecord =
    "osascript -e 'tell application \"QuickTime Player\" to start (new screen recording)'"

let shellOllama = "ollama serve &> /dev/null"
let shellKillOllama = "killall -q ollama"
