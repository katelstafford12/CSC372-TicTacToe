//
//  Game.swift
//  TicTacToe
//
//  Created by Kate Stafford on 10/5/23.
//

import Foundation

class Game: ObservableObject{
    @Published var current_board = [[Space]]() // Stores current game state
    @Published var turn = Mark.X // Starting turn is set to mark X
    
    init(){
        clearBoard()
    }
    
    // Resets board and sets all marks to free
    func clearBoard(){
        var temp = [[Space]]()
        for _ in 0...2{
            var row = [Space]()
            for _ in 0...2{
                row.append(Space(mark: Mark.free))
            }
            temp.append(row)
        }
        current_board = temp
    }
    
    // Puts a mark on the board given a row and column
    func putMark(_ row: Int, _ column: Int){
        if(current_board[row][column].mark != Mark.free){
            return
        }
        
        // For marking space based on turn
        if turn == Mark.X {
            current_board[row][column].mark = Mark.X
        } else {
            current_board[row][column].mark = Mark.O
        }
        
        // For changing turns
        if turn == Mark.X {
            turn = Mark.O
        } else {
            turn = Mark.X
        }
        
        //TODO: implement a check if anyone has won
    }
}
