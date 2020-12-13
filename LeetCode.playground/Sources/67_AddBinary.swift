import Foundation

/**
 Given two binary strings a and b, return their sum as a binary string.

 Example 1:

 Input: a = "11", b = "1"
 Output: "100"
 Example 2:

 Input: a = "1010", b = "1011"
 Output: "10101"

 Constraints:

 1 <= a.length, b.length <= 104
 a and b consist only of '0' or '1' characters.
 Each string does not contain leading zeros except for the zero itself.

 */

extension LC {
  public enum N67_AddBinary {
    public static func execute(_ a: String, _ b: String) -> String {
      var strA = a
      var strB = b
      let maxSize = max(a.count, b.count)

      var finalSum: String = ""
      var isCarry: Bool = false
      for _ in 0..<maxSize {
        let charA: Character = strA.popLast() ?? "0"
        let charB: Character = strB.popLast() ?? "0"
        switch (charA, charB) {
        case ("0", "0"):
          finalSum = (isCarry ? "1" : "0") + finalSum
          isCarry = false
        case ("1", "1"):
          finalSum = (isCarry ? "1" : "0") + finalSum
          isCarry = true
        case ("1", "0"), ("0", "1"):
          finalSum = (isCarry ? "0" : "1") + finalSum
        default:
          fatalError()
        }
      }

      if isCarry {
        finalSum = "1" + finalSum
      }

      return finalSum
    }
  }
}


