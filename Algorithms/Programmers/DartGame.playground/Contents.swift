func solution(_ dartResult:String) -> Int {
    
    var i = 0, j = -1
    var numbers = [0, 0, 0]
    let arr = Array(dartResult)
    
    while i < dartResult.count {
        switch arr[i] {
        case "1":
            j += 1
            if arr[i+1] == "0" {
                numbers[j] = 10
                i += 1
            } else {
                numbers[j] = 1
            }
        case "0"..."9":
            j += 1
            numbers[j] = Int(String(arr[i])) ?? 0
        case "D":
            numbers[j] *= numbers[j]
        case "T":
            numbers[j] *= numbers[j] * numbers[j]
        case "*":
            if j > 0 {
                numbers[j - 1] *= 2
            }
            numbers[j] *= 2
        case "#":
            numbers[j] *= -1
        default: break
        }
        i += 1
    }
    
    return numbers.reduce(0, +)
}
