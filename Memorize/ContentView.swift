//
//  ContentView.swift
//  Memorize
//
//  Created by Gino Contestabile on 20/09/22.
//

import SwiftUI



struct ContentView: View {
    //assignment add three themes for the emojis
    
    @ObservedObject var viewModel: EmojiMemoryGame 

    var body: some View {
        VStack {
            //ASSIGNMENT 3 Add A title on top of the screen
            title
            Spacer()
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(viewModel.cards) { card in
                        CardView(card: card)
                        .foregroundColor(viewModel.cardColor)
                        .aspectRatio(2/3, contentMode: .fit)
                        .onTapGesture {
                            viewModel.choose(card)
                        }
                    }
                   
                }
            }

        }
        .padding(.horizontal)
    }
    
    var title: some View {
        Text(viewModel.themeName)
            .font(.title)
            .fontWeight(.bold)
            .foregroundColor(Color.red)
            .padding()
    }




    struct CardView: View {
        var card: MemoryGame<String>.Card

        var body: some View {
            ZStack {
                
                let shape = RoundedRectangle(cornerRadius: 25)
                if card.isFaceUp {
                    shape.fill(.white).foregroundColor(.white)
                    shape.strokeBorder(lineWidth: 4)
                
                    Text(card.content)
                }
         
                else {
                        shape.fill()
                }
            }
            .font(.largeTitle)
            
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        ContentView(viewModel: game)
            .preferredColorScheme(.dark)
            .previewInterfaceOrientation(.portrait)
        
        ContentView(viewModel: game)
            .preferredColorScheme(.light)
    }
}


