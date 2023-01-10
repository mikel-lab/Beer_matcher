import Foundation

struct Response: Codable {
    let name: String

    enum CodingKeys: String, CodingKey {
        case name
    }
}
