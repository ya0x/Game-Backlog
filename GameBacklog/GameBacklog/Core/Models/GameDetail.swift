import Foundation

struct GameDetail: Codable {
    let id: Int
    let name: String
    let released: String?
    let backgroundImage: String?
    let rating: Double
    let metacriticScore: Int?
    let descriptionRaw: String?
    let genres: [Genre]
    let platforms: [PlatformContainer]?
    let screenshots: [Screenshot]?
    let publishers: [Publisher]?
    let developers: [Developer]?
    let esrbRating: ESRBRating?
    let similarGames: [Game]?
}

struct Genre: Codable {
    let id: Int
    let name: String
}

struct Screenshot: Codable {
    let id: Int
    let image: String
}

struct Publisher: Codable {
    let id: Int
    let name: String
}

struct Developer: Codable {
    let id: Int
    let name: String
}

struct ESRBRating: Codable {
    let id: Int
    let name: String
}
