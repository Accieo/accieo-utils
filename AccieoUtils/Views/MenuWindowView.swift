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
    
    var body: some View {
        VStack(alignment: .leading) {
            VStack {
                ToggleView("Dark Mode", "circle.righthalf.fill", "circle.lefthalf.fill", toggleDarkMode, shellToggleDark, shellToggleLight)

                ToggleView("Caffeinate", "cup.and.saucer.fill", "cup.and.saucer", toggleCaffeinate, shellCaffeinate, shellCaffeinateKill)
                
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
