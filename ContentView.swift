//
//  ContentView.swift
//  DoOrDont
//
//  Created by Will O'Keefe on 4/17/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.black
            ZStack {
                Color.brown
                VStack {
                    HStack(spacing: 10) { // heading text
                        Text("Do Or Don't").padding().foregroundColor(Color.white.opacity(0.9)).font(Font.custom("cour", size: 40)).background(Color.white.opacity(0.3)).clipShape(RoundedRectangle(cornerRadius: 30)).multilineTextAlignment(.center).frame(width: 300)
                    }
                    NavigationStack { /* nav stack, this is the box in the screen that can then shift to the main screen */
                        HStack {
                            NavigationLink("Click to Continue") {
                               MainView()
                                    .toolbarRole(.editor)
                            }.background(Color.black.opacity(0))
                        }.background(Color.black.opacity(0))
                    }.frame(width: 360, height: 570).foregroundStyle(Color.brown.opacity(1)).padding(20).font(Font.custom("cour", size: 25)).background(RoundedRectangle(cornerRadius: 25).fill(Color.brown.opacity(0.9)).shadow(color: Color.black, radius: 2, x:0, y:2))
                }
            }.ignoresSafeArea()
        }
    }
}

#Preview {
    ContentView()
}
