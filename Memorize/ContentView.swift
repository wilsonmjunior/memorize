//
//  ContentView.swift
//  Memorize
//
//  Created by Wilson Junior on 27/04/21.
//

import SwiftUI

struct ContentView: View {
    @State var emojiCount: Int = 4
    var emojis = ["🛩", "🚁", "⛴", "🏎", "🚛", "🚎", "🚔", "🎸", "🚀", "🚂", "⛵️", "🚟", "🚠", "🚞", "🚜", "🎺", "🎷", "🎧", "🎰", "🏆"]
   
    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 75))]) {
                    ForEach(emojis[0..<emojiCount], id: \.self) { emoji in
                        CardView(content: emoji)
                            .aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            .foregroundColor(.red)
            Spacer()
            HStack {
                remove
                Spacer()
                add
            }
            .padding(.horizontal)
            .font(.largeTitle)
        }
        .padding()
    }
    
    var remove: some View {
        Button {
            if emojiCount > 0 {
                emojiCount -= 1
            }
        } label: {
            Image(systemName: "minus.circle")
        }
    }
    
    var add: some View {
        Button(action: {
            if emojiCount < emojis.count {
                emojiCount += 1
            }
        }, label: {
            Image(systemName: "plus.circle")
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
        ContentView()
            .preferredColorScheme(.light)
    }
}
