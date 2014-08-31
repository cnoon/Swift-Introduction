
//===================================
//       Nested Types in Action
//===================================

struct BlackjackCard {
    
    // Suit Enum
    enum Suit: Character {
        case Spades = "♠"
        case Hearts = "♡"
        case Diamonds = "♢"
        case Clubs = "♣"
    }

    // Rank Enum
    enum Rank: Int {
        case Two = 2, Three, Four, Five, Six, Seven, Eight, Nine, Ten
        case Jack, Queen, King, Ace
        
        struct Values {
            let first: Int, second: Int?
        }
        
        var values: Values {
            switch self {
            case .Ace:
                return Values(first: 1, second: 11)
            case .Jack, .Queen, .King:
                return Values(first: 10, second: nil)
            default:
                return Values(first: self.toRaw(), second: nil)
            }
        }
    }
    
    // Instance Properties
    let rank: Rank
    let suit: Suit
    var description: String {
        var output = "Suit is \(suit.toRaw()), value is \(rank.values.first)"
        if let second = rank.values.second {
            output += " or \(second)"
        }
        return output
    }
}

let theAceOfSpades = BlackjackCard(rank: .Ace, suit: .Spades)
println("theAceOfSpades: \(theAceOfSpades.description)")

//===================================
//     Referring to Nested Types
//===================================

let heartsSymbol = BlackjackCard.Suit.Hearts.toRaw()
