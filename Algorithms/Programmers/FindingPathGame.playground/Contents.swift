import Foundation

struct Point {
    let x: Int
    let y: Int
}

class Node {
    let value: Int
    let point: Point
    var left: Node? = nil
    var right: Node? = nil

    init(value: Int, point: Point) {
        self.value = value
        self.point = point
    }

    func buildTree(with nodes: [[Node]]) {
        guard let children = nodes.first, !children.isEmpty else { return }

        left = children.first { $0.point.x < point.x }
        right = children.first { $0.point.x > point.x }

        let nextNodes = Array(nodes.dropFirst())
        left?.buildTree(with: nextNodes.map { $0.filter { $0.point.x < point.x } })
        right?.buildTree(with: nextNodes.map { $0.filter { $0.point.x > point.x } })
    }

    var preOrderTree: [Node] {
        return [self] + (left?.preOrderTree ?? []) + (right?.preOrderTree ?? [])
    }

    var postOrderTree: [Node] {
        return (left?.postOrderTree ?? []) + (right?.postOrderTree ?? []) + [self]
    }
}

func solution(_ nodeinfo:[[Int]]) -> [[Int]] {

    var dict: [Int : [Node]] = [:]
    nodeinfo.enumerated().forEach { i, arr in
        let x = arr[0], y = arr[1]
        dict[y] = dict[y, default: []] + [Node(value: i + 1, point: Point(x: x, y: y))]
    }

    let nodes = dict.sorted { $0.key > $1.key }.compactMap { $0.value }
    let root = nodes.first?.first
    root?.buildTree(with: Array(nodes.dropFirst()))

    return [root?.preOrderTree ?? [], root?.postOrderTree ?? []]
        .map { $0.compactMap { $0.value } }
}
