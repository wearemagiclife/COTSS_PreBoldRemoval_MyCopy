import func SwiftUI.__designTimeFloat
import func SwiftUI.__designTimeString
import func SwiftUI.__designTimeInteger
import func SwiftUI.__designTimeBoolean

#sourceLocation(file: "/Users/impriints/Downloads/COTSS_PreBoldRemoval_MyCopy/CardsofTheSevenSisters/Components/playingcardview.swift", line: 1)
import SwiftUI

struct PlayingCardView: View {
    let card: Card
    let size: CardSize
    @Environment(\.sizeCategory) var sizeCategory
    @Environment(\.accessibilityReduceMotion) var reduceMotion
    
    enum CardSize {
        case small, medium, large
        
        var dimensions: CGSize {
            switch self {
            case .small: return CGSize(width: __designTimeInteger("#6901_0", fallback: 80), height: __designTimeInteger("#6901_1", fallback: 120))
            case .medium: return CGSize(width: __designTimeInteger("#6901_2", fallback: 120), height: __designTimeInteger("#6901_3", fallback: 176))
            case .large: return CGSize(width: __designTimeInteger("#6901_4", fallback: 150), height: __designTimeInteger("#6901_5", fallback: 220))
            }
        }
    }
    
    var body: some View {
        Group {
            if let uiImage = loadCardImage() {
                Image(uiImage: uiImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: scaledWidth, height: scaledHeight)
                    .clipShape(RoundedRectangle(cornerRadius: __designTimeInteger("#6901_6", fallback: 12)))
                    .shadow(color: .black.opacity(__designTimeFloat("#6901_7", fallback: 0.15)), radius: __designTimeInteger("#6901_8", fallback: 3), x: __designTimeInteger("#6901_9", fallback: 0), y: __designTimeInteger("#6901_10", fallback: 2))
                    .accessibilityLabel(cardAccessibilityLabel)
                    .accessibilityAddTraits(.isImage)
            } else {
                textBasedCardView
            }
        }
        .frame(minWidth: AppConstants.Accessibility.minimumTouchTarget,
               minHeight: AppConstants.Accessibility.minimumTouchTarget)
        .contentShape(Rectangle())
    }
    
    private var scaledWidth: CGFloat {
        let baseWidth = size.dimensions.width
        return sizeCategory.isAccessibilityCategory ? baseWidth * __designTimeFloat("#6901_11", fallback: 1.3) : baseWidth
    }
    
    private var scaledHeight: CGFloat {
        let baseHeight = size.dimensions.height
        return sizeCategory.isAccessibilityCategory ? baseHeight * __designTimeFloat("#6901_12", fallback: 1.3) : baseHeight
    }
    
    private var cardAccessibilityLabel: String {
        let suitName = card.suit.rawValue.lowercased()
        let valueName = cardValueName(card.value)
        return "\(valueName) of \(suitName)"
    }
    
    private func cardValueName(_ value: String) -> String {
        switch value.uppercased() {
        case "A": return __designTimeString("#6901_13", fallback: "Ace")
        case "K": return __designTimeString("#6901_14", fallback: "King")
        case "Q": return __designTimeString("#6901_15", fallback: "Queen")
        case "J": return __designTimeString("#6901_16", fallback: "Jack")
        default: return value
        }
    }
    
    private func loadCardImage() -> UIImage? {
        let imageName = card.imageName
        
        if let image = UIImage(named: imageName) {
            return image
        }
        
        if let image = UIImage(named: "Resources/Images/\(imageName)") {
            return image
        }
        
        if let path = Bundle.main.path(forResource: imageName, ofType: __designTimeString("#6901_17", fallback: "png"), inDirectory: __designTimeString("#6901_18", fallback: "Resources/Images")),
           let image = UIImage(contentsOfFile: path) {
            return image
        }
        
        if let path = Bundle.main.path(forResource: imageName, ofType: __designTimeString("#6901_19", fallback: "png")),
           let image = UIImage(contentsOfFile: path) {
            return image
        }
        
        return nil
    }
    
    private var textBasedCardView: some View {
        ZStack {
            RoundedRectangle(cornerRadius: __designTimeInteger("#6901_20", fallback: 12))
                .fill(Color.white)
                .shadow(color: .black.opacity(__designTimeFloat("#6901_21", fallback: 0.15)), radius: __designTimeInteger("#6901_22", fallback: 3), x: __designTimeInteger("#6901_23", fallback: 0), y: __designTimeInteger("#6901_24", fallback: 2))
            
            VStack {
                HStack {
                    Text(card.value)
                        .dynamicType(baseSize: size.fontSize, textStyle: .headline)
                        
                        .foregroundColor(card.isRed ? .red : .black)
                    Spacer()
                }
                
                Spacer()
                
                Text(card.suitSymbol)
                    .font(.system(size: size.suitSize))
                    .foregroundColor(card.isRed ? .red : .black)
                    
                    .accessibilityHidden(__designTimeBoolean("#6901_25", fallback: true))
                
                Spacer()
                
                HStack {
                    Spacer()
                    Text(card.value)
                        .dynamicType(baseSize: size.fontSize, textStyle: .headline)
                        
                        .foregroundColor(card.isRed ? .red : .black)
                        .rotationEffect(.degrees(__designTimeInteger("#6901_26", fallback: 180)))
                        .accessibilityHidden(__designTimeBoolean("#6901_27", fallback: true)) 
                }
            }
            .padding(__designTimeInteger("#6901_28", fallback: 8))
        }
        .frame(width: scaledWidth, height: scaledHeight)
        .accessibilityLabel(cardAccessibilityLabel)
        .accessibilityAddTraits(.isImage)
    }
}

