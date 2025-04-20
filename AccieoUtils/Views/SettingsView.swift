//
//  SettingsView.swift
//  AccieoUtils
//
//  Created by Accieo on 2025.03.01.
//

import SwiftUI

struct SettingsView: View {
    @State private var shellBinaryPath: String =
        UserDefaults.standard.string(forKey: "shellBinaryPath") ?? "/bin/zsh"
    @State private var caffeinateArgs: String =
        UserDefaults.standard.string(forKey: "caffeinateArgs") ?? "-id"
    @State private var saveMessage: String?

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            // Shell settings
            Label {
                Text("Shell settings")
                    .font(.headline)
            } icon: {
                Image(systemName: "terminal")
                    .font(.headline)
            }
            .padding(.bottom, 5)

            TextField("Custom shell path", text: $shellBinaryPath)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.bottom, 5)

            Divider()

            // Caffeinate settings
            Label {
                Text("Caffeinate arguments")
                    .font(.headline)
            } icon: {
                Image(systemName: "cup.and.heat.waves")
                    .font(.headline)
            }
            .padding(.bottom, 5)

            TextField("Arguments", text: $caffeinateArgs)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.bottom, 5)

            Divider()

            // Save button
            HStack {
                Button("Save") {
                    UserDefaults.standard.set(
                        shellBinaryPath,
                        forKey: "shellBinaryPath"
                    )
                    UserDefaults.standard.set(
                        caffeinateArgs,
                        forKey: "caffeinateArgs"
                    )
                    saveMessage = "✔︎"
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        saveMessage = nil
                    }
                }

                if let saveMessage = saveMessage {
                    Text(saveMessage)
                        .foregroundStyle(.green)
                        .font(.headline)
                        .transition(.opacity)
                        .animation(
                            .easeInOut(duration: 0.5),
                            value: saveMessage
                        )
                }

                Spacer()
                Image("ollama_logo")
                    .resizable()
                    .frame(width: 13, height: 13)
                    .aspectRatio(1, contentMode: .fit)
                Text("by ollama.com")
            }.padding(.top, 10)

        }
        .frame(width: 400, height: 200)
        .padding()
        .onAppear {
            shellBinaryPath =
                UserDefaults.standard.string(forKey: "shellBinaryPath")
                ?? "/bin/zsh"
            caffeinateArgs =
                UserDefaults.standard.string(forKey: "caffeinateArgs") ?? "-id"
        }
    }
}

#Preview {
    SettingsView()
}
