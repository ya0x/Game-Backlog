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
    let publishers: [Publisher]?
    let developers: [Developer]?
    let esrbRating: ESRBRating?
    let similarGames: [Game]?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case released
        case backgroundImage = "background_image"
        case rating
        case metacriticScore = "metacritic"
        case descriptionRaw = "description_raw"
        case genres
        case platforms
        case publishers
        case developers
        case esrbRating = "esrb_rating"
        case similarGames = "game_series"
    }
}

struct Genre: Codable {
    let id: Int
    let name: String
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

struct Screenshot: Codable {
    let id: Int
    let image: String
}

struct ScreenshotsResponse: Codable {
    let results: [Screenshot]
}
