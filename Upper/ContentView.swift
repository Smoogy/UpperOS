//
//  ContentView.swift
//  Upper
//
//  Created by Callan Bush on 16/1/21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var rootState = RootState()
    
    func onButtonPress() -> Void {
        let newString = Receive.callXPC(rootState.inputString)
        rootState.inputString = newString ?? ""
        return
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
            }
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
