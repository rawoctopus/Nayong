import Foundation

func solution(_ record:[String]) -> [String] {
    
    var names: [String: String] = [:]
    
    let seperatedRecord = record
        .compactMap { $0.split(separator: " ") }
        .compactMap { ($0[0], $0[1], $0.last) }
    
    seperatedRecord.forEach { cmd, id, name in
        switch cmd {
        case "Enter", "Change":
            names[String(id)] = String(name!)
        default: break
        }
    }
    
    return seperatedRecord.compactMap { cmd, id, _ in
        let name = names[String(id), default: ""]
        switch cmd {
        case "Enter": return name + "님이 들어왔습니다."
        case "Leave": return name + "님이 나갔습니다."
        default: return nil
        }
    }
}


let record = ["Enter uid1234 Muzi", "Enter uid4567 Prodo","Leave uid1234","Enter uid1234 Prodo","Change uid4567 Ryan"]
let answer = ["Prodo님이 들어왔습니다.", "Ryan님이 들어왔습니다.", "Prodo님이 나갔습니다.", "Prodo님이 들어왔습니다."]

let result = solution(record)
assert(result == answer)
