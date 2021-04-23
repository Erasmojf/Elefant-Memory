//
//  EmojiMemoryGame.swift
//  Elefant-Memory
//
//  Created by Erasmo J.F Da Silva on 21/04/21.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
   @Published private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    
  private static func createMemoryGame() -> MemoryGame<String> {
        let emojis = ["🐘","🦓","🦒","🐪","🐅","🐇", "🦏","🐎","🦧"]
    return MemoryGame<String>(numberOfPairsOfCards: emojis.count){ pairIndex in
        return emojis[pairIndex]
      }
    }
   

var cards: Array<MemoryGame<String>.Card>{
    model.cards
}

func choose(card: MemoryGame<String>.Card) {
    model.choose(card: card)
  }
    func resetGame(){
        model = EmojiMemoryGame.createMemoryGame()
    }
}

