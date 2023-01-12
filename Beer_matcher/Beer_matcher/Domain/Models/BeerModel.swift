import Foundation

struct Result: Codable {
    let name: String

    enum CodingKeys: String, CodingKey {
        case name
    }
}
