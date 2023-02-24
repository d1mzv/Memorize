//
//  ContentView.swift
//  Memorize
//
//  Created by Dmytro Mazniev on 20.02.2023.
//

import SwiftUI

struct ContentView: View {
    var emojisTravel = ["🛫", "✈️", "🛬", "🚀", "🛸", "🛶", "🛥️", "⛵", "🚤", "🚢"]
    
    @State var emojiCount = 10
    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid (columns: [GridItem(.adaptive(minimum: 80))]) {
                    ForEach(emojisTravel[0..<emojiCount], id: \.self) {emoji in
                        CardView(content: emoji).aspectRatio(2/3, contentMode: .fit).frame(maxHeight:.infinity)
                    }
                }
                .foregroundColor(.red)
            }
            Spacer()
            HStack {
                remove
                Spacer()
                add
            }
            .font(.largeTitle)
            .padding(.horizontal)
        }
        .padding(.horizontal)
    }
    var add: some View {
        Button {
            emojiCount = min(emojiCount + 1, emojisTravel.count)
        } label: {
            Image(systemName: "plus.circle")
        }
    }
    var remove: some View {
        Button {
            emojiCount = max(emojiCount - 1, 1)
        } label: {
            Image(systemName: "minus.circle")
        }
    }
    
}

struct CardView: View {
    var content: String
    @State var isFaceUp: Bool = true

    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius:20)
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(content).font(.largeTitle)
            } else {
                shape.fill()
            }
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}

//        VStack {
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundColor(.accentColor)
//            Text("Hello, world!")
//        }
//        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
        ContentView()
            .preferredColorScheme(.light)
    }
}
