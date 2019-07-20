import Foundation

// https://programmers.co.kr/learn/courses/30/lessons/42579

func solution(_ genres:[String], _ plays:[Int]) -> [Int] {

    // (1) make dictionary of [genre: [(index, play times)]]
    let dict = genres.enumerated().reduce(into: [String: [(Int, Int)]]()) { result, enumerated in
        let genre = enumerated.element
        let index = enumerated.offset
        result[genre, default: []] += [(index, plays[index])]
    }
    
    // (2) sort by sum of play times.
    let orderedArr = Array(dict).sorted {
        $0.value.map{ $0.1 }.reduce(0, +) > $1.value.compactMap{ $0.1 }.reduce(0, +)
    }
    
    // (3) map top 2 indexes
    let result = orderedArr.compactMap {
        $0.value.sorted { $0.1 > $1.1 }.map{ $0.0 }.prefix(2)
    }.reduce([], +)
    
    return result
}


let genres = ["classic", "pop", "classic", "classic", "pop"]
let plays = [500, 600, 150, 800, 2500]
let answer = [4, 1, 3, 0]

assert(solution(genres, plays) == answer)
