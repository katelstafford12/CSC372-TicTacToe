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
    @Published var scoreX = 0 // Score for Xs
    @Published var scoreO = 0 // Score for Os
    @Published var showMessage = false // Victory or Draw alert
    @Published var alertMessage = "Draw" // Draw message
    
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
        turn = Mark.X
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
        
        if (hasWon()){
            if (turn == Mark.X){
                scoreX += 1
            }
            else{
                scoreO += 1
            }
            let winner = turn == Mark.X ? "X" : "O"
            alertMessage = winner + " Wins!"
            showMessage = true
        }
        
        // Check for a draw
        else if isDraw() {
            alertMessage = "Draw!"
            showMessage = true
        }
        else {
            // For changing turns
            if turn == Mark.X {
                turn = Mark.O
            } else {
                turn = Mark.X
            }
        }
        
        
    }
    
    func hasWon() -> Bool{
        // Find Horizontal Wins
        if isTurn(0,0) && isTurn(0,1) && isTurn(0,2){
            return true
        }
        if isTurn(1,0) && isTurn(1,1) && isTurn(1,2){
            return true
        }
        if isTurn(2,0) && isTurn(2,1) && isTurn(2,2){
            return true
        }
        // Find Vertical Wins
        if isTurn(0,0) && isTurn(1,0) && isTurn(2,0){
            return true
        }
        if isTurn(0,1) && isTurn(1,1) && isTurn(2,1){
            return true
        }
        if isTurn(0,2) && isTurn(1,2) && isTurn(2,2){
            return true
        }
        // Find Diagonal Wins
        if isTurn(0,0) && isTurn(1,1) && isTurn(2,2){
            return true
        }
        if isTurn(0,2) && isTurn(1,1) && isTurn(2,0){
            return true
        }
        return false
    }
    func isDraw () -> Bool {
        if hasWon() {
            return false
        }
        // Check if all positions are filled
        for row in current_board {
            for pos in row {
                if (pos.mark == Mark.free) {
                    return false
                }
            }
        }
        return true
    }
    
    func isTurn(_ row: Int, _ column: Int) -> Bool {
        return current_board[row][column].mark == turn
    }
    
    func turnMessage() -> String {
        return turn == Mark.X ? "X's turn!" : "O's turn!"
    }
    
}
