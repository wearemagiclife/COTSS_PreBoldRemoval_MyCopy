import SwiftUI

struct LegalLinksView: View {
    private let fieldBackgroundColor = Color(red: 0.95, green: 0.90, blue: 0.78)

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Text("Legal")
                    .font(.custom("Iowan Old Style", size: 22))
                    .foregroundColor(AppTheme.primaryText)

                legalLink(title: "Privacy Policy", url: "https://wearemagic.life/privacy-policy")

                legalLink(title: "Terms of Service", url: "https://wearemagic.life/terms-of-service")
            }
            .padding()
            .background(AppTheme.backgroundColor.ignoresSafeArea())
        }
        .navigationTitle("Legal")
        .navigationBarTitleDisplayMode(.inline)
    }

    @ViewBuilder
    private func legalLink(title: String, url: String) -> some View {
        Button(action: {
            if let link = URL(string: url) {
                UIApplication.shared.open(link)
            }
        }) {
            HStack {
                Text(title)
                    .font(.custom("Iowan Old Style", size: 18))
                    .foregroundColor(AppTheme.primaryText)
                Spacer()
                Image(systemName: "arrow.up.right")
                    .foregroundColor(AppTheme.primaryText)
                    .accessibilityHidden(true)
            }
            .padding()
            .background(fieldBackgroundColor)
            .cornerRadius(10)
        }
        .accessibilityLabel(title)
        .accessibilityHint("Opens \(title.lowercased()) in your browser")
    }
}
