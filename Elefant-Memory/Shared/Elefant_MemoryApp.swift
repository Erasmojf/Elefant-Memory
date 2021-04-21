//
//  Elefant_MemoryApp.swift
//  Shared
//
//  Created by Erasmo J.F Da Silva on 21/04/21.
//

import SwiftUI

@main
struct Elefant_MemoryApp: App {
    let game = EmojiMemoryGame()
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
