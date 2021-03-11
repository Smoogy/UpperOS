//
//  ContentView.swift
//  Upper
//
//  Created by Callan Bush on 16/1/21.
//

import SwiftUI

let defaultText = "Your text appears here!"

struct ContentView: View {
    @ObservedObject var rootState = RootState()
    @AppStorage("activityLog") var activityLog = defaultText;
    
    func onButtonPress() -> Void {
        if rootState.inputString.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            return
        }
        let newString = Receive.callXPC(rootState.inputString)
        rootState.inputString = newString ?? ""
        
        if activityLog.contains(defaultText) {
            activityLog = ""
        }
        
        activityLog.append(rootState.inputString)
        activityLog.append("\n")
        rootState.inputString = ""
    }
    
    var body: some View {
        HStack {
            VStack {
                Header(text: "UpperOS")
                HStack {
                    TextField("Enter text here", text: $rootState.inputString)
                        .frame(width: 100, height: 100, alignment: .center)
                    Button(action: onButtonPress) {
                        Text("Send")
                    }
                }
                ActivityLog(log: $activityLog)
            }
        }.frame(minWidth: 500, maxWidth: .infinity, minHeight: 400, maxHeight: .infinity)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
