
//=======================================
//           String Literals
//=======================================

// Basic string literal
let someString = "Some string literal value"

// Initializing empty strings
var emptyString = ""
var anotherEmptyString = String()

if emptyString.isEmpty && anotherEmptyString.isEmpty {
    print("Nothing to see here")
}

// String mutability
var variableString = "Horse"
variableString += " and carriage"

let constantString = "Highlander"
//constantString += " and another Highlander" // compile-time error

//=======================================
//         Working with Characters
//=======================================

// Iterating through characters
for character in "Baby chick!🐥".characters {
    print(character)
}

// Creating characters directly
let yenSign: Character = "¥"

// Concatenating Strings and Characters
let string1 = "hello"
let string2 = " there"
var welcome = string1 + string2

var instruction = "look over"
instruction += string2

let exclamationMark: Character = "!"
welcome.append(exclamationMark)
print(welcome)

// String interpolation
let multiplier = 3
let message = "\(multiplier) times 2.5 is \(Double(multiplier) * 2.5)"

//=======================================
//               Unicode
//=======================================

// Unicode scalars
let latinSmallLetterA: Character = "a"
let frontFacingBabyChick: Character = "🐥"
let dollarSignCharacter: Character = "\u{24}"
let blackHeartCharacter: Character = "\u{2665}"
let sparklingHeartCharacter: Character = "\u{1F496}"

// Special Unicode Characters in String Literals
let wiseWords = "\"Imagination is more important than knowledge\" - Einstein"
let dollarSign = "\u{24}" // $, Unicode scalar U+0024
let blackHeart = "\u{2665}" // ♥, Unicode scalar U+2665
let sparklingHeart = "\u{1F496}" // 💖, Unicode scalar U+1F496

// Extended Grapheme Clusters
let eAcute: Character = "\u{E9}"
let combinedEAcute: Character = "\u{65}\u{301}" // e followed by  ́ equals é

let precomposed: Character = "\u{D55C}" // 한
let decomposed: Character = "\u{1112}\u{1161}\u{11AB}" // ᄒ, ᅡ, ᆫ

let enclosedEAcute: Character = "\u{E9}\u{20DD}"

//=======================================
//          Counting Characters
//=======================================

// countElements global function
let unusualMenagerie = "Koala 🐨, Snail 🐌, Penguin 🐧, Dromedary 🐪"
print("unusualMenagerie has \(unusualMenagerie.characters.count) characters")

// Character count with Extreme Grapheme Clusters
var word = "cafe"
print("the number of characters in \(word) is \((word).characters.count)")

word += "\u{301}"
print("the number of characters in \(word) is \((word).characters.count)")

var emoji = "👍"
emoji.characters.count

//=======================================
//          Comparing Strings
//=======================================

// String and Character Equality
let quotation = "We're a lot alike, you and I."
let sameQuotation = "We're a lot alike, you and I."

if quotation == sameQuotation {
    print("These two strings are considered equal")
}

// Even if extreme grapheme clusters are different, if they visually appear the same,
// then they are equal
let eAcuteQuestion = "Voulez-vous un caf\u{E9}"
let combinedEAcuteQuestion = "Voulez-vous un caf\u{65}\u{301}"

if eAcuteQuestion == combinedEAcuteQuestion {
    print("These two strings are considered equal")
}

// The English capital A is not equal to the Russian capital A b/c
// they are visually different
let latinCapitalLetterA: Character = "\u{41}"
let cyrillicCapitalLetterA: Character = "\u{0410}"

if latinCapitalLetterA != cyrillicCapitalLetterA {
    print("These two characters are not equivalent")
}

// Prefix Equality
let romeoAndJuliet = [
    "Act 1 Scene 1: Verona, A public place",
    "Act 1 Scene 2: Capulet's mansion",
    "Act 1 Scene 3: A room in Capulet's mansion",
    "Act 1 Scene 4: A street outside Capulet's mansion",
    "Act 1 Scene 5: The Great Hall in Capulet's mansion",
    "Act 2 Scene 1: Outside Capulet's mansion",
    "Act 2 Scene 2: Capulet's orchard",
    "Act 2 Scene 3: Outside Friar Lawrence's cell",
    "Act 2 Scene 4: A street in Verona",
    "Act 2 Scene 5: Capulet's mansion",
    "Act 2 Scene 6: Friar Lawrence's cell"
]

var act1SceneCount = 0

for scene in romeoAndJuliet where scene.hasPrefix("Act 1 ") {
    act1SceneCount += 1
}

print("There are \(act1SceneCount) scenes in Act 1")

// Suffix Equality
var mansionCount = 0
var cellCount = 0

for scene in romeoAndJuliet {
    if scene.hasSuffix("Capulet's mansion") {
        mansionCount += 1
    } else if scene.hasSuffix("Friar Lawrence's cell") {
        cellCount += 1
    }
}

print("\(mansionCount) mansion scenes and \(cellCount) cell scenes")

//=======================================
//  Unicode Representations of Strings
//=======================================

let dogString = "Dog\u{203C}\u{1F436}"

// UTF-8 Representation
for codeUnit in dogString.utf8 {
    print("\(codeUnit) ")
}

print()

// 68 111 103 226 128 188 240 159 144 182
// D  o   g   [   !!    ] [     🐶      ]
// 1b 1b  1b      3b            4b        // b = byte

// UTF-16 Representation
for codeUnit in dogString.utf16 {
    print("\(codeUnit) ")
}

print()

// 68 111 103 8252 55357 56374
// D  o   g   !!   [    🐶   ]
// 2b 2b  2b  2b        4b     // b = byte

// Unicode Scalar Representation
for scalar in dogString.unicodeScalars {
    print("\(scalar.value) ")
}

print()

// 68 111 103 8252 128054
// D  o   g   !!   🐶
// 4b 4b  4b  4b   4b   // b = byte

// Print out individual unicode scalars
for scalar in dogString.unicodeScalars {
    print("\(scalar)")
}
