//
//  Space.swift
//  TicTacToe
//
//  Created by Kate Stafford on 10/5/23.
//

import Foundation

struct Space{
    var mark: Mark
    
    func displayTile() -> String {
        if mark == Mark.X {
            return "X"
        } else if mark == Mark.O {
            return "O"
        } else {
            return " "
        }
    }
}
enum Mark{
    case X
    case O
    case free
}
