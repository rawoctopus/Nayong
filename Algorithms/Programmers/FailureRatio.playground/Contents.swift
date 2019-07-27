import Foundation

func solution(_ N:Int, _ stages:[Int]) -> [Int] {
    
    var counts = [Int](repeating: 0, count: N+2) // 1~N : 스테이지별 유저 수, N+1: 클리어한 유저 수
    stages.forEach { stage in
        counts[stage] += 1
    }
    
    var n = 0
    let ratios: [Float] = counts.reversed().compactMap { count in
        guard n + count > 0 else {
            return 0
        }
        n += count
        return Float(count) / Float(n)
    }.reversed()
    print(ratios)
    
    return (1...N).sorted { ratios[$0] > ratios[$1] }
}

let stages1 = [2, 1, 2, 6, 2, 4, 3, 3]
let answer1 = [3,4,2,1,5]

let stages2 = [4,4,4,4,4]
let answer2 = [4,1,2,3]

assert(solution(5, stages1) == answer1)
assert(solution(4, stages2) == answer2)
