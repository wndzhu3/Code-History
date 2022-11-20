//
//  ScoreViewModel.swift
//  Code History
//
//  Created by Wendy Zhu on 9/1/22.
//

import Foundation
 
struct ScoreViewModel {
    let correctGuesses: Int
    let incorrectGuesses: Int
 
    var percentage: Int {
        (correctGuesses * 100 / (correctGuesses + incorrectGuesses))
    }
}
