import SwiftUI
import Kingfisher

struct GameDetailView: View {
    let id: Int
    @StateObject private var viewModel = GameDetailViewModel()
    @ViewBuilder
    
    var body: some View {
        ScrollView {
            if let game = viewModel.game {
                Text(game.name)
                KFImage(URL(string: game.backgroundImage ?? ""))
                    .placeholder { Color.gray }
                    .resizable()
                    .scaledToFill()
                    .cornerRadius(8)
                    .frame(maxWidth: .infinity)
                    .frame(height: 250)
                    .clipped()
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(viewModel.screenshots, id: \.id) { screenshot in
                            KFImage(URL(string: screenshot.image))
                                .resizable()
                                .scaledToFill()
                                .frame(width: 250, height: 140)
                                .clipped()
                                .cornerRadius(8)
                        }
                    }
                }
                VStack {
                    Text("⭐\(String(format: "%.1f", game.rating))")
                        .font(.caption2)
                        .padding(4)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(4)
                    Text("\(game.genres.map(\.name).joined(separator: ", "))")
                        .font(.caption)
                        .foregroundColor(.secondary)
                        .padding(.bottom, 16)
                    Text(game.released ?? "TBA")
                    Text(game.descriptionRaw ?? "No description available")
                }
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(viewModel.gameS, id: \.id) { similarGame in
                            GameCard(game: similarGame)
                        }
                    }
                }
            }
        }
        .task {
            await viewModel.loadDetail(id: id)
        }
    }
}


