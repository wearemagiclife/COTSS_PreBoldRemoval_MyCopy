import SwiftUI
import UIKit
import LinkPresentation

struct ShareCardContent: Identifiable, Hashable {
    var id: UUID = .init()
    var title: String
    var subtitle: String
    var excerpt: String
    var date: Date
    var image: Image
    
    static func == (lhs: ShareCardContent, rhs: ShareCardContent) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

enum ShareCardExportSize: CaseIterable {
    case portrait1080x1350
    case square1200
    case story1080x1920
    
    var dimensions: CGSize {
        switch self {
        case .portrait1080x1350:
            return CGSize(width: 1080, height: 1350)
        case .square1200:
            return CGSize(width: 1200, height: 1200)
        case .story1080x1920:
            return CGSize(width: 1080, height: 1920)
        }
    }
    
    var aspectRatio: CGFloat {
        let size = dimensions
        return size.width / size.height
    }
}

struct SingleCardShareView: View {
    let card: Card
    let cardTitle: String
    let cardDescription: String
    let readingType: String // e.g., "Birth Card", "Yearly Card"
    let subtitle: String? // Optional subtitle like date or year

    private let inkColor = Color.black
    private let backgroundColor = Color(red: 0.86, green: 0.77, blue: 0.57)

    var body: some View {
        ZStack {
            backgroundColor
                .ignoresSafeArea()

            VStack(spacing: 20) {
                // Header
                VStack(spacing: 2) {
                    Text("\(readingType) Reading")
                        .font(.custom("Iowan Old Style", size: 38))
                        .fontWeight(.bold)
                        .foregroundColor(inkColor)

                    Text("by Cards of The Seven Sisters")
                        .font(.custom("Iowan Old Style", size: 22))
                        .fontWeight(.semibold)
                        .foregroundColor(inkColor.opacity(0.8))

                    if let subtitle = subtitle {
                        Text(subtitle)
                            .font(.custom("Iowan Old Style", size: 15))
                            .foregroundColor(inkColor.opacity(0.6))
                            .padding(.top, 2)
                    }
                }

                // Line design above card
                if let lineImage = UIImage(named: "linedesign") {
                    Image(uiImage: lineImage)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 160)
                        .padding(.vertical, 4)
                }

                // Card image
                VStack(spacing: 6) {
                    if let cardImage = ImageManager.shared.loadCardImage(for: card) {
                        Image(uiImage: cardImage)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 400)
                            .cornerRadius(16)
                            .shadow(color: .black.opacity(0.2), radius: 10, x: 0, y: 5)
                    }
                    Text(cardTitle)
                        .font(.custom("Iowan Old Style", size: 18))
                        .fontWeight(.semibold)
                        .foregroundColor(inkColor)
                }

                // Line design below card
                if let lineImage = UIImage(named: "linedesignd") {
                    Image(uiImage: lineImage)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 160)
                        .padding(.vertical, 4)
                }

                // Card description
                VStack(alignment: .leading, spacing: 8) {
                    Text(cardTitle.uppercased())
                        .font(.custom("Iowan Old Style", size: 32))
                        .fontWeight(.semibold)
                        .foregroundColor(inkColor)

                    Text(cardDescription)
                        .font(.custom("Iowan Old Style", size: 20))
                        .foregroundColor(inkColor)
                        .lineSpacing(4)
                        .fixedSize(horizontal: false, vertical: true)
                }
                .frame(maxWidth: 1000)
                .padding(.horizontal, 40)

                Spacer()

                // Footer with website URL and app promotion
                VStack(spacing: 8) {
                    Text("Find out what The Cards hold for you with a free personalized reading.")
                        .font(.custom("Iowan Old Style", size: 16))
                        .foregroundColor(inkColor.opacity(0.8))
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 40)

                    Text("sevensisters.cards")
                        .font(.custom("Iowan Old Style", size: 20))
                        .fontWeight(.semibold)
                        .foregroundColor(inkColor)
                }
                .padding(.bottom, 20)
            }
            .padding(40)
        }
        .frame(width: 1200, height: 1200)
    }
}

struct AstralCycleShareView: View {
    let cycleCard: Card
    let cycleCardTitle: String
    let cycleCardDescription: String
    let planetName: String
    let planetTitle: String
    let planetDescription: String
    let cycleInfo: String // e.g., "Mercury Phase - Jan 1 to Feb 21"

    private let inkColor = Color.black
    private let backgroundColor = Color(red: 0.86, green: 0.77, blue: 0.57)

    var body: some View {
        ZStack {
            backgroundColor
                .ignoresSafeArea()

            VStack(spacing: 14) {
                // Header
                VStack(spacing: 2) {
                    Text("Astral Cycle Reading")
                        .font(.custom("Iowan Old Style", size: 38))
                        .fontWeight(.bold)
                        .foregroundColor(inkColor)

                    Text("by Cards of The Seven Sisters")
                        .font(.custom("Iowan Old Style", size: 22))
                        .fontWeight(.semibold)
                        .foregroundColor(inkColor.opacity(0.8))

                    Text(cycleInfo)
                        .font(.custom("Iowan Old Style", size: 15))
                        .foregroundColor(inkColor.opacity(0.6))
                        .padding(.top, 2)
                }

                // Line design above cards
                if let lineImage = UIImage(named: "linedesign") {
                    Image(uiImage: lineImage)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 160)
                        .padding(.vertical, 4)
                }

                // Card images side by side
                HStack(spacing: 20) {
                    VStack(spacing: 6) {
                        if let cardImage = ImageManager.shared.loadCardImage(for: cycleCard) {
                            Image(uiImage: cardImage)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 300)
                                .cornerRadius(12)
                                .shadow(color: .black.opacity(0.2), radius: 8, x: 0, y: 4)
                        }
                        VStack(spacing: 2) {
                            Text(cycleCardTitle)
                                .font(.custom("Iowan Old Style", size: 16))
                                .fontWeight(.semibold)
                                .foregroundColor(inkColor)
                            Text("Cycle Card")
                                .font(.custom("Iowan Old Style", size: 14))
                                .foregroundColor(inkColor.opacity(0.6))
                        }
                    }

                    VStack(spacing: 6) {
                        if let planetImage = ImageManager.shared.loadPlanetImage(for: planetName) {
                            Image(uiImage: planetImage)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 300)
                                .cornerRadius(12)
                                .shadow(color: .black.opacity(0.2), radius: 8, x: 0, y: 4)
                        }
                        VStack(spacing: 2) {
                            Text(planetName.uppercased())
                                .font(.custom("Iowan Old Style", size: 16))
                                .fontWeight(.semibold)
                                .foregroundColor(inkColor)
                            Text("Planetary Phase")
                                .font(.custom("Iowan Old Style", size: 14))
                                .foregroundColor(inkColor.opacity(0.6))
                        }
                    }
                }

