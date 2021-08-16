//
//  MemoryGame.swift
//  Memorize
//
//  Created by Wilson Junior on 10/07/21.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable{
    private(set) var cards: Array<Card>
    
    private var indexOfTheOneAndOnlyFaceUpCard: Int? {
        get { cards.indices.filter({ cards[$0].isFaceUp }).oneAddOnly }
        set {
            // for index in cards.indices {
            // cards[index].isFaceUp = (index == newValue)
            // }
            cards.indices.forEach {
                cards[$0].isFaceUp = ($0 == newValue)
            }
        }
    }
    
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
        cards = []
        // add numberOfPairsOfCards x 2 cards to cards arrays
        for pairIndex in 0..<numberOfPairsOfCards {
            let content: CardContent = createCardContent(pairIndex)
            
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2+1))
        }
    }
    
    mutating func choose(_ card: Card) {
        if let chooseIndex = cards.firstIndex(where: { $0.id == card.id } ),
           !cards[chooseIndex].isFaceUp,
           !cards[chooseIndex].isMatched
        {
            if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
                if cards[chooseIndex].content == cards[potentialMatchIndex].content {
                    cards[chooseIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                }
                cards[chooseIndex].isFaceUp = true
            } else {
                indexOfTheOneAndOnlyFaceUpCard = chooseIndex
            }
        } else { return }
    }
    
//    func index(of card: Card) -> Int? {
//        for index in 0..<cards.count {
//            if cards[index].id == card.id {
//                return index
//            }
//        }
//
//        return nil
//    }
    
    struct Card: Identifiable {
        var isFaceUp = true
        var isMatched = false
        let content: CardContent
    
        let id: Int
    }
}

extension Array {
    var oneAddOnly: Element? {
        if self.count == 1 {
            return first
        } else {
            return nil
        }
    }
}
