import Foundation
import Combine

class GameDetailViewModel: ObservableObject {
    @Published var game: GameDetail?
    @Published var gameS: [Game] = []
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
            let (detail, series) = try await (gameDetail, gameSeries)
            game = detail
            gameS = series
            isLoading = false
        } catch {
            errorMessage = error.localizedDescription
            isLoading = false
        }
    }
}