                // Line design below cards
                if let lineImage = UIImage(named: "linedesignd") {
                    Image(uiImage: lineImage)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 160)
                        .padding(.vertical, 4)
                }

                // Cycle card section
                VStack(alignment: .leading, spacing: 8) {
                    Text(cycleCardTitle.uppercased())
                        .font(.custom("Iowan Old Style", size: 28))
                        .fontWeight(.semibold)
                        .foregroundColor(inkColor)

                    Text(cycleCardDescription)
                        .font(.custom("Iowan Old Style", size: 18))
                        .foregroundColor(inkColor)
                        .lineSpacing(3)
                        .fixedSize(horizontal: false, vertical: true)
                }
                .frame(maxWidth: 950)
                .padding(.horizontal, 30)

                // Planetary phase section
                VStack(alignment: .leading, spacing: 8) {
                    Text(planetTitle.uppercased())
                        .font(.custom("Iowan Old Style", size: 28))
                        .fontWeight(.semibold)
                        .foregroundColor(inkColor)

                    Text(planetDescription)
                        .font(.custom("Iowan Old Style", size: 18))
                        .foregroundColor(inkColor)
                        .lineSpacing(3)
                        .fixedSize(horizontal: false, vertical: true)
                }
                .frame(maxWidth: 950)
                .padding(.horizontal, 30)

                Spacer()

                // Footer with website URL and app promotion
                VStack(spacing: 8) {
                    Text("Find out what The Cards hold for you with a free personalized reading.")
                        .font(.custom("Iowan Old Style", size: 16))
                        .foregroundColor(inkColor.opacity(0.8))
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 40)

                    Text("sevensisters.cards")
                        .font(.custom("Iowan Old Style", size: 20))
                        .fontWeight(.semibold)
                        .foregroundColor(inkColor)
                }
                .padding(.bottom, 20)
            }
            .padding(40)
        }
        .frame(width: 1200, height: 1200)
    }
}

struct BirthCardWithKarmaShareView: View {
    let birthCard: Card
    let birthCardTitle: String
    let birthCardDescription: String
    let karmaCard: Card
    let karmaCardTitle: String
    let karmaCardDescription: String
    let birthDate: Date
    let userName: String          // 👈 NEW

    private var headingText: String {
        let trimmed = userName.trimmingCharacters(in: .whitespacesAndNewlines)
        if trimmed.isEmpty {
            return "Your Life Spread"
        }
        // simple possessive handling
        if trimmed.lowercased().hasSuffix("s") {
            return "\(trimmed)’ Life Spread"
        } else {
            return "\(trimmed)’s Life Spread"
        }
    }

    private let inkColor = Color.black
    private let backgroundColor = Color(red: 0.86, green: 0.77, blue: 0.57)

    var body: some View {
        ZStack {
            backgroundColor
                .ignoresSafeArea()

            VStack(spacing: 16) {
                // Header
                // Header
                VStack(spacing: 6) {
                    Text(headingText)
                        .font(.custom("Iowan Old Style", size: 40))
                        .fontWeight(.bold)
                        .foregroundColor(inkColor)

                    Text("Find yours at sevensisters.cards")
                        .font(.custom("Iowan Old Style", size: 24))
                        .foregroundColor(inkColor.opacity(0.8))

                    Text(formatDate(birthDate))
                        .font(.custom("Iowan Old Style", size: 26))
                        .foregroundColor(inkColor.opacity(0.6))
                        .padding(.top, 2)
                }
                .padding(.bottom, 12)

                // Line design above cards
                if let lineImage = UIImage(named: "linedesign") {
                    Image(uiImage: lineImage)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 200)
                        .padding(.vertical, 8)
                }

                // Birth Card and description side by side
                HStack(alignment: .top, spacing: 15) {
                    // Birth Card image container - shifted 25% to the right
                    HStack {
                        Spacer()
                            .frame(width: 112.5) // 25% of 450

                        if let cardImage = ImageManager.shared.loadCardImage(for: birthCard) {
                            Image(uiImage: cardImage)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 450)
                                .shadow(color: .black.opacity(0.2), radius: 10, x: 0, y: 5)
                        }
                    }
                    .frame(width: 562.5, alignment: .leading) // 450 + 112.5

                    // Birth card description to the right
                    VStack(alignment: .leading, spacing: 8) {
                        Text(birthCardTitle.uppercased())
                            .font(.custom("Iowan Old Style", size: 35))
                            .fontWeight(.bold)
                            .foregroundColor(inkColor)

                        Text(truncateDescription(birthCardDescription, maxLength: 280))
                            .font(.custom("Iowan Old Style", size: 30))
                            .foregroundColor(inkColor)
                            .lineSpacing(4)
                            .multilineTextAlignment(.leading)
                            .fixedSize(horizontal: false, vertical: true)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding(.horizontal, 40)

                // Karma Card and description side by side
                HStack(alignment: .top, spacing: 15) {
                    // Karma Card image container - aligned with birth card
                    HStack {
                        Spacer()
                            .frame(width: 112.5) // Same offset as birth card

                        if let cardImage = ImageManager.shared.loadCardImage(for: karmaCard) {
                            Image(uiImage: cardImage)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 450)
                                .shadow(color: .black.opacity(0.2), radius: 8, x: 0, y: 4)
                        }

                    }

                    // Karma card description to the right
                    VStack(alignment: .leading, spacing: 8) {
                        Text("KARMA CARD")
                            .font(.custom("Iowan Old Style", size: 32))
                            .fontWeight(.bold)
                            .foregroundColor(inkColor)

                        Text(truncateDescription(karmaCardDescription, maxLength: 280))
                            .font(.custom("Iowan Old Style", size: 20))
                            .foregroundColor(inkColor)
                            .lineSpacing(4)
                            .multilineTextAlignment(.leading)
                            .fixedSize(horizontal: false, vertical: true)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding(.horizontal, 40)
                .padding(.top, 16)

                // Line design below cards
                if let lineImage = UIImage(named: "linedesignd") {
                    Image(uiImage: lineImage)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 200)
                        .padding(.vertical, 8)
                }

                Spacer()

                // Footer with website URL and app promotion
                VStack(spacing: 10) {
                    Text("Get your free personalized reading")
                        .font(.custom("Iowan Old Style", size: 20))
                        .foregroundColor(inkColor.opacity(0.8))
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 50)

                    Text("sevensisters.cards")
                        .font(.custom("Iowan Old Style", size: 26))
                        .fontWeight(.bold)
                        .foregroundColor(inkColor)
                }
                .padding(.bottom, 24)
            }
            .padding(.horizontal, 30)
            .padding(.vertical, 40)
        }
        .frame(
            width: ShareCardExportSize.portrait1080x1350.dimensions.width,
            height: ShareCardExportSize.portrait1080x1350.dimensions.height
        )

    }

    private func truncateDescription(_ text: String, maxLength: Int) -> String {
        if text.count <= maxLength {
            return text
        }

        // Find the last sentence that fits within maxLength
        let truncated = String(text.prefix(maxLength))
        if let lastPeriod = truncated.lastIndex(of: ".") {
            return String(truncated[...lastPeriod])
        }

        // If no period found, truncate at last space and add ellipsis
        if let lastSpace = truncated.lastIndex(of: " ") {
            return String(truncated[..<lastSpace]) + "..."
        }

        return truncated + "..."
    }

    private func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .none
        return formatter.string(from: date)
    }
}

