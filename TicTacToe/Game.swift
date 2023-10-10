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
        checkWin()
        
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
<<<<<<< HEAD
        
        
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
    
=======
    }

    func AIturn(){
        var availablePositions = [(row: Int, column: Int)]()

    // Find all available positions on the board
    for row in 0...2 {
        for column in 0...2 {
            if current_board[row][column].mark == Mark.free {
                availablePositions.append((row, column))
            }
        }
    }

    // Check if there are available positions to make a move
    if availablePositions.isEmpty {
        return 
    }

    // Randomly select one available position
    let randomIndex = Int.random(in: 0..<availablePositions.count)
    let (row, column) = availablePositions[randomIndex]

    // Place the AI's mark in the selected position
    current_board[row][column].mark = turn
    checkWin() // Check for a win after making the move

    // Switch the turn to the player's turn
    if turn == Mark.X {
        turn = Mark.O
    } else {
        turn = Mark.X
    }
    }

    func checkWin(){
        // Check rows for a win
    for row in current_board {
        if row.allSatisfy { $0.mark == Mark.X } {
            // Player X has won
            return Mark.X
        } else if row.allSatisfy { $0.mark == Mark.O } {
            // Player O has won
            return Mark.O
        }
    }

    // Check columns for a win
    for columnIndex in 0...2 {
        let column = current_board.map { $0[columnIndex] }
        if column.allSatisfy { $0.mark == Mark.X } {
            // Player X has won
            return Mark.X
        } else if column.allSatisfy { $0.mark == Mark.O } {
            // Player O has won
            return Mark.O
        }
    }

    // Check diagonals for a win
    let diagonal1 = [current_board[0][0], current_board[1][1], current_board[2][2]]
    let diagonal2 = [current_board[0][2], current_board[1][1], current_board[2][0]]

    if diagonal1.allSatisfy { $0.mark == Mark.X } || diagonal2.allSatisfy { $0.mark == Mark.X } {
        // Player X has won
        return Mark.X
    } else if diagonal1.allSatisfy { $0.mark == Mark.O } || diagonal2.allSatisfy { $0.mark == Mark.O } {
        // Player O has won
        return Mark.O
    }
    }
    return false
>>>>>>> origin/shiv
}
