import Foundation
import Combine

class HomeViewModel: ObservableObject {
    @Published var topRatedGames: [Game] = []
    @Published var trendingGames: [Game] = []
    @Published var popularGames: [Game] = []
    @Published var upcomingGames: [Game] = []
    @Published var recentReleaseGames: [Game] = []
    @Published var isLoading = false
    @Published var errorMessage = ""
    
    private let service: RAWGService
    
    init(service: RAWGService = .shared) {
        self.service = service
    }
    
    @MainActor
    func loadData() async {
        errorMessage = ""
        isLoading = true
        
        do {
            async let topRated = service.fetchTopRated()
            async let trending = service.fetchTrending()
            async let popular = service.fetchPopular()
            async let upcoming = service.fetchUpcoming()
            async let recentRelease = service.fetchRecentRelease()
            let (t, tr, p, u, r) = try await (topRated, trending, popular, upcoming, recentRelease)
            
            topRatedGames = t
            trendingGames = tr
            popularGames = p
            upcomingGames = u
            recentReleaseGames = r
            isLoading = false
            
        } catch {
            errorMessage = error.localizedDescription
            print("Error: \(error)")
            isLoading = false
        }
    }
}