struct DailyCardShareView: View {
    let dailyCard: Card
    let dailyCardTitle: String
    let dailyCardDescription: String
    let planetName: String
    let planetTitle: String
    let planetDescription: String
    let date: Date

    private let inkColor = Color.black
    private let backgroundColor = Color(red: 0.86, green: 0.77, blue: 0.57)

    var body: some View {
        ZStack {
            backgroundColor
                .ignoresSafeArea()

            VStack(spacing: 14) {
                // Header
                VStack(spacing: 2) {
                    Text("Daily Card Reading")
                        .font(.custom("Iowan Old Style", size: 38))
                        .fontWeight(.bold)
                        .foregroundColor(inkColor)

                    Text("by Cards of The Seven Sisters")
                        .font(.custom("Iowan Old Style", size: 22))
                        .fontWeight(.semibold)
                        .foregroundColor(inkColor.opacity(0.8))

                    Text(formatDate(date))
                        .font(.custom("Iowan Old Style", size: 15))
                        .foregroundColor(inkColor.opacity(0.6))
                        .padding(.top, 2)
                }

                // Line design above cards (was linedesignd, now linedesign)
                if let lineImage = UIImage(named: "linedesign") {
                    Image(uiImage: lineImage)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 160)
                        .padding(.vertical, 4)
                }

                // Card images side by side - much larger
                HStack(spacing: 20) {
                    VStack(spacing: 6) {
                        if let cardImage = ImageManager.shared.loadCardImage(for: dailyCard) {
                            Image(uiImage: cardImage)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 300)
                                .cornerRadius(12)
                                .shadow(color: .black.opacity(0.2), radius: 8, x: 0, y: 4)
                        }
                        VStack(spacing: 2) {
                            Text(dailyCardTitle)
                                .font(.custom("Iowan Old Style", size: 16))
                                .fontWeight(.semibold)
                                .foregroundColor(inkColor)
                            Text("Daily Card")
                                .font(.custom("Iowan Old Style", size: 14))
                                .foregroundColor(inkColor.opacity(0.6))
                        }
                    }

                    VStack(spacing: 6) {
                        if let planetImage = ImageManager.shared.loadPlanetImage(for: planetName) {
                            Image(uiImage: planetImage)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 300)
                                .cornerRadius(12)
                                .shadow(color: .black.opacity(0.2), radius: 8, x: 0, y: 4)
                        }
                        VStack(spacing: 2) {
                            Text(planetName.uppercased())
                                .font(.custom("Iowan Old Style", size: 16))
                                .fontWeight(.semibold)
                                .foregroundColor(inkColor)
                            Text("Planetary Card")
                                .font(.custom("Iowan Old Style", size: 14))
                                .foregroundColor(inkColor.opacity(0.6))
                        }
                    }
                }

                // Line design below cards (was linedesign, now linedesignd)
                if let lineImage = UIImage(named: "linedesignd") {
                    Image(uiImage: lineImage)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 160)
                        .padding(.vertical, 4)
                }

                // Daily card section
                VStack(alignment: .leading, spacing: 8) {
                    Text(dailyCardTitle.uppercased())
                        .font(.custom("Iowan Old Style", size: 28))
                        .fontWeight(.semibold)
                        .foregroundColor(inkColor)

                    Text(dailyCardDescription)
                        .font(.custom("Iowan Old Style", size: 18))
                        .foregroundColor(inkColor)
                        .lineSpacing(3)
                        .fixedSize(horizontal: false, vertical: true)
                }
                .frame(maxWidth: 950)
                .padding(.horizontal, 30)

                // Planetary card section
                VStack(alignment: .leading, spacing: 8) {
                    Text(planetTitle.uppercased())
                        .font(.custom("Iowan Old Style", size: 28))
                        .fontWeight(.semibold)
                        .foregroundColor(inkColor)

                    Text(planetDescription)
                        .font(.custom("Iowan Old Style", size: 18))
                        .foregroundColor(inkColor)
                        .lineSpacing(3)
                        .fixedSize(horizontal: false, vertical: true)
                }
                .frame(maxWidth: 950)
                .padding(.horizontal, 30)

                Spacer()

                // Footer with website URL and app promotion
                VStack(spacing: 8) {
                    Text("Find out what The Cards hold for you with a free personalized reading.")
                        .font(.custom("Iowan Old Style", size: 16))
                        .foregroundColor(inkColor.opacity(0.8))
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 40)

                    Text("sevensisters.cards")
                        .font(.custom("Iowan Old Style", size: 20))
                        .fontWeight(.semibold)
                        .foregroundColor(inkColor)
                }
                .padding(.bottom, 20)
            }
            .padding(40)
        }
        .frame(width: 1200, height: 1200)
    }

    private func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .none
        return formatter.string(from: date)
    }
}

