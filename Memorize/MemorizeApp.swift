//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Dmytro Mazniev on 20.02.2023.
//

import SwiftUI

@main
struct MemorizeApp: App {
    let game = EmojiMemoryGame()
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
