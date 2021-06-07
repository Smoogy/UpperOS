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
    @State var receive: Receive?
    
    func onSendPress() -> Void {
        if rootState.inputString.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            return
        }
        if (receive == nil) {
            return
        }
        let newString = receive!.callXPC(rootState.inputString)
        rootState.inputString = newString ?? ""
        
        if activityLog.contains(defaultText) {
            activityLog = ""
        }
        
        activityLog.append(rootState.inputString)
        activityLog.append("\n")
        rootState.inputString = ""
    }
    
    func onDeletePress() -> Void {
        activityLog = ""
    }
    
    var body: some View {
        HStack {
            VStack {
                Header(text: "UpperOS")
                HStack {
                    TextField("Enter text here", text: $rootState.inputString)
                        .frame(width: 100, height: 100, alignment: .center)
                    Button(action: onSendPress) {
                        Text("Send")
                    }
                }
                HStack {
                    Spacer()
                    Button(action: onDeletePress) {
                        Image(systemName: "trash")
                    }.padding(.trailing)
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
