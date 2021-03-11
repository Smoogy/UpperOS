//
//  ActivityLog.swift
//  Upper
//
//  Created by Callan Bush on 17/2/21.
//

import SwiftUI

struct ActivityLog: View {
    @Binding var log: String
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                Text(log)
                    .padding()
                    .fixedSize(horizontal: false, vertical: true)
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            }
        }.frame(minWidth: 0, minHeight: 0)
        .background(Color.black)
    }
}

struct ActivityLog_Previews: PreviewProvider {
    static var previews: some View {
        ActivityLog(log: .constant("Hello world\nHello world\nHello world\nHello world\nHello world\nHello world\nHello world\nHello world\nHello world\nHello world\nHello world\nHello world\nHello world\nHello world\nHello world\nHello world\nHello world\nHello world\nHello world\nHello world\nHello world\nHello world\nHello world\nHello world\nHello world\nHello world\nHello world\nHello world\nHello world\nHello world\nHello world\nHello world\nHello world\nHello world\nHello world\nHello world\nHello world\nHello world\nHello world\nHello world\nHello world\nHello world\nHello world\nHello world\nHello world\nHello world\nHello world\nHello world\nHello world\nHello world\n"))
    }
}
