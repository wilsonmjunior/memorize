//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Wilson Junior on 27/04/21.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var game: EmojiMemoryGame
   
    var body: some View {
        ZStack {
            VStack {
                ScrollView {
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 60))]) {
                        ForEach(game.cards) { card in
                            CardView(card: card)
                                .aspectRatio(2/3, contentMode: .fit)
                                .onTapGesture {
                                    game.choose(card)
                                }
                        }
                    }
                }
            }
            .padding()
        }
        .background(Color.blue)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        
        EmojiMemoryGameView(game: game)
            .preferredColorScheme(.dark)
        EmojiMemoryGameView(game: game)
            .preferredColorScheme(.light)
    }
}

//var isFaceUp: Bool {
//    willSet {
//        if newValue {
//            startUsingBonusTime()
//        } else {
//            stopUsingBonusTime()
//        }
//    }
//}

// LazyHStack
// LazyVStack
// ScrollView
// LazyHGrid
// LazyVGrid
// List and Form and OutlineGroups
// Text("Hello")
//    .background(Rectangle().foregroundColor(.red))
//    .padding()
// Circle().overlay(Text("Hello"), alignment: .center)

// GeometryReader - The geometry parameter is a GeometryProxy
// struct GeometryProxy {
//    size: CGSize
//    func frame(in: CoordinateSpace) -> CGFloat
//    var safeAreaInsets: EdgeInsets
// }

// ZStack { ... }.edgesIgnoringSafeArea([.top])


//@ViewBuilder
//func front(of card: Card) -> some View {
//    let shape = RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
//    
//    shape
//    shape.stroke()
//    Text(card.content)
//}
