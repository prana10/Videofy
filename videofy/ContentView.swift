//
//  ContentView.swift
//  videofy
//
//  Created by Prana dhika on 23/08/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
                .padding(.bottom, 16)
                .padding(.top, 16)
            Text("Videofy")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
