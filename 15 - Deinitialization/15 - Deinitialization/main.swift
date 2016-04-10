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
    
    static func vendCoins(numberOfCoinsToVend: Int) -> Int {
        var numberOfCoinsToVend = numberOfCoinsToVend
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
print("A new player has joined the game with \(playerOne!.coinsInPurse) coins")
print("There are now \(Bank.coinsInBank) coins left in the bank")
print("")

playerOne!.winCoins(2_000)
print("PlayerOne won 2000 coins & now has \(playerOne!.coinsInPurse) coins")
print("The bank now only has \(Bank.coinsInBank) coins left")
print("")

playerOne = nil
print("PlayerOne has left the game")
print("The bank now has \(Bank.coinsInBank) coins")
print("")
