//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Gino Contestabile on 22/09/22.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    
    
    static let theme = MemoryGame<String>.Theme(name: "Smileys",
                                                     contents: ["🎾", "🏀", "⚽️", "🥎", "🏈","🏐", "⚾️", "🏉", "🎱", "🥏", "🪀"],
                                                     numberOfPairOfCards: 3,
                                                     cardColor: MemoryGame.Theme.CardColor.GREEN
    )
    
    var themeName: String {
        return EmojiMemoryGame.theme.name
    }
    var cardColor: Color {
        switch EmojiMemoryGame.theme.cardColor {
        case MemoryGame<String>.Theme.CardColor.GREEN:
            return Color.green
        case MemoryGame<String>.Theme.CardColor.ORANGE:
            return Color.orange
        case MemoryGame<String>.Theme.CardColor.RED:
            return Color.red
        }
    }
    
    static func createMemoryGame() -> MemoryGame<String> {
        return MemoryGame(numberOfPairsOfCards: theme.numberOfPairOfCards, createCardContent: { pairIndex in
            theme.contents[pairIndex]
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
