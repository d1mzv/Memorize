//
//  ContentView.swift
//  Memorize
//
//  Created by Dmytro Mazniev on 20.02.2023.
//

import SwiftUI

struct ContentView: View {

    let emojis = [
        "travel": ["🌍", "🛫", "🛬", "🌆", "🌇", "🌉", "🚅", "🛣️", "🚗", "🛵", "🚀", "🛸", "🗺️", "🏞️", "🏰", "🏖️", "🏜️", "🛶", "🏕️", "🚤", "🚁", "🚂"],
        "food": ["🍔", "🍟", "🌮", "🌯", "🍕", "🍜", "🍱", "🥗", "🥞", "🧇", "🥪", "🍳", "🍣", "🍗", "🍩", "🍦", "🍤"],
        "activities": ["🏊‍♂️", "🚴‍♂️", "🧗‍♀️", "🤸‍♂️", "🎨", "🎭", "🎲", "🎳", "🎮", "🎬", "🎤", "🎧", "📚", "🎁", "🎉", "🚣‍♀️", "🏋️‍♀️", "🏇", "🎿", "🏓"]
    ]
    
    @State var emojiCount = 10
    @State var selectedEmojis = ["🛫", "✈️", "🛬", "🚀", "🛸", "🛶", "🛥️", "⛵", "🚤", "🚢"]
    
    var body: some View {
        VStack {
            Text("Memo App")
                .font(.largeTitle)
                .padding(.top)
            ScrollView {
                
//                GeometryReader { (geometry) in
//                                self.makeView(geometry)
                
                LazyVGrid (columns: [GridItem(.adaptive(minimum: widthThatBestFits(cardCount: emojiCount)))]) {
                    ForEach(selectedEmojis[0..<emojiCount], id: \.self) {emoji in
                        CardView(content: emoji).aspectRatio(2/3, contentMode: .fit).frame(maxHeight:.infinity)
                    }
                }
                .foregroundColor(.red)
            }
            .background(
                GeometryReader { proxy in
                    Color.clear.onAppear {
                        print(proxy.size.height, proxy.size.width)
                        let mainViewHeight = proxy.size.height
                        let mainViewWidth = proxy.size.width
                    }
                }
            )
            // 60-5, 70-4, 90-3, 120-2
            // 609.0485026041667
            // 215.04850260416663 718.0
            Spacer()
            HStack {
                Spacer()
                loadTravelEmojis
                Spacer()
                loadFoodEmojis
                Spacer()
                loadAcrivityEmojis
                Spacer()
            }
            .font(.largeTitle)
            .padding(.horizontal)
        }
        .padding(.horizontal)
    }

    
    var loadTravelEmojis: some View {
        return Button {
            selectedEmojis = emojis["travel"]!.shuffled()
            emojiCount = selectedEmojis.count
            let randomCount = Int.random(in: 4..<emojiCount)
            emojiCount = randomCount
        } label: {
            VStack {
                Image(systemName: "car")
                Text("Travel")
                    .font(.body)
            }
        }
    }
    var loadFoodEmojis: some View {
        return Button {
            selectedEmojis = emojis["food"]!.shuffled()
            emojiCount = selectedEmojis.count
            let randomCount = Int.random(in: 4..<emojiCount)
            emojiCount = randomCount
        } label: {
            VStack {
                Image(systemName: "carrot")
                Text("Food")
                    .font(.body)
            }
        }
    }
    var loadAcrivityEmojis: some View {
        return Button {
            selectedEmojis = emojis["activities"]!.shuffled()
            emojiCount = selectedEmojis.count
            let randomCount = Int.random(in: 4..<emojiCount)
            emojiCount = randomCount
        } label: {
            VStack {
                Image(systemName: "baseball")
                Text("Activities")
                    .font(.body)
            }
        }
    }
    
    func widthThatBestFits(cardCount: Int) -> CGFloat {
        let col = sqrt(Double(cardCount)).rounded(.up)
        switch col {
        case 2:
            return 120
        case 3:
            return 90
        case 4:
            return 70
        case 5:
            return 60
        default:
            return 60
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
