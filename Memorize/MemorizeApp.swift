//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Wilson Junior on 27/04/21.
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
