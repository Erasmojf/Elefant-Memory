//
//  Cardify.swift
//  Elefant-Memory
//
//  Created by Erasmo J.F Da Silva on 21/04/21.
//

import SwiftUI

struct Cardify: ViewModifier {
    var isFaceUp: Bool
    func body(content: Content) -> some View {
        ZStack {   if isFaceUp {
            RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
            RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: edgeLineWidth)
            content
            
        }else{
                 RoundedRectangle(cornerRadius: 10.0).fill()
            }
        }
      }
    private let cornerRadius: CGFloat = 10.0
    private let edgeLineWidth: CGFloat = 3
}
