import Foundation

// https://programmers.co.kr/learn/courses/30/lessons/42579

func solution(_ genres:[String], _ plays:[Int]) -> [Int] {

    var idsByGenre: [String: [Int]] = [:]
    (0..<genres.count).forEach { i in
        var ids = idsByGenre[genres[i]] ?? []
        ids.append(i)
        idsByGenre[genres[i]] = ids
    }
    
    let sortedDict = idsByGenre.sorted {
        $0.value.compactMap{ plays[$0] }.reduce(0, +) > $1.value.compactMap{ plays[$0] }.reduce(0, +)
    }
    
    var answer: [Int] = []
    sortedDict.compactMap{ $0.value }.forEach { ids in
        let first = ids.max { plays[$0] < plays[$1] }!
        answer += [first]
        
        let second = ids.filter { $0 != first }.max { plays[$0] < plays[$1] }
        if let second = second {
            answer += [second]
        }
    }
    
    return answer
}


let genres = ["classic", "pop", "classic", "classic", "pop"]
let plays = [500, 600, 150, 800, 2500]
let answer = [4, 1, 3, 0]

assert(solution(genres, plays) == answer)
