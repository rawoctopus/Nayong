/*
 코딩 인터뷰 완전분석
 
 8.8 중복 있는 순열:
 문자열이 주어졌을 때 모든 경우의 순열을 게산하는 메서드를 작성하라. 문자는 중복되어 나타날 수 있지만, 나열된 순열은 서로 중복되면 안된다.
 */

func permute(_ str: String) -> [String] {
    var freqTable = frequencyTable(of: str)
    var result: [String] = []
    permute(frequencyTable: &freqTable,
            prefix: "",
            remaining: str.count,
            result: &result)
    return result
}

func frequencyTable(of str: String) -> [Character : Int] {
    return Dictionary(zip(str, 0...), uniquingKeysWith: +)
}

func permute(frequencyTable: inout [Character : Int],
             prefix: String,
             remaining: Int,
             result: inout [String]) {
    
    guard remaining != 0 else {
        result.append(prefix)
        return
    }
    
    frequencyTable.forEach { char, count in
        if count > 0 {
            frequencyTable[char]! -= 1
            permute(frequencyTable: &frequencyTable,
                    prefix: "\(prefix)\(char)",
                    remaining: remaining - 1,
                    result: &result)
            frequencyTable[char]! += 1
        }
    }
}
