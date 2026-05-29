import Foundation

struct PlatformContainer: Codable {
    let platform: Platform
}

struct Platform: Codable {
    let id: Int
    let name: String
}

struct Game: Codable {
    let id: Int
    let name: String
    let released: String?
    let backgroundImage: String?
    let rating: Double
    let platforms: [PlatformContainer]
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case released
        case backgroundImage = "background_image"
        case rating
        case platforms
    }
}

struct GamesResponse: Codable {
    let results: [Game]
}
