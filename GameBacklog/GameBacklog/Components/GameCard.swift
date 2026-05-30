import SwiftUI
import Kingfisher

struct GameCard: View {
    let game: Game
    
    var body: some View {
        VStack(alignment: .center, spacing: 4) {
            KFImage(URL(string: game.backgroundImage ?? ""))
                .placeholder { Color.gray }
                .resizable()
                .scaledToFit()
                .cornerRadius(8)
                .frame(width: 120, height: 180)
                .clipped()
            Text(game.name)
                .font(.caption)
                .lineLimit(2)
                .frame(width: 120)
                .multilineTextAlignment(.center)
            Text("⭐\(String(format: "%.1f", game.rating))")
                .font(.caption2)
                .padding(4)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(4)
                
        }
        .frame(maxHeight: .infinity, alignment: .top)
    }
}
