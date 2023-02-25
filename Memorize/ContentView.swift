//
//  ContentView.swift
//  Memorize
//
//  Created by Dmytro Mazniev on 20.02.2023.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        VStack {
            Text("Memo App")
                .font(.largeTitle)
                .padding(.top)
            ScrollView {
                LazyVGrid (columns: [GridItem(.adaptive(minimum: widthThatBestFits(cardCount: viewModel.cards.count)))]) {
                    ForEach(viewModel.cards) {card in
                        CardView(card: card)
                            .aspectRatio(2/3, contentMode: .fit)
                            .frame(maxHeight:.infinity)
                            .onTapGesture {
                                viewModel.chooseCard(card)
                            }
                    }
                }
                .foregroundColor(.red)
            }
            Spacer()
            HStack {
                Spacer()
//                newGame.onTapGesture {
//                    EmojiMemoryGame.createMemoryGame()
//                }
                Spacer()
            }
            .font(.largeTitle)
            .padding(.horizontal)
        }
        .padding(.horizontal)
    }

    
    var newGame: some View {
        return Button {
        } label: {
            VStack {
                Image(systemName: "goforward")
                Text("Restart")
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
//    var content: String
    let card: MemoryGame<String>.Card

    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius:20)
            if card.isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(card.content).font(.largeTitle)
            } else if card.isMatched {
                shape.opacity(0)
            } else {
                shape.fill()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        ContentView(viewModel: game)
            .preferredColorScheme(.dark)
        ContentView(viewModel: game)
            .preferredColorScheme(.light)
    }
}
