//
//  AccieoUtilsApp.swift
//  AccieoUtils
//
//  Created by Accieo on 26.08.23.
//

import SwiftUI

@main
struct AccieoUtilsApp: App {
    var body: some Scene {
        MenuBarExtra("Accieo Utils", systemImage: "terminal") {
            MenuWindowView()
        }.menuBarExtraStyle(.window)
    }
}
