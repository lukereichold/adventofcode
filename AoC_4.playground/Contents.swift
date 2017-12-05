import Foundation

// Advent of Code 2017
// Day 4: High-Entropy Passphrases

func allPassphrases() -> [String] {
    if let filePath = Bundle.main.path(forResource: "4", ofType: "input") {
        do {
            let stringData = try String(contentsOfFile: filePath, encoding: .utf8)
            return stringData.components(separatedBy: "\n")
        } catch { fatalError("Cannot read input") }
    }
    fatalError("Cannot read input")
}

func part1() -> Int {
    return allPassphrases().map { phrase in
        let words = phrase.components(separatedBy: " ")
        return words.count == Set(words).count ? 1 : 0
    }.reduce(0, +)
}

func part2() -> Int {
    return allPassphrases().map { phrase in
        let words = phrase.components(separatedBy: " ")
        let sorted = words.map{String($0.sorted())}
        return Set(sorted).count == sorted.count ? 1 : 0
    }.reduce(0, +)
}

print(part1())
print(part2())