struct ShareCardView: View {
    let content: ShareCardContent
    let exportSize: ShareCardExportSize

    private let inkColor = Color.black
    private let backgroundColor = Color(red: 0.86, green: 0.77, blue: 0.57)

    init(content: ShareCardContent, exportSize: ShareCardExportSize = .portrait1080x1350) {
        self.content = content
        self.exportSize = exportSize
    }

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                RoundedRectangle(cornerRadius: 25)
                    .fill(backgroundColor)

                ScrollView {
                    VStack(spacing: 0) {
                        cardImageSection(in: geometry)
                        contentSection(in: geometry)
                        footerSection(in: geometry)
                    }
                    .padding(30)
                }
                .scrollIndicators(.hidden)
            }
        }
        .aspectRatio(exportSize.aspectRatio, contentMode: .fit)
    }
    
    private func cardImageSection(in geometry: GeometryProxy) -> some View {
        let availableWidth = max(200, geometry.size.width - 60)
        let imageHeight = max(200, min(availableWidth * 0.6, 300))
        let imageWidth = max(160, availableWidth * 0.7)
        
        return content.image
            .resizable()
            .aspectRatio(16/20, contentMode: .fit)
            .frame(width: imageWidth, height: imageHeight)
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .shadow(color: .black.opacity(0.3), radius: 10, x: 0, y: 5)
            .padding(.bottom, dynamicSpacing(base: 25, geometry: geometry))
    }
    
    private func contentSection(in geometry: GeometryProxy) -> some View {
        VStack(spacing: dynamicSpacing(base: 15, geometry: geometry)) {
            Text(content.title.uppercased())
                .font(titleFont(for: geometry))
                
                .foregroundColor(inkColor)
                .multilineTextAlignment(.center)
                .lineLimit(3)
                .minimumScaleFactor(0.7)
            
            Text(content.subtitle.lowercased())
                .font(subtitleFont(for: geometry))
                
                .foregroundColor(inkColor)
                .multilineTextAlignment(.center)
                .lineLimit(3)
                .minimumScaleFactor(0.8)
            
            Rectangle()
                .frame(width: 80, height: 1)
                .foregroundColor(inkColor.opacity(0.6))
                .padding(.vertical, dynamicSpacing(base: 8, geometry: geometry))
            
            Text(content.excerpt)
                .font(bodyFont(for: geometry))
                .foregroundColor(inkColor)
                
                .multilineTextAlignment(.leading)
                .lineSpacing(2)
                .lineLimit(nil)
                .minimumScaleFactor(0.8)
        }
        .padding(.horizontal, dynamicSpacing(base: 25, geometry: geometry))
    }
    
    private func footerSection(in geometry: GeometryProxy) -> some View {
        HStack {
            Text(formattedDate)
                .font(footerFont(for: geometry))
                .foregroundColor(inkColor.opacity(0.7))
            
            Spacer()
        }
        .padding(.top, dynamicSpacing(base: 30, geometry: geometry))
    }
    
    private func dynamicSpacing(base: CGFloat, geometry: GeometryProxy) -> CGFloat {
        let scale = min(geometry.size.width, geometry.size.height) / 500.0
        return base * max(0.8, min(1.8, scale))
    }
    
    private func titleFont(for geometry: GeometryProxy) -> Font {
        let baseSize: CGFloat = 32
        let scaledSize = baseSize * fontScale(for: geometry)
        return .custom("Iowan Old Style", size: scaledSize)
    }
    
    private func subtitleFont(for geometry: GeometryProxy) -> Font {
        let baseSize: CGFloat = 22
        let scaledSize = baseSize * fontScale(for: geometry)
        return .custom("Iowan Old Style", size: scaledSize)
    }
    
    private func bodyFont(for geometry: GeometryProxy) -> Font {
        let baseSize: CGFloat = 18
        let scaledSize = baseSize * fontScale(for: geometry)
        return .custom("Iowan Old Style", size: scaledSize)
    }
    
    private func footerFont(for geometry: GeometryProxy) -> Font {
        let baseSize: CGFloat = 14
        let scaledSize = baseSize * fontScale(for: geometry)
        return .custom("Iowan Old Style", size: scaledSize)
    }
    
    private func fontScale(for geometry: GeometryProxy) -> CGFloat {
        let scale = min(geometry.size.width, geometry.size.height) / 500.0
        return max(0.8, min(1.6, scale))
    }
    
    private var formattedDate: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter.string(from: content.date)
    }
}

enum ShareCardRenderer {
    static func renderPNG(content: ShareCardContent, size: ShareCardExportSize) async throws -> URL {
        return try await withCheckedThrowingContinuation { continuation in
            DispatchQueue.main.async {
                do {
                    let shareView = ShareCardView(content: content, exportSize: size)
                    let renderer = ImageRenderer(content: shareView)

                    renderer.proposedSize = .init(size.dimensions)
                    renderer.scale = 1.0

                    guard let uiImage = renderer.uiImage else {
                        continuation.resume(throwing: ShareCardError.renderingFailed)
                        return
                    }

                    let tempDirectory = FileManager.default.temporaryDirectory
                    let filename = "sharecard_\(content.id.uuidString).png"
                    let fileURL = tempDirectory.appendingPathComponent(filename)

                    guard let pngData = uiImage.pngData() else {
                        continuation.resume(throwing: ShareCardError.pngConversionFailed)
                        return
                    }

                    try pngData.write(to: fileURL)
                    continuation.resume(returning: fileURL)
                } catch {
                    continuation.resume(throwing: error)
                }
            }
        }
    }

    static func renderUIImage(content: ShareCardContent, size: ShareCardExportSize) async throws -> UIImage {
        return try await withCheckedThrowingContinuation { continuation in
            DispatchQueue.main.async {
                let shareView = ShareCardView(content: content, exportSize: size)
                let renderer = ImageRenderer(content: shareView)

                renderer.proposedSize = .init(size.dimensions)
                renderer.scale = 2.0

                guard let uiImage = renderer.uiImage else {
                    continuation.resume(throwing: ShareCardError.renderingFailed)
                    return
                }

                continuation.resume(returning: uiImage)
            }
        }
    }
}

