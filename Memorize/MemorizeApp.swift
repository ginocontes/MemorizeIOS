//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Gino Contestabile on 20/09/22.
//

import SwiftUI

@main
struct MemorizeApp: App {
    var body: some Scene {
        WindowGroup {
            let game = EmojiMemoryGame()
            ContentView(viewModel: game)
        }
    }
}
