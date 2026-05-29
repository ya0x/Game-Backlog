import Foundation

class RAWGService {
    static let shared = RAWGService()
    private init() {}
    let baseURL = "https://api.rawg.io/api"
    let accessToken = Bundle.main.infoDictionary?["RAWG_ACCESS_TOKEN"] as? String ?? ""
    var today: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter.string(from: Date())
    }
    
    func fetchTopRated () async throws -> [Game] {
        let url = URL(string: "\(baseURL)/games?key=\(accessToken)&ordering=-rating&page_size=100")!
        let response: GamesResponse = try await NetworkManager.shared.fetch(url: url)
        return response.results
    }
    
    func fetchTrending () async throws -> [Game] {
        let url = URL(string: "\(baseURL)/games?key=\(accessToken)&ordering=-added&dates=2026-02-28,\(today)&page_size=100")!
        let response: GamesResponse = try await NetworkManager.shared.fetch(url: url)
        return response.results
    }
    
    func fetchPopular () async throws -> [Game] {
        let url = URL(string: "\(baseURL)/games?key=\(accessToken)&ordering=-metacritic&page_size=100")!
        let response: GamesResponse = try await NetworkManager.shared.fetch(url: url)
        return response.results
    }
    
    func fetchUpcoming () async throws -> [Game] {
        let url = URL(string: "\(baseURL)/games?key=\(accessToken)&ordering=-released&dates=\(today),2026-12-31&page_size=100")!
        let response: GamesResponse = try await NetworkManager.shared.fetch(url: url)
        return response.results
    }
    
    func fetchRecentRelease () async throws -> [Game] {
        let url = URL(string: "\(baseURL)/games?key=\(accessToken)&ordering=-released&dates=2025-01-01,\(today)&page_size=100")!
        let response: GamesResponse = try await NetworkManager.shared.fetch(url: url)
        return response.results
    }
}
