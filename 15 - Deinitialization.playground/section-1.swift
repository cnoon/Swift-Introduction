
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
        println("player created")
        coinsInPurse = Bank.vendCoins(coins)
    }
    deinit {
        println("player has left the game")
        Bank.receiveCoins(coinsInPurse)
    }
    
    func winCoins(coins: Int) {
        coinsInPurse += Bank.vendCoins(coins)
    }
}

var playerOne: Player? = Player(coins: 100)
playerOne!.coinsInPurse
Bank.coinsInBank
playerOne = nil
Bank.coinsInBank // deinit not properly called in playgrounds
