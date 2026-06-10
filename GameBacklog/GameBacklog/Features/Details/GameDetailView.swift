import SwiftUI

struct GameDetailView: View {
    let id: Int
    @StateObject private var viewModel = GameDetailViewModel()
    @ViewBuilder
    
    var body: some View {
        Group {
            if let game = viewModel.game {
                Text(game.name)
                Text("\(game.id)")
            }
        }
        .task {
            await viewModel.loadDetail(id: id)
        }
    }
}
