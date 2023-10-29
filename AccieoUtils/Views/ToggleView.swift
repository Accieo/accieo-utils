//
//  ToggleView.swift
//  AccieoUtils
//
//  Created by Accieo on 27.08.23.
//

import SwiftUI

struct ToggleView: View {
    
    @State var triggerVar: Bool
    var label: String
    var trueAction: String
    var falseAction: String?
    var trueIcon: String
    var falseIcon: String
    
    init(_ label: String, _ trueIcon: String, _ falseIcon: String, _ triggerVar: Bool, _ trueAction: String, _ falseAction: String? = nil) {
        self.label = label
        self.triggerVar = triggerVar
        self.trueAction = trueAction
        self.falseAction = falseAction
        self.trueIcon = trueIcon
        self.falseIcon = falseIcon
    }
    
    var body: some View {
        Toggle(isOn: $triggerVar) {
                HStack {
                    Image(systemName: triggerVar ? trueIcon : falseIcon)
                        .frame(width: 25)
                    Text(label)
                        .frame(width: 100, alignment: .leading)
                }
            }
            .onChange(of: triggerVar) { value in
                if value {
                    runShell(trueAction)
                } else {
                    if falseAction != nil {
                        runShell(falseAction!)
                    }
                }
            }
            .toggleStyle(.switch)
    }
}
