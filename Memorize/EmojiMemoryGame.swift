//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Dmytro Mazniev on 25.02.2023.
//

import SwiftUI



class EmojiMemoryGame: ObservableObject {
    
    static let emojis = ["🏊‍♂️", "🚴‍♂️", "🧗‍♀️", "🤸‍♂️", "🎨", "🎭", "🎲", "🎳", "🎮", "🎬", "🎤", "🎧", "📚", "🎁", "🎉", "🚣‍♀️", "🏋️‍♀️", "🏇", "🎿", "🏓"]
    
    static func createMemoryGame() -> MemoryGame<String> {
        let randomNumberOfCards = Int.random(in: 4...12)
        return MemoryGame<String>(numberOfPairsOfCards: randomNumberOfCards) { pairIndex in
            emojis[pairIndex]
        }
    }
    
    @Published private var model: MemoryGame<String> = createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    // MARK: - Intent(s)
    
    func chooseCard (_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
}
