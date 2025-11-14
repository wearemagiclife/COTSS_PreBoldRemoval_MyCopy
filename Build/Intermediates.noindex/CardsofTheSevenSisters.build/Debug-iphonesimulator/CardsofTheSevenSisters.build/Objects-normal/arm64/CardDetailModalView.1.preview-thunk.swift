import func SwiftUI.__designTimeFloat
import func SwiftUI.__designTimeString
import func SwiftUI.__designTimeInteger
import func SwiftUI.__designTimeBoolean

#sourceLocation(file: "/Users/impriints/Downloads/COTSS_PreBoldRemoval_MyCopy/CardsofTheSevenSisters/Components/CardDetailModalView.swift", line: 1)
import SwiftUI
import UIKit

enum CardType {
    case planetary, daily, birth, yearly, fiftyTwoDay
}

enum DetailContentType {
    case standard, extended, karma(String), planetary(String)
}

struct CardDetailModalView: View {
    let card: Card
    let cardType: CardType
    let contentType: DetailContentType?
    @Binding var isPresented: Bool

    // MARK: - Title glyph sizing to visually match (or exceed) 28pt text
    private var titleUIFont: UIFont { UIFont(name: __designTimeString("#7544_0", fallback: "Iowan Old Style"), size: __designTimeInteger("#7544_1", fallback: 28)) ?? .systemFont(ofSize: __designTimeInteger("#7544_2", fallback: 28)) }
    // Scale up slightly so the image reads like a typographic title
    private var nameGlyphHeight: CGFloat { titleUIFont.lineHeight * __designTimeFloat("#7544_3", fallback: 1.35) } // tweak factor as desired

    var body: some View {
        ZStack {
            Color.black.opacity(isPresented ? __designTimeFloat("#7544_4", fallback: 0.6) : __designTimeInteger("#7544_5", fallback: 0))
                .ignoresSafeArea(.all)
                .onTapGesture {
                    closeModal()
                }
                .allowsHitTesting(isPresented)
                .accessibilityLabel(__designTimeString("#7544_6", fallback: "Close card details"))
                .accessibilityAddTraits(.isButton)
                .accessibilityHint(__designTimeString("#7544_7", fallback: "Double tap to close"))

            ScrollView {
                VStack(spacing: __designTimeInteger("#7544_8", fallback: 25)) {
                    Group {
                        if case .planetary(let planet) = contentType {
                            if let planetImage = ImageManager.shared.loadPlanetImage(for: planet) {
                                Image(uiImage: planetImage)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(height: __designTimeInteger("#7544_9", fallback: 300))
                                    .clipShape(RoundedRectangle(cornerRadius: __designTimeInteger("#7544_10", fallback: 16)))
                                    .shadow(color: .black.opacity(__designTimeFloat("#7544_11", fallback: 0.3)), radius: __designTimeInteger("#7544_12", fallback: 10), x: __designTimeInteger("#7544_13", fallback: 0), y: __designTimeInteger("#7544_14", fallback: 5))
                                    .accessibilityLabel("\(planet) planetary influence")
                                    .accessibilityAddTraits(.isImage)
                            }
                        } else {
                            if let uiImage = ImageManager.shared.loadCardImage(for: card) {
                                Image(uiImage: uiImage)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(height: __designTimeInteger("#7544_15", fallback: 300))
                                    .clipShape(RoundedRectangle(cornerRadius: __designTimeInteger("#7544_16", fallback: 16)))
                                    .shadow(color: .black.opacity(__designTimeFloat("#7544_17", fallback: 0.3)), radius: __designTimeInteger("#7544_18", fallback: 10), x: __designTimeInteger("#7544_19", fallback: 0), y: __designTimeInteger("#7544_20", fallback: 5))
                                    .accessibilityLabel("\(card.value) of \(card.suit.rawValue)")
                                    .accessibilityAddTraits(.isImage)
                            }
                        }
                    }
                    .id(__designTimeString("#7544_21", fallback: "cardTop"))

                    VStack(spacing: __designTimeInteger("#7544_22", fallback: 10)) {
                        Group {
                            if case .planetary(let planet) = contentType {
                                let planetInfo = AppConstants.PlanetDescriptions.getDescription(for: planet)
                                Text(planetInfo.title.lowercased())
                                    .font(.custom(__designTimeString("#7544_23", fallback: "Iowan Old Style"), size: __designTimeInteger("#7544_24", fallback: 22)))
                                    .foregroundColor(.black)
                                    .multilineTextAlignment(.center)
                            } else {
                                if let def = getCardDefinition(by: card.id) {
                                    // Name glyph (replaces the big bold card name text)
                                    let assetName = cardNameAsset(def.name)
                                    if let nameGlyph = UIImage(named: assetName) {
                                        Image(uiImage: nameGlyph)
                                            .resizable()
                                            .renderingMode(.original)
                                            .scaledToFit()
                                            .frame(height: nameGlyphHeight)
                                            .accessibilityLabel(def.name)
                                            .accessibilityAddTraits(.isHeader)
                                    } else {
#if DEBUG
                                        // Visual debug: if asset is missing, show a subtle placeholder to catch it
                                        Text("Missing: \(assetName)")
                                            .font(.system(size: __designTimeInteger("#7544_25", fallback: 14), weight: .regular))
                                            .foregroundColor(.red)
#else
                                        // In release, show nothing rather than fallback bold text
                                        EmptyView()
#endif
                                    }

                                    // Subtitle remains
                                    Text(def.title.lowercased())
                                        .font(.custom(__designTimeString("#7544_26", fallback: "Iowan Old Style"), size: __designTimeInteger("#7544_27", fallback: 21)))
                                        .foregroundColor(.black)
                                        .multilineTextAlignment(.center)
                                        .padding(.top, __designTimeInteger("#7544_28", fallback: 2))
                                }
                            }
                        }

                        Rectangle()
                            .frame(width: __designTimeInteger("#7544_29", fallback: 80), height: __designTimeInteger("#7544_30", fallback: 1))
                            .foregroundColor(.black.opacity(__designTimeFloat("#7544_31", fallback: 0.6)))
                            .padding(.vertical, __designTimeInteger("#7544_32", fallback: 15))
                            .accessibilityHidden(__designTimeBoolean("#7544_33", fallback: true))

                        Text(descriptionText())
                            .font(.custom(__designTimeString("#7544_34", fallback: "Iowan Old Style"), size: __designTimeInteger("#7544_35", fallback: 20)))
                            .lineSpacing(__designTimeInteger("#7544_36", fallback: 5))
                            .tracking(__designTimeFloat("#7544_37", fallback: 0.8))
                            .foregroundColor(.black)
                            .multilineTextAlignment(.leading)
                            .padding(.horizontal, __designTimeInteger("#7544_38", fallback: 25))
                    }
                }
                .padding(.vertical, __designTimeInteger("#7544_39", fallback: 20))
                .padding(.horizontal, __designTimeInteger("#7544_40", fallback: 20))
            }
            .scrollIndicators(.hidden)
            .scrollTargetLayout()
            .scrollPosition(id: .constant(__designTimeString("#7544_41", fallback: "cardTop")))
            .background(
                RoundedRectangle(cornerRadius: __designTimeInteger("#7544_42", fallback: 25))
                    .fill(Color(red: __designTimeFloat("#7544_43", fallback: 0.86), green: __designTimeFloat("#7544_44", fallback: 0.77), blue: __designTimeFloat("#7544_45", fallback: 0.57)).opacity(__designTimeFloat("#7544_46", fallback: 0.95)))
            )
            .clipShape(RoundedRectangle(cornerRadius: __designTimeInteger("#7544_47", fallback: 25)))
            .scaleEffect(isPresented ? __designTimeInteger("#7544_48", fallback: 1) : __designTimeFloat("#7544_49", fallback: 0.8))
            .opacity(isPresented ? __designTimeInteger("#7544_50", fallback: 1) : __designTimeInteger("#7544_51", fallback: 0))
            .padding(.horizontal, __designTimeInteger("#7544_52", fallback: 25))
            .padding(.top, __designTimeInteger("#7544_53", fallback: 44))
            .padding(.bottom, __designTimeInteger("#7544_54", fallback: 20))
            .allowsHitTesting(isPresented)
            .zIndex(__designTimeInteger("#7544_55", fallback: 10))
        }
        .animation(.spring(response: AppConstants.Animation.springResponse, dampingFraction: AppConstants.Animation.springDamping), value: isPresented)
    }

