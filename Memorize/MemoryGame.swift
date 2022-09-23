//
//  MemoryGame.swift
//  Memorize
//
//  Created by Gino Contestabile on 22/09/22.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    var cards: [Card]
    private var indexOfTheOneAndOnlyFaceUpCard: Int? = nil
    private var numberOfMatchedCards: Int = 0
    mutating func choose(_ card: Card) {
        
        // face down each card which is not matched or is not the index of the one and only
        print("Faceup index \(indexOfTheOneAndOnlyFaceUpCard)")
        print(card)
        if let chosenIndex = cards.firstIndex(where: { card.id == $0.id}),!cards[chosenIndex].isMatched {
            cards[chosenIndex].isFaceUp.toggle()
            
            print("chosenCard = \(cards[chosenIndex])")
            
            if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard, potentialMatchIndex != chosenIndex {
              
                if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                    numberOfMatchedCards += 2
                }
                indexOfTheOneAndOnlyFaceUpCard = nil
                for i in 0..<cards.count   {
                    if !cards[i].isMatched, i != potentialMatchIndex {
                        cards[i].isFaceUp = false
                    }
                }
            } else {
                indexOfTheOneAndOnlyFaceUpCard = chosenIndex
            }
            
        }
        
        if(cards.count == numberOfMatchedCards) {
            print("You won!!!")
        }
       
    }

    
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = createCardContent(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2+1))
        }
    }
    
    
    struct Card : Identifiable {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
        var id: Int
    }
    
    struct Theme {
        let name: String
        let contents: [CardContent]
        let numberOfPairOfCards: Int
        let cardColor: CardColor
        
        enum CardColor {
            case ORANGE
            case RED
            case GREEN
        }
        
        
    }

}


