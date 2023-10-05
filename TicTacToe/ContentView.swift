//
//  ContentView.swift
//  TicTacToe
//
//  Created by Kate Stafford on 10/4/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var board_state = Game() // holds game state
    var body: some View {
        Text("Tic-Tac-Toe") // Title of game
                        .font(.largeTitle)
                        .padding(.top, -80)
                        .padding(.bottom, 50)
        let border_size = CGFloat(5)
        VStack(spacing: border_size){ // Creating TicTacToe Grid
            
            ForEach(0...2, id: \.self){ // Rows (3)
                row in
                HStack(spacing: border_size){
                    ForEach(0...2, id: \.self){ // Columns (3)
                        column in
                        let space = board_state.current_board[row][column]
                        Text(space.displayTile())
                            .font(.system(size: 50)) //Font size of Xs and Os
                            .bold()
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .aspectRatio(1, contentMode: .fit)
                            .background(Color.white) // For color in background of the grid
                            .onTapGesture { // For interaction with the grid
                                board_state.putMark(row, column)
                            }
                    }
                        
                    
                      
                }
            }
        }
        .background(Color.gray) // For the color of the grid
        .padding() // Adds padding around the grid
    }
}

#Preview {
    ContentView()
}