    private func closeModal() {
        withAnimation(.spring(response: AppConstants.Animation.springResponse, dampingFraction: AppConstants.Animation.springDamping)) {
            isPresented = __designTimeBoolean("#7544_56", fallback: false)
        }
    }

    private func descriptionText() -> String {
        switch contentType {
        case .karma(let description):
            return description
        case .planetary(let planet):
            let planetInfo = AppConstants.PlanetDescriptions.getDescription(for: planet)
            return planetInfo.description
        case .extended:
            return __designTimeString("#7544_57", fallback: "Extended content handled by view")
        case .standard, .none:
            let repo = DescriptionRepository.shared
            let cardID = String(card.id)
            switch cardType {
            case .daily:
                return repo.dailyDescriptions[cardID] ?? __designTimeString("#7544_58", fallback: "No daily description available.")
            case .birth:
                return repo.birthDescriptions[cardID] ?? __designTimeString("#7544_59", fallback: "No birth description available.")
            case .yearly:
                return repo.yearlyDescriptions[cardID] ?? __designTimeString("#7544_60", fallback: "No yearly description available.")
            case .fiftyTwoDay:
                return repo.fiftyTwoDescriptions[cardID] ?? __designTimeString("#7544_61", fallback: "No 52-day description available.")
            case .planetary:
                return __designTimeString("#7544_62", fallback: "Error: Planetary descriptions should be passed via contentType")
            }
        }
    }
}

// MARK: - Asset name resolver for the small name glyph
private func cardNameAsset(_ raw: String) -> String {
    let trimmed = raw.trimmingCharacters(in: .whitespacesAndNewlines)
    let lower = trimmed.lowercased()
    
    // Joker assets are titled "The Joker"
    if lower.contains(__designTimeString("#7544_63", fallback: "joker")) { return __designTimeString("#7544_64", fallback: "The Joker") }
    
    // Other assets are uppercased with spaces, e.g., "EIGHT OF CLUBS"
    // Normalize underscores/dashes just in case
    let spaced = trimmed
        .replacingOccurrences(of: __designTimeString("#7544_65", fallback: "_"), with: __designTimeString("#7544_66", fallback: " "))
        .replacingOccurrences(of: __designTimeString("#7544_67", fallback: "-"), with: __designTimeString("#7544_68", fallback: " "))
        .replacingOccurrences(of: __designTimeString("#7544_69", fallback: "  "), with: __designTimeString("#7544_70", fallback: " "))
    return spaced.uppercased()
}
