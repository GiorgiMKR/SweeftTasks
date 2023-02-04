import UIKit

//#1
func minSplit(amount: Int) -> Int {
    var coins: [Int] = [50, 20, 10, 5, 1]
    var result: Int = 0
    var currentAmount = amount

    for coin in coins {
        result += currentAmount / coin
        currentAmount %= coin
    }
    return result
}

print(minSplit(amount: 9))
print(minSplit(amount: 26))
print(minSplit(amount: 172))

//#2
func sumOfDigits(start: Int, end: Int) -> Int {
    var result: Int = 0

    for number in start...end {
        var numberString = String(number)
        for char in numberString {
            result += Int(String(char))!
        }
    }
    return result
}

print(sumOfDigits(start: 7, end: 8))
print(sumOfDigits(start: 17, end: 20))
print(sumOfDigits(start: 10, end: 12))

//#3
func isProperly(sequence: String) -> Bool {
    var leftCount: Int = 0
    var rightCount: Int = 0

    for char in sequence {
        if char == "(" {
            leftCount += 1
        } else {
            rightCount += 1
            if rightCount > leftCount {
                return false
            }
        }
    }
    if rightCount == leftCount {
        return true
    }
    return false
}

print(isProperly(sequence: "(()())"))
print(isProperly(sequence: ")(()"))
print(isProperly(sequence: "(()())("))

//#4
func countWays(n: Int, steps: [Int]) -> Int {
    if n == 0 {
        return 1
    }

    var areMoreSteps: Bool = n > 1

    if steps[0] == 0 {
        if !areMoreSteps {
            return 1
        }
        if steps[1] == 0 {
            return 0
        }
        return countWays(n: n-2, steps: Array(steps[2...n-1]))
    } else if steps[0] == 1 {
        if !areMoreSteps {
            return 2
        }
        if steps[1] == 0 {
            return countWays(n: n-1, steps: Array(steps[1...n-1]))
        }
        return countWays(n: n-1, steps: Array(steps[1...n-1])) + countWays(n: n-2, steps: Array(steps[2...n-1]))
    }
    return 0
}

print(countWays(n: 3, steps: [0, 1, 0]))
print(countWays(n: 4, steps: [0, 1, 1, 0]))
print(countWays(n: 5, steps: [1, 1, 0, 1, 1]))

//#5
func zeros(N: Int) -> Int {
    var i = 5
    var result = 0
    while (i <= N) {
        result += N / i
        i *= 5
    }
    return result
}

print(zeros(N: 7))
print(zeros(N: 12))
print(zeros(N: 490))
