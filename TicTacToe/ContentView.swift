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
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        
            VStack{  // Creating TicTacToe Grid
                let border_size = CGFloat(5)
                Text("Tic-Tac-Toe") // Title of game
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(Color.purple)
                    .shadow(color: .purple,radius: 10)
                    .padding()
                Spacer()
                
                Text(board_state.turnMessage()) // Title of game
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(Color.green)
                    .shadow(color: .green,radius: 10)
                    .padding()
                Spacer()
                
                VStack(spacing: border_size){
                    ForEach(0...2, id: \.self){ // Rows (3)
                        row in
                        HStack(spacing: border_size){
                            ForEach(0...2, id: \.self){ // Columns (3)
                                column in
                                let space = board_state.current_board[row][column]
                                Text(space.displayTile())
                                    .font(.system(size: 50)) //Font size of Xs and Os
                                    .foregroundColor(space.markColor()) //Color of Xs and Os
                                    .shadow(color: space.markColor(),radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                                    .bold()
                                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                                    .aspectRatio(1, contentMode: .fit)
                                    .background(Color.black) // For color in background of the grid
                                    .onTapGesture { // For interaction with the grid
                                        board_state.putMark(row, column)
                                    }
                            }
                        }
                    }
                }
                .background(Color.red) // For the color of the grid
                .padding() // Adds padding around the grid
                Spacer()
            }
        }
        
        .alert(isPresented: $board_state.showMessage){
            Alert(
                title: Text(board_state.alertMessage),
                dismissButton: .default(Text("Play Again")){
                    board_state.clearBoard()
                }
            )
        }
    }
}

#Preview {
    ContentView()
}
