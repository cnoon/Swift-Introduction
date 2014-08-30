//
//  main.swift
//  15 - Deinitialization
//
//  Created by Christian Noon on 8/30/14.
//  Copyright (c) 2014 Noondev. All rights reserved.
//

import Foundation

//======================================
//       Deinitializers in Action
//======================================

struct Bank {
    static var coinsInBank = 10_000
    
    static func vendCoins(var numberOfCoinsToVend: Int) -> Int {
        numberOfCoinsToVend = min(numberOfCoinsToVend, coinsInBank)
        coinsInBank -= numberOfCoinsToVend
        return numberOfCoinsToVend
    }
    static func receiveCoins(coins: Int) {
        coinsInBank += coins
    }
}

class Player {
    var coinsInPurse: Int
    
    init(coins: Int) {
        coinsInPurse = Bank.vendCoins(coins)
    }
    deinit {
        Bank.receiveCoins(coinsInPurse)
    }
    
    func winCoins(coins: Int) {
        coinsInPurse += Bank.vendCoins(coins)
    }
}

var playerOne: Player? = Player(coins: 100)
println("A new player has joined the game with \(playerOne!.coinsInPurse) coins")
println("There are now \(Bank.coinsInBank) coins left in the bank")
println()

playerOne!.winCoins(2_000)
println("PlayerOne won 2000 coins & now has \(playerOne!.coinsInPurse) coins")
println("The bank now only has \(Bank.coinsInBank) coins left")
println()

playerOne = nil
println("PlayerOne has left the game")
println("The bank now has \(Bank.coinsInBank) coins")
println()
