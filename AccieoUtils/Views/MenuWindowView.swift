//
//  MenuWindowView.swift
//  AccieoUtils
//
//  Created by Accieo on 26.08.23.
//

import SwiftUI

struct MenuWindowView: View {
    @State private var settingsWindow: NSWindow?

    @State var toggleDarkMode = false
    @State var toggleCaffeinate = false
    @State var toggleFnKeys = false
    @State var toggleOllama = false

    var body: some View {
        VStack(alignment: .leading) {
            VStack {
                ToggleView(
                    "Dark Mode",
                    .builtIn("circle.righthalf.fill"),
                    .builtIn("circle.lefthalf.fill"),
                    toggleDarkMode,
                    shellToggleDark,
                    shellToggleLight
                )

                ToggleView(
                    "Caffeinate",
                    .builtIn("cup.and.saucer.fill"),
                    .builtIn("cup.and.saucer"),
                    toggleCaffeinate,
                    shellCaffeinate,
                    shellCaffeinateKill
                )

                ToggleView(
                    "ollama",
                    .asset("ollama_logo"),
                    .asset("ollama_logo"),
                    toggleOllama,
                    shellOllama,
                    shellKillOllama,
                )

                ItemView("Record Screen", "record.circle", screenRecord)

                Divider()
                HStack {
                    Button("Settings") {
                        openSettingsWindow()
                    }
                    .padding(.top, 5)

                    Button("Quit") {
                        NSApplication.shared.terminate(nil)
                    }
                    .padding(.top, 5)
                }
            }
        }
        .frame(width: 200)
        .padding()
    }

    func openSettingsWindow() {
        if settingsWindow == nil {
            let settingsView = NSHostingController(rootView: SettingsView())
            settingsWindow = NSWindow(contentViewController: settingsView)
            settingsWindow?.setContentSize(NSSize(width: 400, height: 300))
            settingsWindow?.title = "Settings"
            settingsWindow?.makeKeyAndOrderFront(nil)
        } else {
            settingsWindow?.makeKeyAndOrderFront(nil)
        }
    }
}

struct MenuWindowView_Previews: PreviewProvider {
    static var previews: some View {
        MenuWindowView()
    }
}
