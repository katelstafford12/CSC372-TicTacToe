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
    game.putMark(row: 0, col: 0, mark: .o)
    game.putMark(row: 1, col: 0, mark: .o)
    game.putMark(row: 2, col: 0, mark: .o)
    game.putMark(0, 0)
        game.putMark(1, 1)
        game.putMark(1, 0)
        game.putMark(2, 2)
        game.putMark(2, 0) 
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
