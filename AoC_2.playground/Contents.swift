import Foundation

// Advent of Code 2017 - Day 2

func readMatrix() -> [[Int]] {
    if let filePath = Bundle.main.path(forResource: "day2", ofType: "input") {
        do {
            let stringData = try String(contentsOfFile: filePath, encoding: .utf8)
            let rows = stringData.components(separatedBy: "\n")
            return rows.map {
                return $0.components(separatedBy: "\t").flatMap {Int($0)}
            }
        } catch {
            fatalError("Cannot read input")
        }
    }
    fatalError("Cannot read input")
}


func part1() {
    var checksum = 0
    for row in readMatrix() {
        checksum += row.max()! - row.min()!
    }
    print(checksum)
}

func part2() {
    var checksum = 0
    for row in readMatrix() {
        for x in row {
            for y in row where y != x {
                if y % x == 0 {
                    checksum += y / x
                }
            }
        }
    }
    print(checksum)
}


part1()
part2()
