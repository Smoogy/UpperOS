//
//  Header.swift
//  Upper
//
//  Created by Callan Bush on 16/1/21.
//

import SwiftUI

struct Header: View {
    @State var text: String
    
    var body: some View {
        Text(text)
            .font(.largeTitle)
            .multilineTextAlignment(.leading)
            .padding(.all)
            
    }
}

struct Header_Previews: PreviewProvider {
    static var previews: some View {
        Header(text: "Hello, world!")
    }
}