enum ShareCardError: LocalizedError {
    case renderingFailed
    case pngConversionFailed
    
    var errorDescription: String? {
        switch self {
        case .renderingFailed:
            return "Failed to render share card"
        case .pngConversionFailed:
            return "Failed to convert to PNG"
        }
    }
}

// Custom activity item source to provide thumbnail for share sheet preview
class ShareCardActivityItemSource: NSObject, UIActivityItemSource {
    let image: UIImage
    let fileURL: URL
    let subject: String

    init(image: UIImage, fileURL: URL, subject: String) {
        self.image = image
        self.fileURL = fileURL
        self.subject = subject
        super.init()
    }

    func activityViewControllerPlaceholderItem(_ activityViewController: UIActivityViewController) -> Any {
        return fileURL
    }

    func activityViewController(_ activityViewController: UIActivityViewController, itemForActivityType activityType: UIActivity.ActivityType?) -> Any? {
        return fileURL
    }

    func activityViewController(_ activityViewController: UIActivityViewController, subjectForActivityType activityType: UIActivity.ActivityType?) -> String {
        return subject
    }

    func activityViewControllerLinkMetadata(_ activityViewController: UIActivityViewController) -> LPLinkMetadata? {
        let metadata = LPLinkMetadata()
        metadata.title = subject

        if let url = URL(string: "https://sevensisters.cards") {
            metadata.url = url
            metadata.originalURL = url
        }

        // Provide thumbnail for the preview
        metadata.imageProvider = NSItemProvider(object: image)
        metadata.iconProvider = NSItemProvider(object: image)

        return metadata
    }
}

struct DailyCardShareLink: View {
    let dailyCard: Card
    let dailyCardTitle: String
    let dailyCardDescription: String
    let planetName: String
    let planetTitle: String
    let planetDescription: String
    let date: Date
    let cardTypeName: String // e.g., "Daily Card", "Birth Card"

    @State private var isLoading = false
    @State private var isShowingShareSheet = false
    @State private var shareItems: [Any] = []
    @State private var errorMessage: String?

    var body: some View {
        Button(action: shareCard) {
            if isLoading {
                ProgressView()
                    .scaleEffect(0.8)
                    .progressViewStyle(CircularProgressViewStyle(tint: .black))
                    .frame(width: 44, height: 44)
            } else {
                if let shareIcon = UIImage(named: "share_icon") {
                    Image(uiImage: shareIcon)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 24, height: 24)
                        .foregroundColor(.black)
                        .frame(width: 44, height: 44)
                        .contentShape(Rectangle())
                } else {
                    Image(systemName: "square.and.arrow.up")
                        .font(.system(size: 20))
                        .foregroundColor(.black)
                        .frame(width: 44, height: 44)
                        .contentShape(Rectangle())
                }
            }
        }
        .disabled(isLoading)
        .accessibilityLabel("Share")
        .sheet(isPresented: $isShowingShareSheet) {
            if !shareItems.isEmpty {
                ShareSheetWrapper(activityItems: shareItems)
                    .ignoresSafeArea()
            }
        }
        .alert("Share Error", isPresented: .constant(errorMessage != nil)) {
            Button("OK") {
                errorMessage = nil
            }
        } message: {
            if let errorMessage = errorMessage {
                Text(errorMessage)
            }
        }
    }

    private func shareCard() {
        isLoading = true
        Task {
            do {
                let shareView = DailyCardShareView(
                    dailyCard: dailyCard,
                    dailyCardTitle: dailyCardTitle,
                    dailyCardDescription: dailyCardDescription,
                    planetName: planetName,
                    planetTitle: planetTitle,
                    planetDescription: planetDescription,
                    date: date
                )

                // Render to image with explicit size (square format)
                let renderer = ImageRenderer(content: shareView)
                renderer.proposedSize = ProposedViewSize(width: 1200, height: 1200)
                renderer.scale = 2.0

                guard let renderedImage = renderer.uiImage else {
                    throw ShareCardError.renderingFailed
                }

                // Remove alpha channel to avoid warning and save memory
                let imageWithoutAlpha = removeAlphaChannel(from: renderedImage)

                // Convert to JPEG and save to temp file for better preview support
                guard let imageData = imageWithoutAlpha.jpegData(compressionQuality: 0.9) else {
                    throw ShareCardError.pngConversionFailed
                }

                let tempDir = FileManager.default.temporaryDirectory
                // Create descriptive filename with spaces
                let fileName = "My \(cardTypeName) reading by Cards of The Seven Sisters.jpg"
                let fileURL = tempDir.appendingPathComponent(fileName)

                try imageData.write(to: fileURL)

                await MainActor.run {
                    // Create custom activity item source with thumbnail for preview
                    let activityItemSource = ShareCardActivityItemSource(
                        image: imageWithoutAlpha,
                        fileURL: fileURL,
                        subject: "My \(cardTypeName) reading by Cards of The Seven Sisters"
                    )

                    // Share only the image (URL and promotional text now embedded in image)
                    self.shareItems = [activityItemSource]
                    isLoading = false
                    isShowingShareSheet = true
                }
            } catch {
                await MainActor.run {
                    isLoading = false
                    errorMessage = error.localizedDescription
                }
            }
        }
    }

    private func removeAlphaChannel(from image: UIImage) -> UIImage {
        let format = UIGraphicsImageRendererFormat()
        format.opaque = true // This removes alpha channel
        format.scale = image.scale

        let renderer = UIGraphicsImageRenderer(size: image.size, format: format)
        return renderer.image { context in
            // Fill with white background (since we have a beige background, this won't matter)
            UIColor.white.setFill()
            context.fill(CGRect(origin: .zero, size: image.size))
            // Draw the image on top
            image.draw(at: .zero)
        }
    }
}

struct BirthCardWithKarmaShareLink: View {
    let birthCard: Card
    let birthCardTitle: String
    let birthCardDescription: String
    let karmaCard: Card
    let karmaCardTitle: String
    let karmaCardDescription: String
    let birthDate: Date
    let userName: String

    @State private var isLoading = false
    @State private var isShowingShareSheet = false
    @State private var shareItems: [Any] = []
    @State private var errorMessage: String?

