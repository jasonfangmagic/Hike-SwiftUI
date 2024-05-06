
import Foundation

struct Hike: Identifiable,Hashable {
    let id = UUID()
    let name: String
    let photo: String
    let miles: Double
}
