//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Wilson Junior on 10/07/21.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    static let emojis = ["🛩", "🚁", "⛴", "🏎", "🚛", "🚎", "🚔", "🎸", "🚀", "🚂", "⛵️", "🚟", "🚠", "🚞", "🚜", "🎺", "🎷", "🎧", "🎰", "🏆"]
        
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 8) {
            pairIndex in EmojiMemoryGame.emojis[pairIndex]
       }
    }
    
    @Published private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    // MARK: - Intent(s)
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
//        objectWillChange.send()
    }
}
