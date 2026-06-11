import Foundation
import Combine

class GameDetailViewModel: ObservableObject {
    @Published var game: GameDetail?
    @Published var gameS: [Game] = []
    @Published var screenshots: [Screenshot] = []
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    private let service: RAWGService
    
    init(service: RAWGService = .shared) {
        self.service = service
    }
  
    @MainActor
    func loadDetail(id: Int) async {
        errorMessage = ""
        isLoading = true
        
        do {
            async let gameDetail = service.fetchGameDetail(id: id)
            async let gameSeries = service.fetchGameSeries(id: id)
            async let screenShots = service.fetchScreenshots(id: id)
            let (detail, series, screen) = try await (gameDetail, gameSeries, screenShots)
            game = detail
            gameS = series
            screenshots = screen
            isLoading = false
        } catch {
            errorMessage = error.localizedDescription
            isLoading = false
        }
    }
}
