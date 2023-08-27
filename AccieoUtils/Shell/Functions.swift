//
//  Functions.swift
//  AccieoUtils
//
//  Created by Accieo on 26.08.23.
//

import Foundation

func runShell(_ command: String) -> Void {
    let task = Process()
    let pipe = Pipe()
    task.standardOutput = pipe
    task.arguments = ["-c", command]
    task.executableURL = URL(fileURLWithPath: "/bin/zsh")
    do {
        try task.run()
    } catch {
        print("\(error)")
    }
}
