//
//  Space.swift
//  TicTacToe
//
//  Created by Kate Stafford on 10/5/23.
//

import Foundation
import SwiftUI


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
    
    func markColor() -> Color {
        switch(self.mark) {
        case Mark.X:
            return Color.neonGreen
        case Mark.O:
            return Color.neonPurple
        default:
            return Color.clear
        }
    }
}
enum Mark{
    case X
    case O
    case free
}