extension PlayingCardView.CardSize {
    var fontSize: CGFloat {
        switch self {
        case .small: return __designTimeInteger("#6901_29", fallback: 12)
        case .medium: return __designTimeInteger("#6901_30", fallback: 16)
        case .large: return __designTimeInteger("#6901_31", fallback: 20)
        }
    }
    
    var suitSize: CGFloat {
        switch self {
        case .small: return __designTimeInteger("#6901_32", fallback: 32)
        case .medium: return __designTimeInteger("#6901_33", fallback: 48)
        case .large: return __designTimeInteger("#6901_34", fallback: 64)
        }
    }
}

struct CardDetailView: View {
    let card: Card
    let showDescription: Bool
    @Environment(\.sizeCategory) var sizeCategory
    
    var body: some View {
        VStack(spacing: __designTimeInteger("#6901_35", fallback: 16)) {
            if let def = getCardDefinition(by: card.id) {
                Text("THE \(def.name)")
                    .dynamicType(baseSize: __designTimeInteger("#6901_36", fallback: 36), textStyle: .largeTitle)
                    
                    .foregroundColor(.black)
                    .multilineTextAlignment(.center)
                    .minimumScaleFactor(__designTimeFloat("#6901_37", fallback: 0.7))
                    .accessibilityAddTraits(.isHeader)
            } else {
                Text(card.name)
                    .dynamicType(baseSize: __designTimeInteger("#6901_38", fallback: 36), textStyle: .largeTitle)
                    
                    .foregroundColor(.black)
                    .multilineTextAlignment(.center)
                    .minimumScaleFactor(__designTimeFloat("#6901_39", fallback: 0.7))
                    .accessibilityAddTraits(.isHeader)
            }
            
            if let def = getCardDefinition(by: card.id) {
                Text(def.title)
                    .dynamicType(baseSize: __designTimeInteger("#6901_40", fallback: 20), textStyle: .title3)
                    
                    .italic()
                    .foregroundColor(.black)
                    .multilineTextAlignment(.center)
            }
            
            PlayingCardView(card: card, size: .large)
                .accessibilityLabel("\(card.value) of \(card.suit.rawValue)")
            
            if showDescription {
                ScrollView {
                    Text(card.description)
                        .dynamicType(baseSize: __designTimeInteger("#6901_41", fallback: 18), textStyle: .body)
                        
                        .foregroundColor(.black)
                        .multilineTextAlignment(.leading)
                        .padding(.horizontal)
                        .fixedSize(horizontal: __designTimeBoolean("#6901_42", fallback: false), vertical: __designTimeBoolean("#6901_43", fallback: true))
                }
                .accessibilityElement(children: .combine)
            }
        }
        .accessibilityElement(children: .contain)
    }
}

struct KarmaCardRow: View {
    let cards: [Card]
    let description: String
    @Environment(\.sizeCategory) var sizeCategory
    
    var body: some View {
        VStack(spacing: __designTimeInteger("#6901_44", fallback: 12)) {
            LazyVGrid(columns: adaptiveColumns, spacing: __designTimeInteger("#6901_45", fallback: 10)) {
                ForEach(cards) { (card: Card) in
                    VStack(spacing: __designTimeInteger("#6901_46", fallback: 8)) {
                        PlayingCardView(card: card, size: .small)
                            .accessibleCard(card)
                        
                        Text(card.name)
                            .dynamicType(baseSize: __designTimeInteger("#6901_47", fallback: 18), textStyle: .caption1)
                            .foregroundColor(.black)
                            
                            .multilineTextAlignment(.center)
                            .minimumScaleFactor(__designTimeFloat("#6901_48", fallback: 0.8))
                    }
                    .accessibilityElement(children: .combine)
                    .accessibilityLabel("\(card.value) of \(card.suit.rawValue), \(card.name)")
                }
            }
            
            Text(description)
                .dynamicType(baseSize: __designTimeInteger("#6901_49", fallback: 18), textStyle: .body)
                
                .italic()
                .foregroundColor(.black)
                .multilineTextAlignment(.leading)
                .padding(.horizontal)
                .fixedSize(horizontal: __designTimeBoolean("#6901_50", fallback: false), vertical: __designTimeBoolean("#6901_51", fallback: true))
        }
        .accessibilityElement(children: .contain)
    }
    
    private var adaptiveColumns: [GridItem] {
        let minWidth: CGFloat = sizeCategory.isAccessibilityCategory ? __designTimeInteger("#6901_52", fallback: 120) : __designTimeInteger("#6901_53", fallback: 90)
        return Array(repeating: GridItem(.adaptive(minimum: minWidth)), count: __designTimeInteger("#6901_54", fallback: 1))
    }
}

#Preview {
    let sampleCard = Card(
        id: 1,
        name: "Ace of Hearts",
        value: "A",
        suit: .hearts,
        title: "The Card of Love",
        description: "Love is your ruling force."
    )
    
    VStack(spacing: __designTimeInteger("#6901_55", fallback: 20)) {
        PlayingCardView(card: sampleCard, size: .large)
        
        PlayingCardView(card: sampleCard, size: .medium)
        
        PlayingCardView(card: sampleCard, size: .small)
    }
    .padding()
}
