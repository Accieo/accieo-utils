//
//  ToggleView.swift
//  AccieoUtils
//
//  Created by Accieo on 27.08.23.
//

import SwiftUI

enum IconSource {
    case builtIn(String)
    case asset(String)

    var image: Image {
        switch self {
        case .builtIn(let name):
            return Image(systemName: name)
        case .asset(let name):
            return Image(name)
        }
    }
}

struct ToggleView: View {

    @State var triggerVar: Bool
    var label: String
    var trueAction: String
    var falseAction: String?
    var trueIcon: IconSource
    var falseIcon: IconSource

    init(
        _ label: String,
        _ trueIcon: IconSource,
        _ falseIcon: IconSource,
        _ triggerVar: Bool,
        _ trueAction: String,
        _ falseAction: String? = nil
    ) {
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
                (triggerVar ? trueIcon : falseIcon).image
                    .resizable()
                    .frame(width: 17, height: 17)
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
