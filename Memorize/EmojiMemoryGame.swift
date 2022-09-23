//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Gino Contestabile on 22/09/22.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    static let emojis = ["🎾", "🏀", "⚽️", "🥎", "🏈","🏐", "⚾️", "🏉", "🎱", "🥏", "🪀"]
    
    static func createMemoryGame() -> MemoryGame<String> {
        return MemoryGame(numberOfPairsOfCards: 4, createCardContent: { pairIndex in
            emojis[pairIndex]
        })
    }
                          
    @Published private var model: MemoryGame<String> = createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    func choose(_ card:MemoryGame<String>.Card) {
        model.choose(card)
    }

}
