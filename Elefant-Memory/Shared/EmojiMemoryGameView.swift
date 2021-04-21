//
//  ContentView.swift
//  Shared
//
//  Created by Erasmo J.F Da Silva on 21/04/21.
//

import SwiftUI

struct EmojiMemoryGameView: View {
  @ObservedObject  var viewModel: EmojiMemoryGame
    
    var body: some View {
        Grid(viewModel.cards) { card in
                CardView(card: card).onTapGesture {
                    self.viewModel.choose(card: card)
                }
                .padding(5)
            }
            .padding()
            .foregroundColor(.orange)
    }
}

struct CardView: View {
    var card: MemoryGame<String>.Card
    var body: some View {
        GeometryReader { geometry in
            self.body(for: geometry.size)
      }
    }
   private func body(for size: CGSize) -> some View {
        ZStack {
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
                RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: edgeLineWidth)
                Pie(
                    startAngle: Angle.degrees(0-90), endAngle: Angle.degrees(110-90), clockwise: true)
                    .padding(5).opacity(0.4)
                Text(self.card.content)
            }else{
                if !card.isMatched {
                     RoundedRectangle(cornerRadius: 10.0).fill()
                    
                }
            }
        }
        .font(Font.system(size: fontSize(for: size)))
    }
 
    
   private let cornerRadius: CGFloat = 10.0
   private let edgeLineWidth: CGFloat = 3
   private func fontSize(for size: CGSize) -> CGFloat {
        min(size.width, size.height) * 0.7
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        game.choose(card: game.cards[0])
       return EmojiMemoryGameView(viewModel: game)
    }
}
