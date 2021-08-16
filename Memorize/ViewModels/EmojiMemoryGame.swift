//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Wilson Junior on 10/07/21.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    typealias Card = MemoryGame<String>.Card
    
    private static let emojis = ["🛩", "🚁", "⛴", "🏎", "🚛", "🚎", "🚔", "🎸", "🚀", "🚂", "⛵️", "🚟", "🚠", "🚞", "🚜", "🎺", "🎷", "🎧", "🎰", "🏆"]
        
    private static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 3) {
            pairIndex in EmojiMemoryGame.emojis[pairIndex]
       }
    }
    
    @Published private var model = EmojiMemoryGame.createMemoryGame()
    
    var cards: Array<Card> {
        model.cards
    }
    
    // MARK: - Intent(s)
    
    func choose(_ card: Card) {
        model.choose(card)
//        objectWillChange.send()
    }
}