    var body: some View {
        Button(action: shareCard) {
            if isLoading {
                ProgressView()
                    .scaleEffect(0.8)
                    .progressViewStyle(CircularProgressViewStyle(tint: .black))
                    .frame(width: 44, height: 44)
            } else {
                if let shareIcon = UIImage(named: "share_icon") {
                    Image(uiImage: shareIcon)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 24, height: 24)
                        .foregroundColor(.black)
                        .frame(width: 44, height: 44)
                        .contentShape(Rectangle())
                } else {
                    Image(systemName: "square.and.arrow.up")
                        .font(.system(size: 20))
                        .foregroundColor(.black)
                        .frame(width: 44, height: 44)
                        .contentShape(Rectangle())
                }
            }
        }
        .disabled(isLoading)
        .accessibilityLabel("Share")
        .sheet(isPresented: $isShowingShareSheet) {
            if !shareItems.isEmpty {
                ShareSheetWrapper(activityItems: shareItems)
                    .ignoresSafeArea()
            }
        }
        .alert("Share Error", isPresented: .constant(errorMessage != nil)) {
            Button("OK") {
                errorMessage = nil
            }
        } message: {
            if let errorMessage = errorMessage {
                Text(errorMessage)
            }
        }
    }

    private func shareCard() {
        isLoading = true

        Task {
            do {
                // Keep your behavior: make sure descriptions JSON is loaded,
                // but now we trust the descriptions passed in from BirthCardView.
                await MainActor.run {
                    DescriptionRepository.shared.ensureLoaded()
                }

                // Build the portrait share view using the already-computed descriptions
                let shareView = BirthCardWithKarmaShareView(
                    birthCard: birthCard,
                    birthCardTitle: birthCardTitle,
                    birthCardDescription: birthCardDescription,
                    karmaCard: karmaCard,
                    karmaCardTitle: karmaCardTitle,
                    karmaCardDescription: karmaCardDescription,
                    birthDate: birthDate,
                    userName: userName
                )

                // 🔹 Portrait 1080×1350 instead of square 1200×1200
                let size = ShareCardExportSize.portrait1080x1350.dimensions
                let renderer = ImageRenderer(content: shareView)
                renderer.proposedSize = ProposedViewSize(width: size.width, height: size.height)
                renderer.scale = 2.0

                guard let renderedImage = renderer.uiImage else {
                    throw ShareCardError.renderingFailed
                }

                // Strip alpha, like you already do, to keep iOS happy
                let imageWithoutAlpha = removeAlphaChannel(from: renderedImage)

                guard let imageData = imageWithoutAlpha.jpegData(compressionQuality: 0.9) else {
                    throw ShareCardError.pngConversionFailed
                }

                let tempDir = FileManager.default.temporaryDirectory
                let fileName = "My Birth Card reading by Cards of The Seven Sisters.jpg"
                let fileURL = tempDir.appendingPathComponent(fileName)

                try imageData.write(to: fileURL)

                await MainActor.run {
                    let activityItemSource = ShareCardActivityItemSource(
                        image: imageWithoutAlpha,
                        fileURL: fileURL,
                        subject: "My Birth Card reading by Cards of The Seven Sisters"
                    )

                    self.shareItems = [activityItemSource]
                    isLoading = false
                    isShowingShareSheet = true
                }
            } catch {
                await MainActor.run {
                    isLoading = false
                    errorMessage = error.localizedDescription
                }
            }
        }
    }


    private func removeAlphaChannel(from image: UIImage) -> UIImage {
        let format = UIGraphicsImageRendererFormat()
        format.opaque = true // This removes alpha channel
        format.scale = image.scale

        let renderer = UIGraphicsImageRenderer(size: image.size, format: format)
        return renderer.image { context in
            // Fill with white background (since we have a beige background, this won't matter)
            UIColor.white.setFill()
            context.fill(CGRect(origin: .zero, size: image.size))
            // Draw the image on top
            image.draw(at: .zero)
        }
    }
}

struct AstralCycleShareLink: View {
    let cycleCard: Card
    let cycleCardTitle: String
    let cycleCardDescription: String
    let planetName: String
    let planetTitle: String
    let planetDescription: String
    let cycleInfo: String // e.g., "Mercury Phase - Jan 1 to Feb 21"

    @State private var isLoading = false
    @State private var isShowingShareSheet = false
    @State private var shareItems: [Any] = []
    @State private var errorMessage: String?

    var body: some View {
        Button(action: shareCard) {
            if isLoading {
                ProgressView()
                    .scaleEffect(0.8)
                    .progressViewStyle(CircularProgressViewStyle(tint: .black))
                    .frame(width: 44, height: 44)
            } else {
                if let shareIcon = UIImage(named: "share_icon") {
                    Image(uiImage: shareIcon)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 24, height: 24)
                        .foregroundColor(.black)
                        .frame(width: 44, height: 44)
                        .contentShape(Rectangle())
                } else {
                    Image(systemName: "square.and.arrow.up")
                        .font(.system(size: 20))
                        .foregroundColor(.black)
                        .frame(width: 44, height: 44)
                        .contentShape(Rectangle())
                }
            }
        }
        .disabled(isLoading)
        .accessibilityLabel("Share")
        .sheet(isPresented: $isShowingShareSheet) {
            if !shareItems.isEmpty {
                ShareSheetWrapper(activityItems: shareItems)
                    .ignoresSafeArea()
            }
        }
        .alert("Share Error", isPresented: .constant(errorMessage != nil)) {
            Button("OK") {
                errorMessage = nil
            }
        } message: {
            if let errorMessage = errorMessage {
                Text(errorMessage)
            }
        }
    }

    private func shareCard() {
        isLoading = true
        Task {
            do {
                let shareView = AstralCycleShareView(
                    cycleCard: cycleCard,
                    cycleCardTitle: cycleCardTitle,
                    cycleCardDescription: cycleCardDescription,
                    planetName: planetName,
                    planetTitle: planetTitle,
                    planetDescription: planetDescription,
                    cycleInfo: cycleInfo
                )

                // Render to image with explicit size (square format)
                let renderer = ImageRenderer(content: shareView)
                renderer.proposedSize = ProposedViewSize(width: 1200, height: 1200)
                renderer.scale = 2.0

                guard let renderedImage = renderer.uiImage else {
                    throw ShareCardError.renderingFailed
                }

                // Remove alpha channel to avoid warning and save memory
                let imageWithoutAlpha = removeAlphaChannel(from: renderedImage)

                // Convert to JPEG and save to temp file for better preview support
                guard let imageData = imageWithoutAlpha.jpegData(compressionQuality: 0.9) else {
                    throw ShareCardError.pngConversionFailed
                }

                let tempDir = FileManager.default.temporaryDirectory
                // Create descriptive filename with spaces
                let fileName = "My Astral Cycle reading by Cards of The Seven Sisters.jpg"
                let fileURL = tempDir.appendingPathComponent(fileName)

                try imageData.write(to: fileURL)

                await MainActor.run {
                    // Create custom activity item source with thumbnail for preview
                    let activityItemSource = ShareCardActivityItemSource(
                        image: imageWithoutAlpha,
                        fileURL: fileURL,
                        subject: "My Astral Cycle reading by Cards of The Seven Sisters"
                    )

                    // Share only the image (URL and promotional text now embedded in image)
                    self.shareItems = [activityItemSource]
                    isLoading = false
                    isShowingShareSheet = true
                }
            } catch {
                await MainActor.run {
                    isLoading = false
                    errorMessage = error.localizedDescription
                }
            }
        }
    }

    private func removeAlphaChannel(from image: UIImage) -> UIImage {
        let format = UIGraphicsImageRendererFormat()
        format.opaque = true // This removes alpha channel
        format.scale = image.scale

        let renderer = UIGraphicsImageRenderer(size: image.size, format: format)
        return renderer.image { context in
            // Fill with white background (since we have a beige background, this won't matter)
            UIColor.white.setFill()
            context.fill(CGRect(origin: .zero, size: image.size))
            // Draw the image on top
            image.draw(at: .zero)
        }
    }
}

