//
//  Functions.swift
//  AccieoUtils
//
//  Created by Accieo on 26.08.23.
//

import Foundation

func runShell(_ command: String) -> Void {
    var commandToRun = command
    
    let task = Process()
    let pipe = Pipe()
    task.standardOutput = pipe
    
    let shellBinaryPath = UserDefaults.standard.string(forKey: "shellBinaryPath") ?? "/bin/zsh"
    
    if (command == shellCaffeinate) {
        let caffeinateArgs = UserDefaults.standard.string(forKey: "caffeinateArgs") ?? "-id"
        commandToRun = "\(command) \(caffeinateArgs)"
    }
    
    task.arguments = ["-c", commandToRun]
    task.executableURL = URL(fileURLWithPath: shellBinaryPath)
    
    do {
        try task.run()
    } catch {
        print("Error running shell command: \(error)")
    }
}
