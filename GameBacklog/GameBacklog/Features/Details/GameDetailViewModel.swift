import Foundation
import Combine

class GameDetailViewModel: ObservableObject {
    @Published var game: GameDetail?
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
            let gameDetail = try await service.fetchGameDetail(id: id)
            game = gameDetail
            isLoading = false
        } catch {
            errorMessage = error.localizedDescription
            isLoading = false
        }
    }
}