struct SingleCardShareLink: View {
    let card: Card
    let cardTitle: String
    let cardDescription: String
    let readingType: String // e.g., "Birth Card", "Yearly Card"
    let subtitle: String? // Optional subtitle

    @State private var isLoading = false
    @State private var isShowingShareSheet = false
    @State private var shareItems: [Any] = []
    @State private var errorMessage: String?

    var body: some View {
        Button(action: shareCard) {
            if isLoading {
                ProgressView()
                    .scaleEffect(0.8)
                    .progressViewStyle(CircularProgressViewStyle(tint: .black))
                    .frame(width: 44, height: 44)
            } else {
                if let shareIcon = UIImage(named: "share_icon") {
                    Image(uiImage: shareIcon)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 24, height: 24)
                        .foregroundColor(.black)
                        .frame(width: 44, height: 44)
                        .contentShape(Rectangle())
                } else {
                    Image(systemName: "square.and.arrow.up")
                        .font(.system(size: 20))
                        .foregroundColor(.black)
                        .frame(width: 44, height: 44)
                        .contentShape(Rectangle())
                }
            }
        }
        .disabled(isLoading)
        .accessibilityLabel("Share")
        .sheet(isPresented: $isShowingShareSheet) {
            if !shareItems.isEmpty {
                ShareSheetWrapper(activityItems: shareItems)
                    .ignoresSafeArea()
            }
        }
        .alert("Share Error", isPresented: .constant(errorMessage != nil)) {
            Button("OK") {
                errorMessage = nil
            }
        } message: {
            if let errorMessage = errorMessage {
                Text(errorMessage)
            }
        }
    }

    private func shareCard() {
        isLoading = true
        Task {
            do {
                let shareView = SingleCardShareView(
                    card: card,
                    cardTitle: cardTitle,
                    cardDescription: cardDescription,
                    readingType: readingType,
                    subtitle: subtitle
                )

                // Render to image with explicit size (square format)
                let renderer = ImageRenderer(content: shareView)
                renderer.proposedSize = ProposedViewSize(width: 1200, height: 1200)
                renderer.scale = 2.0

                guard let renderedImage = renderer.uiImage else {
                    throw ShareCardError.renderingFailed
                }

                // Remove alpha channel to avoid warning and save memory
                let imageWithoutAlpha = removeAlphaChannel(from: renderedImage)

                // Convert to JPEG and save to temp file for better preview support
                guard let imageData = imageWithoutAlpha.jpegData(compressionQuality: 0.9) else {
                    throw ShareCardError.pngConversionFailed
                }

                let tempDir = FileManager.default.temporaryDirectory
                // Create descriptive filename with spaces
                let fileName = "My \(readingType) reading by Cards of The Seven Sisters.jpg"
                let fileURL = tempDir.appendingPathComponent(fileName)

                try imageData.write(to: fileURL)

                await MainActor.run {
                    // Create custom activity item source with thumbnail for preview
                    let activityItemSource = ShareCardActivityItemSource(
                        image: imageWithoutAlpha,
                        fileURL: fileURL,
                        subject: "My \(readingType) reading by Cards of The Seven Sisters"
                    )

                    // Share only the image (URL and promotional text now embedded in image)
                    self.shareItems = [activityItemSource]
                    isLoading = false
                    isShowingShareSheet = true
                }
            } catch {
                await MainActor.run {
                    isLoading = false
                    errorMessage = error.localizedDescription
                }
            }
        }
    }

    private func removeAlphaChannel(from image: UIImage) -> UIImage {
        let format = UIGraphicsImageRendererFormat()
        format.opaque = true // This removes alpha channel
        format.scale = image.scale

        let renderer = UIGraphicsImageRenderer(size: image.size, format: format)
        return renderer.image { context in
            // Fill with white background (since we have a beige background, this won't matter)
            UIColor.white.setFill()
            context.fill(CGRect(origin: .zero, size: image.size))
            // Draw the image on top
            image.draw(at: .zero)
        }
    }
}

struct ShareCardShareLink: View {
    let content: ShareCardContent
    let size: ShareCardExportSize
    let additionalContent: ShareCardContent?

    @State private var isLoading = false
    @State private var errorMessage: String?

    init(content: ShareCardContent, size: ShareCardExportSize = .portrait1080x1350, additionalContent: ShareCardContent? = nil) {
        self.content = content
        self.size = size
        self.additionalContent = additionalContent
    }

