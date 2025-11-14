import SwiftUI

struct LearnView: View {
    private let cardBackground = Color(red: 0.95, green: 0.91, blue: 0.82)
    
    var body: some View {
        ZStack {
            Color.launchScreenBackground
                .ignoresSafeArea()
            
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    Text("Learn")
                        .font(.custom("Iowan Old Style", size: 28))
                        .foregroundColor(AppTheme.primaryText)
                        .padding(.bottom, 8)
                    
                    Text("Here you can add teachings about the Cards of the Seven Sisters, planetary periods, how to read spreads, and more.")
                        .font(.custom("Iowan Old Style", size: 16))
                        .foregroundColor(AppTheme.secondaryText)
                        .padding(.bottom, 12)
                    
                    // Example placeholder “lesson” block
                    LearnSectionCard(
                        title: "Getting Started",
                        subtitle: "A gentle introduction to your daily card and how to read it.",
                        cardBackground: cardBackground
                    )
                    
                    LearnSectionCard(
                        title: "Planetary Rhythms",
                        subtitle: "Explore how timing and planetary periods shape your readings.",
                        cardBackground: cardBackground
                    )
                    
                    Spacer(minLength: 20)
                }
                .padding(.horizontal, 20)
                .padding(.top, 24)
                .padding(.bottom, 32)
            }
        }
        .navigationTitle("Learn")
        .navigationBarTitleDisplayMode(.inline)
    }
}

private struct LearnSectionCard: View {
    let title: String
    let subtitle: String
    let cardBackground: Color
    
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(title)
                .font(.custom("Iowan Old Style", size: 18))
                .foregroundColor(AppTheme.primaryText)
            Text(subtitle)
                .font(.custom("Iowan Old Style", size: 14))
                .foregroundColor(AppTheme.secondaryText)
        }
        .padding(14)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(
            RoundedRectangle(cornerRadius: 18, style: .continuous)
                .fill(cardBackground.opacity(0.96))
                .shadow(color: .black.opacity(0.12), radius: 8, x: 0, y: 4)
        )
        .overlay(
            RoundedRectangle(cornerRadius: 18, style: .continuous)
                .stroke(AppTheme.primaryText.opacity(0.10), lineWidth: 1)
        )
    }
}
