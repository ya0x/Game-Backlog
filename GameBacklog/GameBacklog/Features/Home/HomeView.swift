import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = HomeViewModel()
    @ViewBuilder
    
    func sectionView(title: String, games: [Game]) -> some View {
        Text(title)
            .font(.headline)
            .padding(.horizontal)
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(games, id: \.id) { game in
                    GameCard(game:game)
                }
            }
        }
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    sectionView(title: "Top Rated", games: viewModel.topRatedGames)
                    sectionView(title: "Trending Games", games: viewModel.trendingGames)
                    sectionView(title: "Popular Games", games: viewModel.popularGames)
                    sectionView(title: "Upcoming Games", games: viewModel.upcomingGames)
                    sectionView(title: "Recent Releases", games: viewModel.recentReleaseGames)
                }
            }
            .onAppear {
                viewModel.loadData()
            }
        }
    }
}
