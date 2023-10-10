//
//  TicTacToeTests.swift
//  TicTacToeTests
//
//  Created by Kate Stafford on 10/4/23.
//

import XCTest
@testable import TicTacToe

final class TicTacToeTests: XCTestCase {
    var game: TicTacToe.Game!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        var game = TicTacToe.Game();
    }

    override func tearDownWithError() throws {
        game = nil
    }

    func testIsNotDrawWhenThereIsAWinner() {
        // Simulate a game where there's a winner
        // You should set up the game board accordingly based on your game's implementation

        game.putMark(0, 0)
        game.putMark(1, 1)
        game.putMark(0, 1)
        game.putMark(2, 2)
        game.putMark(0, 2) 

        XCTAssertFalse(game.isDraw())
    }

    func testDraw() {
        // Simulate a game where there's a winner
        // You should set up the game board accordingly based on your game's implementation

        game.putMark(0, 0)
        game.putMark(0, 1)
        game.putMark(2, 0)
        game.putMark(1, 0)
        game.putMark(1, 1) 
        game.putMark(2, 2) 
        game.putMark(1, 2) 
        game.putMark(0, 2) 
        game.putMark(2, 1) 

        XCTAssertTrue(game.isDraw())
    }

func testputmarks() {
        // Set up the game board with some non-empty marks
        game.putMark(0, 0)
        XCTAssertEqual(game.current_board[0][0].mark, Mark.X)
        game.putMark(1, 1)
         XCTAssertEqual(game.current_board[1][1].mark, Mark.O)
    }
        func testClearBoard() {
        // Set up the game board with some non-empty marks
        game.putMark(0, 0)
        game.putMark(1, 1)
        game.putMark(2, 2)
        
        // Clear the game board
        game.clearBoard()
        
        // Verify that all cells are empty after clearing
        for row in 0..<3 {
            for column in 0..<3 {
                XCTAssertEqual(game.current_board[row][column].mark, Mark.free)
            }
        }
        
        // Verify that the turn is reset to Mark.X
        XCTAssertEqual(game.turn, Mark.X)
    }

    func testDraw() {
        // Simulate a game where there's a winner
        // You should set up the game board accordingly based on your game's implementation

        game.putMark(0, 0)
        game.putMark(0, 1)
        game.putMark(2, 0)
        game.putMark(1, 0)
        game.putMark(1, 1) 
        game.putMark(2, 2) 
        game.putMark(1, 2) 
        game.putMark(0, 2) 
        game.putMark(2, 1) 

        XCTAssertTrue(game.isDraw())
    }

    func testHasWonHorizontal() {
    // Simulate a game where a player has won horizontally
        game.putMark(0, 0)
        game.putMark(1, 1)
        game.putMark(0, 1)
        game.putMark(2, 2)
        game.putMark(0, 2) 

    // Check if the game is considered as won
    XCTAssertTrue(game.hasWon())
}

    func testHasWonVertical() {
    game.putMark(0,0)
    game.putMark(1,1)
    game.putMark(1,0)
    game.putMark(2,2)
        game.putMark(2, 1)
    // Check if the game is considered as won
    XCTAssertTrue(game.hasWon())
}

func testHasNotWon() {
    game.putMark(0,0)
    game.putMark(1,0)
    XCTAssertFalse(game.hasWon())
}
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
