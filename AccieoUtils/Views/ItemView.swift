//
//  ItemView.swift
//  AccieoUtils
//
//  Created by Accieo on 29.10.23.
//

import SwiftUI

struct ItemView: View {
    
    var label: String
    var icon: String
    var action: String
    
    init(_ label: String, _ icon: String, _ action: String) {
        self.label = label
        self.icon = icon
        self.action = action
    }
    
    var body: some View {
        HStack {
            Image(systemName: icon).frame(width: 25)
            Text(label).frame(width: 100, alignment: .leading)
            Button(action: {
                runShell(action)
            }) {
                Text("Run")
            }
        }.padding(.top, 2)
    }
    
}