    var body: some View {
        Button(action: shareCard) {
            if isLoading {
                ProgressView()
                    .scaleEffect(0.8)
                    .progressViewStyle(CircularProgressViewStyle(tint: .black))
                    .frame(width: 44, height: 44)
            } else {
                if let shareIcon = UIImage(named: "share_icon") {
                    Image(uiImage: shareIcon)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 24, height: 24)
                        .foregroundColor(.black)
                        .frame(width: 44, height: 44)
                        .contentShape(Rectangle())
                } else {
                    Image(systemName: "square.and.arrow.up")
                        .font(.system(size: 20))
                        .foregroundColor(.black)
                        .frame(width: 44, height: 44)
                        .contentShape(Rectangle())
                }
            }
        }
        .disabled(isLoading)
        .accessibilityLabel("Share")
        .alert("Share Error", isPresented: .constant(errorMessage != nil)) {
            Button("OK") {
                errorMessage = nil
            }
        } message: {
            if let errorMessage = errorMessage {
                Text(errorMessage)
            }
        }
    }

    private func shareCard() {
        isLoading = true
        Task {
            do {
                // Render the main image
                let image = try await ShareCardRenderer.renderUIImage(content: content, size: size)

                await MainActor.run {
                    isLoading = false
                    presentShareSheet(image: image)
                }
            } catch {
                await MainActor.run {
                    isLoading = false
                    errorMessage = error.localizedDescription
                }
            }
        }
    }

    private func presentShareSheet(image: UIImage) {
        let activityVC = UIActivityViewController(activityItems: [image], applicationActivities: nil)

        // Get the current window scene and present the share sheet
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let rootViewController = windowScene.windows.first?.rootViewController {

            // Find the topmost presented view controller
            var topController = rootViewController
            while let presented = topController.presentedViewController {
                topController = presented
            }

            // For iPad, set up popover presentation
            if let popover = activityVC.popoverPresentationController {
                popover.sourceView = topController.view
                popover.sourceRect = CGRect(x: topController.view.bounds.midX, y: topController.view.bounds.midY, width: 0, height: 0)
                popover.permittedArrowDirections = []
            }

            topController.present(activityVC, animated: true)
        }
    }
}

struct ShareSheetWrapper: UIViewControllerRepresentable {
    let activityItems: [Any]

    func makeUIViewController(context: Context) -> UIActivityViewController {
        let controller = UIActivityViewController(
            activityItems: activityItems,
            applicationActivities: nil
        )
        return controller
    }

    func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context) {
        // No updates needed
    }
}

struct ActivityViewController: UIViewControllerRepresentable {
    let activityItems: [Any]
    let applicationActivities: [UIActivity]? = nil
    let excludedActivityTypes: [UIActivity.ActivityType]? = []

    func makeUIViewController(context: Context) -> UIActivityViewController {
        let controller = UIActivityViewController(
            activityItems: activityItems,
            applicationActivities: applicationActivities
        )
        controller.excludedActivityTypes = excludedActivityTypes
        return controller
    }

    func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context) {
        // No updates needed
    }
}

struct ShareSheet: UIViewControllerRepresentable {
    let content: ShareCardContent
    let size: ShareCardExportSize
    let prerenderedImage: UIImage
    let prerenderedAdditionalImage: UIImage?
    let additionalContent: ShareCardContent?

    func makeUIViewController(context: Context) -> UIActivityViewController {
        let textContent = generateTextContent()

        // Build activity items with images first, then text
        var activityItems: [Any] = [prerenderedImage]

        // Add additional image if available
        if let additionalImage = prerenderedAdditionalImage {
            activityItems.append(additionalImage)
        }

        // Add text content last
        activityItems.append(textContent)

        let activityVC = UIActivityViewController(activityItems: activityItems, applicationActivities: nil)

        return activityVC
    }

    func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context) {}

    private func generateTextContent() -> String {
        var text = "\(content.title): \(content.subtitle)"
        text += " — \(DateFormatter.shortDate.string(from: content.date))\n\n"

        let excerptLimit = 200
        if content.excerpt.count > excerptLimit {
            let truncated = String(content.excerpt.prefix(excerptLimit))
            text += truncated + "..."
        } else {
            text += content.excerpt
        }

        // Add additional content if provided
        if let additionalContent = additionalContent {
            text += "\n\n---\n\n"
            text += "\(additionalContent.title): \(additionalContent.subtitle)\n\n"

            if additionalContent.excerpt.count > excerptLimit {
                let truncated = String(additionalContent.excerpt.prefix(excerptLimit))
                text += truncated + "..."
            } else {
                text += additionalContent.excerpt
            }
        }

        return text
    }
}

extension DateFormatter {
    static let shortDate: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter
    }()
}

extension ShareCardContent {
    static func fromModal(
        card: Card,
        cardType: CardType,
        contentType: DetailContentType?,
        date: Date = Date()
    ) -> ShareCardContent {
        
        var cardName = ""
        var cardTitle = ""
        var description = ""
        var image: Image = Image(systemName: "questionmark.card")
        
        if case .planetary(let planet) = contentType {
            let planetInfo = AppConstants.PlanetDescriptions.getDescription(for: planet)
            cardName = planet.uppercased()
            cardTitle = planetInfo.title
            description = planetInfo.description
            
            if let planetImage = ImageManager.shared.loadPlanetImage(for: planet) {
                image = Image(uiImage: planetImage)
            }
        } else {
            if let def = getCardDefinition(by: card.id) {
                cardName = def.name
                cardTitle = def.title
            }
            
            if let cardImage = ImageManager.shared.loadCardImage(for: card) {
                image = Image(uiImage: cardImage)
            }
            
            let repo = DescriptionRepository.shared
            let cardID = String(card.id)
            
            switch contentType {
            case .karma(let karmaDescription):
                description = karmaDescription
            default:
                switch cardType {
                case .daily:
                    description = repo.dailyDescriptions[cardID] ?? "No daily description available."
                case .birth:
                    description = repo.birthDescriptions[cardID] ?? "No birth description available."
                case .yearly:
                    description = repo.yearlyDescriptions[cardID] ?? "No yearly description available."
                case .fiftyTwoDay:
                    description = repo.fiftyTwoDescriptions[cardID] ?? "No 52-day description available."
                case .planetary:
                    description = "Error: Should be handled above"
                }
            }
        }
        
        return ShareCardContent(
            title: cardName,
            subtitle: cardTitle,
            excerpt: description,
            date: date,
            image: image
        )
    }
}
