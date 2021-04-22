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
        VStack {
        Grid(viewModel.cards) { card in
                CardView(card: card).onTapGesture {
                    self.viewModel.choose(card: card)
                }
                .padding(5)
            }
            .padding()
        .foregroundColor(.orange)
            Button(action: {
                withAnimation(.easeOut){
                self.viewModel.resetGame()
                }
            }, label: {
                Text("New Game")
            })
        }
    }
}

struct CardView: View {
    var card: MemoryGame<String>.Card
    var body: some View {
        GeometryReader { geometry in
            self.body(for: geometry.size)
      }
    }
    
   @ViewBuilder
   private func body(for size: CGSize) -> some View {
    if card.isFaceUp || !card.isMatched {
         ZStack {
            Pie(startAngle: Angle.degrees(0-90), endAngle: Angle.degrees(110-90), clockwise: true)
                .padding(5).opacity(0.4)
            Text(self.card.content)
                .font(Font.system(size: fontSize(for: size)))
                .rotationEffect(Angle.degrees(card.isMatched ? 360 : 0))
                .animation(card.isMatched ? Animation.linear(duration: 1).repeatForever(autoreverses: false): .default)
        }
        .cardify(isFaceUp: card.isFaceUp)
        }
        
    }
   
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
