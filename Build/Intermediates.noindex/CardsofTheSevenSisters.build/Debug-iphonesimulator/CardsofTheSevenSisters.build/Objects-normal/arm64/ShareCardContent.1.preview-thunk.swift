import func SwiftUI.__designTimeFloat
import func SwiftUI.__designTimeString
import func SwiftUI.__designTimeInteger
import func SwiftUI.__designTimeBoolean

#sourceLocation(file: "/Users/impriints/Downloads/COTSS_PreBoldRemoval_MyCopy/CardsofTheSevenSisters/Services/ShareCardContent.swift", line: 1)
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
            return CGSize(width: __designTimeInteger("#7554_0", fallback: 1080), height: __designTimeInteger("#7554_1", fallback: 1350))
        case .square1200:
            return CGSize(width: __designTimeInteger("#7554_2", fallback: 1200), height: __designTimeInteger("#7554_3", fallback: 1200))
        case .story1080x1920:
            return CGSize(width: __designTimeInteger("#7554_4", fallback: 1080), height: __designTimeInteger("#7554_5", fallback: 1920))
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

            VStack(spacing: __designTimeInteger("#7554_6", fallback: 20)) {
                // Header
                VStack(spacing: __designTimeInteger("#7554_7", fallback: 2)) {
                    Text("\(readingType) Reading")
                        .font(.custom(__designTimeString("#7554_8", fallback: "Iowan Old Style"), size: __designTimeInteger("#7554_9", fallback: 38)))
                        .fontWeight(.bold)
                        .foregroundColor(inkColor)

                    Text(__designTimeString("#7554_10", fallback: "by Cards of The Seven Sisters"))
                        .font(.custom(__designTimeString("#7554_11", fallback: "Iowan Old Style"), size: __designTimeInteger("#7554_12", fallback: 22)))
                        .fontWeight(.semibold)
                        .foregroundColor(inkColor.opacity(__designTimeFloat("#7554_13", fallback: 0.8)))

                    if let subtitle = subtitle {
                        Text(subtitle)
                            .font(.custom(__designTimeString("#7554_14", fallback: "Iowan Old Style"), size: __designTimeInteger("#7554_15", fallback: 15)))
                            .foregroundColor(inkColor.opacity(__designTimeFloat("#7554_16", fallback: 0.6)))
                            .padding(.top, __designTimeInteger("#7554_17", fallback: 2))
                    }
                }

                // Line design above card
                if let lineImage = UIImage(named: __designTimeString("#7554_18", fallback: "linedesign")) {
                    Image(uiImage: lineImage)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: __designTimeInteger("#7554_19", fallback: 160))
                        .padding(.vertical, __designTimeInteger("#7554_20", fallback: 4))
                }

                // Card image
                VStack(spacing: __designTimeInteger("#7554_21", fallback: 6)) {
                    if let cardImage = ImageManager.shared.loadCardImage(for: card) {
                        Image(uiImage: cardImage)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: __designTimeInteger("#7554_22", fallback: 400))
                            .cornerRadius(__designTimeInteger("#7554_23", fallback: 16))
                            .shadow(color: .black.opacity(__designTimeFloat("#7554_24", fallback: 0.2)), radius: __designTimeInteger("#7554_25", fallback: 10), x: __designTimeInteger("#7554_26", fallback: 0), y: __designTimeInteger("#7554_27", fallback: 5))
                    }
                    Text(cardTitle)
                        .font(.custom(__designTimeString("#7554_28", fallback: "Iowan Old Style"), size: __designTimeInteger("#7554_29", fallback: 18)))
                        .fontWeight(.semibold)
                        .foregroundColor(inkColor)
                }

                // Line design below card
                if let lineImage = UIImage(named: __designTimeString("#7554_30", fallback: "linedesignd")) {
                    Image(uiImage: lineImage)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: __designTimeInteger("#7554_31", fallback: 160))
                        .padding(.vertical, __designTimeInteger("#7554_32", fallback: 4))
                }

                // Card description
                VStack(alignment: .leading, spacing: __designTimeInteger("#7554_33", fallback: 8)) {
                    Text(cardTitle.uppercased())
                        .font(.custom(__designTimeString("#7554_34", fallback: "Iowan Old Style"), size: __designTimeInteger("#7554_35", fallback: 32)))
                        .fontWeight(.semibold)
                        .foregroundColor(inkColor)

                    Text(cardDescription)
                        .font(.custom(__designTimeString("#7554_36", fallback: "Iowan Old Style"), size: __designTimeInteger("#7554_37", fallback: 20)))
                        .foregroundColor(inkColor)
                        .lineSpacing(__designTimeInteger("#7554_38", fallback: 4))
                        .fixedSize(horizontal: __designTimeBoolean("#7554_39", fallback: false), vertical: __designTimeBoolean("#7554_40", fallback: true))
                }
                .frame(maxWidth: __designTimeInteger("#7554_41", fallback: 1000))
                .padding(.horizontal, __designTimeInteger("#7554_42", fallback: 40))

                Spacer()

                // Footer with website URL and app promotion
                VStack(spacing: __designTimeInteger("#7554_43", fallback: 8)) {
                    Text(__designTimeString("#7554_44", fallback: "Find out what The Cards hold for you with a free personalized reading."))
                        .font(.custom(__designTimeString("#7554_45", fallback: "Iowan Old Style"), size: __designTimeInteger("#7554_46", fallback: 16)))
                        .foregroundColor(inkColor.opacity(__designTimeFloat("#7554_47", fallback: 0.8)))
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, __designTimeInteger("#7554_48", fallback: 40))

                    Text(__designTimeString("#7554_49", fallback: "sevensisters.cards"))
                        .font(.custom(__designTimeString("#7554_50", fallback: "Iowan Old Style"), size: __designTimeInteger("#7554_51", fallback: 20)))
                        .fontWeight(.semibold)
                        .foregroundColor(inkColor)
                }
                .padding(.bottom, __designTimeInteger("#7554_52", fallback: 20))
            }
            .padding(__designTimeInteger("#7554_53", fallback: 40))
        }
        .frame(width: __designTimeInteger("#7554_54", fallback: 1200), height: __designTimeInteger("#7554_55", fallback: 1200))
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

            VStack(spacing: __designTimeInteger("#7554_56", fallback: 14)) {
                // Header
                VStack(spacing: __designTimeInteger("#7554_57", fallback: 2)) {
                    Text(__designTimeString("#7554_58", fallback: "Astral Cycle Reading"))
                        .font(.custom(__designTimeString("#7554_59", fallback: "Iowan Old Style"), size: __designTimeInteger("#7554_60", fallback: 38)))
                        .fontWeight(.bold)
                        .foregroundColor(inkColor)

                    Text(__designTimeString("#7554_61", fallback: "by Cards of The Seven Sisters"))
                        .font(.custom(__designTimeString("#7554_62", fallback: "Iowan Old Style"), size: __designTimeInteger("#7554_63", fallback: 22)))
                        .fontWeight(.semibold)
                        .foregroundColor(inkColor.opacity(__designTimeFloat("#7554_64", fallback: 0.8)))

                    Text(cycleInfo)
                        .font(.custom(__designTimeString("#7554_65", fallback: "Iowan Old Style"), size: __designTimeInteger("#7554_66", fallback: 15)))
                        .foregroundColor(inkColor.opacity(__designTimeFloat("#7554_67", fallback: 0.6)))
                        .padding(.top, __designTimeInteger("#7554_68", fallback: 2))
                }

                // Line design above cards
                if let lineImage = UIImage(named: __designTimeString("#7554_69", fallback: "linedesign")) {
                    Image(uiImage: lineImage)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: __designTimeInteger("#7554_70", fallback: 160))
                        .padding(.vertical, __designTimeInteger("#7554_71", fallback: 4))
                }

                // Card images side by side
                HStack(spacing: __designTimeInteger("#7554_72", fallback: 20)) {
                    VStack(spacing: __designTimeInteger("#7554_73", fallback: 6)) {
                        if let cardImage = ImageManager.shared.loadCardImage(for: cycleCard) {
                            Image(uiImage: cardImage)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: __designTimeInteger("#7554_74", fallback: 300))
                                .cornerRadius(__designTimeInteger("#7554_75", fallback: 12))
                                .shadow(color: .black.opacity(__designTimeFloat("#7554_76", fallback: 0.2)), radius: __designTimeInteger("#7554_77", fallback: 8), x: __designTimeInteger("#7554_78", fallback: 0), y: __designTimeInteger("#7554_79", fallback: 4))
                        }
                        VStack(spacing: __designTimeInteger("#7554_80", fallback: 2)) {
                            Text(cycleCardTitle)
                                .font(.custom(__designTimeString("#7554_81", fallback: "Iowan Old Style"), size: __designTimeInteger("#7554_82", fallback: 16)))
                                .fontWeight(.semibold)
                                .foregroundColor(inkColor)
                            Text(__designTimeString("#7554_83", fallback: "Cycle Card"))
                                .font(.custom(__designTimeString("#7554_84", fallback: "Iowan Old Style"), size: __designTimeInteger("#7554_85", fallback: 14)))
                                .foregroundColor(inkColor.opacity(__designTimeFloat("#7554_86", fallback: 0.6)))
                        }
                    }

                    VStack(spacing: __designTimeInteger("#7554_87", fallback: 6)) {
                        if let planetImage = ImageManager.shared.loadPlanetImage(for: planetName) {
                            Image(uiImage: planetImage)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: __designTimeInteger("#7554_88", fallback: 300))
                                .cornerRadius(__designTimeInteger("#7554_89", fallback: 12))
                                .shadow(color: .black.opacity(__designTimeFloat("#7554_90", fallback: 0.2)), radius: __designTimeInteger("#7554_91", fallback: 8), x: __designTimeInteger("#7554_92", fallback: 0), y: __designTimeInteger("#7554_93", fallback: 4))
                        }
                        VStack(spacing: __designTimeInteger("#7554_94", fallback: 2)) {
                            Text(planetName.uppercased())
                                .font(.custom(__designTimeString("#7554_95", fallback: "Iowan Old Style"), size: __designTimeInteger("#7554_96", fallback: 16)))
                                .fontWeight(.semibold)
                                .foregroundColor(inkColor)
                            Text(__designTimeString("#7554_97", fallback: "Planetary Phase"))
                                .font(.custom(__designTimeString("#7554_98", fallback: "Iowan Old Style"), size: __designTimeInteger("#7554_99", fallback: 14)))
                                .foregroundColor(inkColor.opacity(__designTimeFloat("#7554_100", fallback: 0.6)))
                        }
                    }
                }

                // Line design below cards
                if let lineImage = UIImage(named: __designTimeString("#7554_101", fallback: "linedesignd")) {
                    Image(uiImage: lineImage)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: __designTimeInteger("#7554_102", fallback: 160))
                        .padding(.vertical, __designTimeInteger("#7554_103", fallback: 4))
                }

                // Cycle card section
                VStack(alignment: .leading, spacing: __designTimeInteger("#7554_104", fallback: 8)) {
                    Text(cycleCardTitle.uppercased())
                        .font(.custom(__designTimeString("#7554_105", fallback: "Iowan Old Style"), size: __designTimeInteger("#7554_106", fallback: 28)))
                        .fontWeight(.semibold)
                        .foregroundColor(inkColor)

                    Text(cycleCardDescription)
                        .font(.custom(__designTimeString("#7554_107", fallback: "Iowan Old Style"), size: __designTimeInteger("#7554_108", fallback: 18)))
                        .foregroundColor(inkColor)
                        .lineSpacing(__designTimeInteger("#7554_109", fallback: 3))
                        .fixedSize(horizontal: __designTimeBoolean("#7554_110", fallback: false), vertical: __designTimeBoolean("#7554_111", fallback: true))
                }
                .frame(maxWidth: __designTimeInteger("#7554_112", fallback: 950))
                .padding(.horizontal, __designTimeInteger("#7554_113", fallback: 30))

                // Planetary phase section
                VStack(alignment: .leading, spacing: __designTimeInteger("#7554_114", fallback: 8)) {
                    Text(planetTitle.uppercased())
                        .font(.custom(__designTimeString("#7554_115", fallback: "Iowan Old Style"), size: __designTimeInteger("#7554_116", fallback: 28)))
                        .fontWeight(.semibold)
                        .foregroundColor(inkColor)

                    Text(planetDescription)
                        .font(.custom(__designTimeString("#7554_117", fallback: "Iowan Old Style"), size: __designTimeInteger("#7554_118", fallback: 18)))
                        .foregroundColor(inkColor)
                        .lineSpacing(__designTimeInteger("#7554_119", fallback: 3))
                        .fixedSize(horizontal: __designTimeBoolean("#7554_120", fallback: false), vertical: __designTimeBoolean("#7554_121", fallback: true))
                }
                .frame(maxWidth: __designTimeInteger("#7554_122", fallback: 950))
                .padding(.horizontal, __designTimeInteger("#7554_123", fallback: 30))

                Spacer()

                // Footer with website URL and app promotion
                VStack(spacing: __designTimeInteger("#7554_124", fallback: 8)) {
                    Text(__designTimeString("#7554_125", fallback: "Find out what The Cards hold for you with a free personalized reading."))
                        .font(.custom(__designTimeString("#7554_126", fallback: "Iowan Old Style"), size: __designTimeInteger("#7554_127", fallback: 16)))
                        .foregroundColor(inkColor.opacity(__designTimeFloat("#7554_128", fallback: 0.8)))
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, __designTimeInteger("#7554_129", fallback: 40))

                    Text(__designTimeString("#7554_130", fallback: "sevensisters.cards"))
                        .font(.custom(__designTimeString("#7554_131", fallback: "Iowan Old Style"), size: __designTimeInteger("#7554_132", fallback: 20)))
                        .fontWeight(.semibold)
                        .foregroundColor(inkColor)
                }
                .padding(.bottom, __designTimeInteger("#7554_133", fallback: 20))
            }
            .padding(__designTimeInteger("#7554_134", fallback: 40))
        }
        .frame(width: __designTimeInteger("#7554_135", fallback: 1200), height: __designTimeInteger("#7554_136", fallback: 1200))
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
            return __designTimeString("#7554_137", fallback: "Your Life Spread")
        }
        // simple possessive handling
        if trimmed.lowercased().hasSuffix(__designTimeString("#7554_138", fallback: "s")) {
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

            VStack(spacing: __designTimeInteger("#7554_139", fallback: 16)) {
                // Header
                // Header
                VStack(spacing: __designTimeInteger("#7554_140", fallback: 6)) {
                    Text(headingText)
                        .font(.custom(__designTimeString("#7554_141", fallback: "Iowan Old Style"), size: __designTimeInteger("#7554_142", fallback: 40)))
                        .fontWeight(.bold)
                        .foregroundColor(inkColor)

                    Text(__designTimeString("#7554_143", fallback: "Find yours at sevensisters.cards"))
                        .font(.custom(__designTimeString("#7554_144", fallback: "Iowan Old Style"), size: __designTimeInteger("#7554_145", fallback: 24)))
                        .foregroundColor(inkColor.opacity(__designTimeFloat("#7554_146", fallback: 0.8)))

                    Text(formatDate(birthDate))
                        .font(.custom(__designTimeString("#7554_147", fallback: "Iowan Old Style"), size: __designTimeInteger("#7554_148", fallback: 26)))
                        .foregroundColor(inkColor.opacity(__designTimeFloat("#7554_149", fallback: 0.6)))
                        .padding(.top, __designTimeInteger("#7554_150", fallback: 2))
                }
                .padding(.bottom, __designTimeInteger("#7554_151", fallback: 12))

                // Line design above cards
                if let lineImage = UIImage(named: __designTimeString("#7554_152", fallback: "linedesign")) {
                    Image(uiImage: lineImage)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: __designTimeInteger("#7554_153", fallback: 200))
                        .padding(.vertical, __designTimeInteger("#7554_154", fallback: 8))
                }

                // Birth Card and description side by side
                HStack(alignment: .top, spacing: __designTimeInteger("#7554_155", fallback: 15)) {
                    // Birth Card image container - shifted 25% to the right
                    HStack {
                        Spacer()
                            .frame(width: __designTimeFloat("#7554_156", fallback: 112.5)) // 25% of 450

                        if let cardImage = ImageManager.shared.loadCardImage(for: birthCard) {
                            Image(uiImage: cardImage)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: __designTimeInteger("#7554_157", fallback: 450))
                                .shadow(color: .black.opacity(__designTimeFloat("#7554_158", fallback: 0.2)), radius: __designTimeInteger("#7554_159", fallback: 10), x: __designTimeInteger("#7554_160", fallback: 0), y: __designTimeInteger("#7554_161", fallback: 5))
                        }
                    }
                    .frame(width: __designTimeFloat("#7554_162", fallback: 562.5), alignment: .leading) // 450 + 112.5

                    // Birth card description to the right
                    VStack(alignment: .leading, spacing: __designTimeInteger("#7554_163", fallback: 8)) {
                        Text(birthCardTitle.uppercased())
                            .font(.custom(__designTimeString("#7554_164", fallback: "Iowan Old Style"), size: __designTimeInteger("#7554_165", fallback: 35)))
                            .fontWeight(.bold)
                            .foregroundColor(inkColor)

                        Text(truncateDescription(birthCardDescription, maxLength: __designTimeInteger("#7554_166", fallback: 280)))
                            .font(.custom(__designTimeString("#7554_167", fallback: "Iowan Old Style"), size: __designTimeInteger("#7554_168", fallback: 30)))
                            .foregroundColor(inkColor)
                            .lineSpacing(__designTimeInteger("#7554_169", fallback: 4))
                            .multilineTextAlignment(.leading)
                            .fixedSize(horizontal: __designTimeBoolean("#7554_170", fallback: false), vertical: __designTimeBoolean("#7554_171", fallback: true))
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding(.horizontal, __designTimeInteger("#7554_172", fallback: 40))

                // Karma Card and description side by side
                HStack(alignment: .top, spacing: __designTimeInteger("#7554_173", fallback: 15)) {
                    // Karma Card image container - aligned with birth card
                    HStack {
                        Spacer()
                            .frame(width: __designTimeFloat("#7554_174", fallback: 112.5)) // Same offset as birth card

                        if let cardImage = ImageManager.shared.loadCardImage(for: karmaCard) {
                            Image(uiImage: cardImage)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: __designTimeInteger("#7554_175", fallback: 450))
                                .shadow(color: .black.opacity(__designTimeFloat("#7554_176", fallback: 0.2)), radius: __designTimeInteger("#7554_177", fallback: 8), x: __designTimeInteger("#7554_178", fallback: 0), y: __designTimeInteger("#7554_179", fallback: 4))
                        }

                    }

                    // Karma card description to the right
                    VStack(alignment: .leading, spacing: __designTimeInteger("#7554_180", fallback: 8)) {
                        Text(__designTimeString("#7554_181", fallback: "KARMA CARD"))
                            .font(.custom(__designTimeString("#7554_182", fallback: "Iowan Old Style"), size: __designTimeInteger("#7554_183", fallback: 32)))
                            .fontWeight(.bold)
                            .foregroundColor(inkColor)

                        Text(truncateDescription(karmaCardDescription, maxLength: __designTimeInteger("#7554_184", fallback: 280)))
                            .font(.custom(__designTimeString("#7554_185", fallback: "Iowan Old Style"), size: __designTimeInteger("#7554_186", fallback: 20)))
                            .foregroundColor(inkColor)
                            .lineSpacing(__designTimeInteger("#7554_187", fallback: 4))
                            .multilineTextAlignment(.leading)
                            .fixedSize(horizontal: __designTimeBoolean("#7554_188", fallback: false), vertical: __designTimeBoolean("#7554_189", fallback: true))
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding(.horizontal, __designTimeInteger("#7554_190", fallback: 40))
                .padding(.top, __designTimeInteger("#7554_191", fallback: 16))

                // Line design below cards
                if let lineImage = UIImage(named: __designTimeString("#7554_192", fallback: "linedesignd")) {
                    Image(uiImage: lineImage)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: __designTimeInteger("#7554_193", fallback: 200))
                        .padding(.vertical, __designTimeInteger("#7554_194", fallback: 8))
                }

                Spacer()

                // Footer with website URL and app promotion
                VStack(spacing: __designTimeInteger("#7554_195", fallback: 10)) {
                    Text(__designTimeString("#7554_196", fallback: "Get your free personalized reading"))
                        .font(.custom(__designTimeString("#7554_197", fallback: "Iowan Old Style"), size: __designTimeInteger("#7554_198", fallback: 20)))
                        .foregroundColor(inkColor.opacity(__designTimeFloat("#7554_199", fallback: 0.8)))
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, __designTimeInteger("#7554_200", fallback: 50))

                    Text(__designTimeString("#7554_201", fallback: "sevensisters.cards"))
                        .font(.custom(__designTimeString("#7554_202", fallback: "Iowan Old Style"), size: __designTimeInteger("#7554_203", fallback: 26)))
                        .fontWeight(.bold)
                        .foregroundColor(inkColor)
                }
                .padding(.bottom, __designTimeInteger("#7554_204", fallback: 24))
            }
            .padding(.horizontal, __designTimeInteger("#7554_205", fallback: 30))
            .padding(.vertical, __designTimeInteger("#7554_206", fallback: 40))
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
        if let lastPeriod = truncated.lastIndex(of: __designTimeString("#7554_207", fallback: ".")) {
            return String(truncated[...lastPeriod])
        }

        // If no period found, truncate at last space and add ellipsis
        if let lastSpace = truncated.lastIndex(of: __designTimeString("#7554_208", fallback: " ")) {
            return String(truncated[..<lastSpace]) + __designTimeString("#7554_209", fallback: "...")
        }

        return truncated + __designTimeString("#7554_210", fallback: "...")
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

            VStack(spacing: __designTimeInteger("#7554_211", fallback: 14)) {
                // Header
                VStack(spacing: __designTimeInteger("#7554_212", fallback: 2)) {
                    Text(__designTimeString("#7554_213", fallback: "Daily Card Reading"))
                        .font(.custom(__designTimeString("#7554_214", fallback: "Iowan Old Style"), size: __designTimeInteger("#7554_215", fallback: 38)))
                        .fontWeight(.bold)
                        .foregroundColor(inkColor)

                    Text(__designTimeString("#7554_216", fallback: "by Cards of The Seven Sisters"))
                        .font(.custom(__designTimeString("#7554_217", fallback: "Iowan Old Style"), size: __designTimeInteger("#7554_218", fallback: 22)))
                        .fontWeight(.semibold)
                        .foregroundColor(inkColor.opacity(__designTimeFloat("#7554_219", fallback: 0.8)))

                    Text(formatDate(date))
                        .font(.custom(__designTimeString("#7554_220", fallback: "Iowan Old Style"), size: __designTimeInteger("#7554_221", fallback: 15)))
                        .foregroundColor(inkColor.opacity(__designTimeFloat("#7554_222", fallback: 0.6)))
                        .padding(.top, __designTimeInteger("#7554_223", fallback: 2))
                }

                // Line design above cards (was linedesignd, now linedesign)
                if let lineImage = UIImage(named: __designTimeString("#7554_224", fallback: "linedesign")) {
                    Image(uiImage: lineImage)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: __designTimeInteger("#7554_225", fallback: 160))
                        .padding(.vertical, __designTimeInteger("#7554_226", fallback: 4))
                }

                // Card images side by side - much larger
                HStack(spacing: __designTimeInteger("#7554_227", fallback: 20)) {
                    VStack(spacing: __designTimeInteger("#7554_228", fallback: 6)) {
                        if let cardImage = ImageManager.shared.loadCardImage(for: dailyCard) {
                            Image(uiImage: cardImage)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: __designTimeInteger("#7554_229", fallback: 300))
                                .cornerRadius(__designTimeInteger("#7554_230", fallback: 12))
                                .shadow(color: .black.opacity(__designTimeFloat("#7554_231", fallback: 0.2)), radius: __designTimeInteger("#7554_232", fallback: 8), x: __designTimeInteger("#7554_233", fallback: 0), y: __designTimeInteger("#7554_234", fallback: 4))
                        }
                        VStack(spacing: __designTimeInteger("#7554_235", fallback: 2)) {
                            Text(dailyCardTitle)
                                .font(.custom(__designTimeString("#7554_236", fallback: "Iowan Old Style"), size: __designTimeInteger("#7554_237", fallback: 16)))
                                .fontWeight(.semibold)
                                .foregroundColor(inkColor)
                            Text(__designTimeString("#7554_238", fallback: "Daily Card"))
                                .font(.custom(__designTimeString("#7554_239", fallback: "Iowan Old Style"), size: __designTimeInteger("#7554_240", fallback: 14)))
                                .foregroundColor(inkColor.opacity(__designTimeFloat("#7554_241", fallback: 0.6)))
                        }
                    }

                    VStack(spacing: __designTimeInteger("#7554_242", fallback: 6)) {
                        if let planetImage = ImageManager.shared.loadPlanetImage(for: planetName) {
                            Image(uiImage: planetImage)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: __designTimeInteger("#7554_243", fallback: 300))
                                .cornerRadius(__designTimeInteger("#7554_244", fallback: 12))
                                .shadow(color: .black.opacity(__designTimeFloat("#7554_245", fallback: 0.2)), radius: __designTimeInteger("#7554_246", fallback: 8), x: __designTimeInteger("#7554_247", fallback: 0), y: __designTimeInteger("#7554_248", fallback: 4))
                        }
                        VStack(spacing: __designTimeInteger("#7554_249", fallback: 2)) {
                            Text(planetName.uppercased())
                                .font(.custom(__designTimeString("#7554_250", fallback: "Iowan Old Style"), size: __designTimeInteger("#7554_251", fallback: 16)))
                                .fontWeight(.semibold)
                                .foregroundColor(inkColor)
                            Text(__designTimeString("#7554_252", fallback: "Planetary Card"))
                                .font(.custom(__designTimeString("#7554_253", fallback: "Iowan Old Style"), size: __designTimeInteger("#7554_254", fallback: 14)))
                                .foregroundColor(inkColor.opacity(__designTimeFloat("#7554_255", fallback: 0.6)))
                        }
                    }
                }

                // Line design below cards (was linedesign, now linedesignd)
                if let lineImage = UIImage(named: __designTimeString("#7554_256", fallback: "linedesignd")) {
                    Image(uiImage: lineImage)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: __designTimeInteger("#7554_257", fallback: 160))
                        .padding(.vertical, __designTimeInteger("#7554_258", fallback: 4))
                }

                // Daily card section
                VStack(alignment: .leading, spacing: __designTimeInteger("#7554_259", fallback: 8)) {
                    Text(dailyCardTitle.uppercased())
                        .font(.custom(__designTimeString("#7554_260", fallback: "Iowan Old Style"), size: __designTimeInteger("#7554_261", fallback: 28)))
                        .fontWeight(.semibold)
                        .foregroundColor(inkColor)

                    Text(dailyCardDescription)
                        .font(.custom(__designTimeString("#7554_262", fallback: "Iowan Old Style"), size: __designTimeInteger("#7554_263", fallback: 18)))
                        .foregroundColor(inkColor)
                        .lineSpacing(__designTimeInteger("#7554_264", fallback: 3))
                        .fixedSize(horizontal: __designTimeBoolean("#7554_265", fallback: false), vertical: __designTimeBoolean("#7554_266", fallback: true))
                }
                .frame(maxWidth: __designTimeInteger("#7554_267", fallback: 950))
                .padding(.horizontal, __designTimeInteger("#7554_268", fallback: 30))

                // Planetary card section
                VStack(alignment: .leading, spacing: __designTimeInteger("#7554_269", fallback: 8)) {
                    Text(planetTitle.uppercased())
                        .font(.custom(__designTimeString("#7554_270", fallback: "Iowan Old Style"), size: __designTimeInteger("#7554_271", fallback: 28)))
                        .fontWeight(.semibold)
                        .foregroundColor(inkColor)

                    Text(planetDescription)
                        .font(.custom(__designTimeString("#7554_272", fallback: "Iowan Old Style"), size: __designTimeInteger("#7554_273", fallback: 18)))
                        .foregroundColor(inkColor)
                        .lineSpacing(__designTimeInteger("#7554_274", fallback: 3))
                        .fixedSize(horizontal: __designTimeBoolean("#7554_275", fallback: false), vertical: __designTimeBoolean("#7554_276", fallback: true))
                }
                .frame(maxWidth: __designTimeInteger("#7554_277", fallback: 950))
                .padding(.horizontal, __designTimeInteger("#7554_278", fallback: 30))

                Spacer()

                // Footer with website URL and app promotion
                VStack(spacing: __designTimeInteger("#7554_279", fallback: 8)) {
                    Text(__designTimeString("#7554_280", fallback: "Find out what The Cards hold for you with a free personalized reading."))
                        .font(.custom(__designTimeString("#7554_281", fallback: "Iowan Old Style"), size: __designTimeInteger("#7554_282", fallback: 16)))
                        .foregroundColor(inkColor.opacity(__designTimeFloat("#7554_283", fallback: 0.8)))
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, __designTimeInteger("#7554_284", fallback: 40))

                    Text(__designTimeString("#7554_285", fallback: "sevensisters.cards"))
                        .font(.custom(__designTimeString("#7554_286", fallback: "Iowan Old Style"), size: __designTimeInteger("#7554_287", fallback: 20)))
                        .fontWeight(.semibold)
                        .foregroundColor(inkColor)
                }
                .padding(.bottom, __designTimeInteger("#7554_288", fallback: 20))
            }
            .padding(__designTimeInteger("#7554_289", fallback: 40))
        }
        .frame(width: __designTimeInteger("#7554_290", fallback: 1200), height: __designTimeInteger("#7554_291", fallback: 1200))
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
                RoundedRectangle(cornerRadius: __designTimeInteger("#7554_292", fallback: 25))
                    .fill(backgroundColor)

                ScrollView {
                    VStack(spacing: __designTimeInteger("#7554_293", fallback: 0)) {
                        cardImageSection(in: geometry)
                        contentSection(in: geometry)
                        footerSection(in: geometry)
                    }
                    .padding(__designTimeInteger("#7554_294", fallback: 30))
                }
                .scrollIndicators(.hidden)
            }
        }
        .aspectRatio(exportSize.aspectRatio, contentMode: .fit)
    }
    
    private func cardImageSection(in geometry: GeometryProxy) -> some View {
        let availableWidth = max(__designTimeInteger("#7554_295", fallback: 200), geometry.size.width - __designTimeInteger("#7554_296", fallback: 60))
        let imageHeight = max(__designTimeInteger("#7554_297", fallback: 200), min(availableWidth * __designTimeFloat("#7554_298", fallback: 0.6), __designTimeInteger("#7554_299", fallback: 300)))
        let imageWidth = max(__designTimeInteger("#7554_300", fallback: 160), availableWidth * __designTimeFloat("#7554_301", fallback: 0.7))
        
        return content.image
            .resizable()
            .aspectRatio(__designTimeInteger("#7554_302", fallback: 16)/__designTimeInteger("#7554_303", fallback: 20), contentMode: .fit)
            .frame(width: imageWidth, height: imageHeight)
            .clipShape(RoundedRectangle(cornerRadius: __designTimeInteger("#7554_304", fallback: 16)))
            .shadow(color: .black.opacity(__designTimeFloat("#7554_305", fallback: 0.3)), radius: __designTimeInteger("#7554_306", fallback: 10), x: __designTimeInteger("#7554_307", fallback: 0), y: __designTimeInteger("#7554_308", fallback: 5))
            .padding(.bottom, dynamicSpacing(base: __designTimeInteger("#7554_309", fallback: 25), geometry: geometry))
    }
    
    private func contentSection(in geometry: GeometryProxy) -> some View {
        VStack(spacing: dynamicSpacing(base: __designTimeInteger("#7554_310", fallback: 15), geometry: geometry)) {
            Text(content.title.uppercased())
                .font(titleFont(for: geometry))
                
                .foregroundColor(inkColor)
                .multilineTextAlignment(.center)
                .lineLimit(__designTimeInteger("#7554_311", fallback: 3))
                .minimumScaleFactor(__designTimeFloat("#7554_312", fallback: 0.7))
            
            Text(content.subtitle.lowercased())
                .font(subtitleFont(for: geometry))
                
                .foregroundColor(inkColor)
                .multilineTextAlignment(.center)
                .lineLimit(__designTimeInteger("#7554_313", fallback: 3))
                .minimumScaleFactor(__designTimeFloat("#7554_314", fallback: 0.8))
            
            Rectangle()
                .frame(width: __designTimeInteger("#7554_315", fallback: 80), height: __designTimeInteger("#7554_316", fallback: 1))
                .foregroundColor(inkColor.opacity(__designTimeFloat("#7554_317", fallback: 0.6)))
                .padding(.vertical, dynamicSpacing(base: __designTimeInteger("#7554_318", fallback: 8), geometry: geometry))
            
            Text(content.excerpt)
                .font(bodyFont(for: geometry))
                .foregroundColor(inkColor)
                
                .multilineTextAlignment(.leading)
                .lineSpacing(__designTimeInteger("#7554_319", fallback: 2))
                .lineLimit(nil)
                .minimumScaleFactor(__designTimeFloat("#7554_320", fallback: 0.8))
        }
        .padding(.horizontal, dynamicSpacing(base: __designTimeInteger("#7554_321", fallback: 25), geometry: geometry))
    }
    
    private func footerSection(in geometry: GeometryProxy) -> some View {
        HStack {
            Text(formattedDate)
                .font(footerFont(for: geometry))
                .foregroundColor(inkColor.opacity(__designTimeFloat("#7554_322", fallback: 0.7)))
            
            Spacer()
        }
        .padding(.top, dynamicSpacing(base: __designTimeInteger("#7554_323", fallback: 30), geometry: geometry))
    }
    
    private func dynamicSpacing(base: CGFloat, geometry: GeometryProxy) -> CGFloat {
        let scale = min(geometry.size.width, geometry.size.height) / __designTimeFloat("#7554_324", fallback: 500.0)
        return base * max(__designTimeFloat("#7554_325", fallback: 0.8), min(__designTimeFloat("#7554_326", fallback: 1.8), scale))
    }
    
    private func titleFont(for geometry: GeometryProxy) -> Font {
        let baseSize: CGFloat = __designTimeInteger("#7554_327", fallback: 32)
        let scaledSize = baseSize * fontScale(for: geometry)
        return .custom(__designTimeString("#7554_328", fallback: "Iowan Old Style"), size: scaledSize)
    }
    
    private func subtitleFont(for geometry: GeometryProxy) -> Font {
        let baseSize: CGFloat = __designTimeInteger("#7554_329", fallback: 22)
        let scaledSize = baseSize * fontScale(for: geometry)
        return .custom(__designTimeString("#7554_330", fallback: "Iowan Old Style"), size: scaledSize)
    }
    
    private func bodyFont(for geometry: GeometryProxy) -> Font {
        let baseSize: CGFloat = __designTimeInteger("#7554_331", fallback: 18)
        let scaledSize = baseSize * fontScale(for: geometry)
        return .custom(__designTimeString("#7554_332", fallback: "Iowan Old Style"), size: scaledSize)
    }
    
    private func footerFont(for geometry: GeometryProxy) -> Font {
        let baseSize: CGFloat = __designTimeInteger("#7554_333", fallback: 14)
        let scaledSize = baseSize * fontScale(for: geometry)
        return .custom(__designTimeString("#7554_334", fallback: "Iowan Old Style"), size: scaledSize)
    }
    
    private func fontScale(for geometry: GeometryProxy) -> CGFloat {
        let scale = min(geometry.size.width, geometry.size.height) / __designTimeFloat("#7554_335", fallback: 500.0)
        return max(__designTimeFloat("#7554_336", fallback: 0.8), min(__designTimeFloat("#7554_337", fallback: 1.6), scale))
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
                    renderer.scale = __designTimeFloat("#7554_338", fallback: 1.0)

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
                renderer.scale = __designTimeFloat("#7554_339", fallback: 2.0)

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
            return __designTimeString("#7554_340", fallback: "Failed to render share card")
        case .pngConversionFailed:
            return __designTimeString("#7554_341", fallback: "Failed to convert to PNG")
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

        if let url = URL(string: __designTimeString("#7554_342", fallback: "https://sevensisters.cards")) {
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
                    .scaleEffect(__designTimeFloat("#7554_343", fallback: 0.8))
                    .progressViewStyle(CircularProgressViewStyle(tint: .black))
                    .frame(width: __designTimeInteger("#7554_344", fallback: 44), height: __designTimeInteger("#7554_345", fallback: 44))
            } else {
                if let shareIcon = UIImage(named: __designTimeString("#7554_346", fallback: "share_icon")) {
                    Image(uiImage: shareIcon)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: __designTimeInteger("#7554_347", fallback: 24), height: __designTimeInteger("#7554_348", fallback: 24))
                        .foregroundColor(.black)
                        .frame(width: __designTimeInteger("#7554_349", fallback: 44), height: __designTimeInteger("#7554_350", fallback: 44))
                        .contentShape(Rectangle())
                } else {
                    Image(systemName: __designTimeString("#7554_351", fallback: "square.and.arrow.up"))
                        .font(.system(size: __designTimeInteger("#7554_352", fallback: 20)))
                        .foregroundColor(.black)
                        .frame(width: __designTimeInteger("#7554_353", fallback: 44), height: __designTimeInteger("#7554_354", fallback: 44))
                        .contentShape(Rectangle())
                }
            }
        }
        .disabled(isLoading)
        .accessibilityLabel(__designTimeString("#7554_355", fallback: "Share"))
        .sheet(isPresented: $isShowingShareSheet) {
            if !shareItems.isEmpty {
                ShareSheetWrapper(activityItems: shareItems)
                    .ignoresSafeArea()
            }
        }
        .alert(__designTimeString("#7554_356", fallback: "Share Error"), isPresented: .constant(errorMessage != nil)) {
            Button(__designTimeString("#7554_357", fallback: "OK")) {
                errorMessage = nil
            }
        } message: {
            if let errorMessage = errorMessage {
                Text(errorMessage)
            }
        }
    }

    private func shareCard() {
        isLoading = __designTimeBoolean("#7554_358", fallback: true)
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
                renderer.proposedSize = ProposedViewSize(width: __designTimeInteger("#7554_359", fallback: 1200), height: __designTimeInteger("#7554_360", fallback: 1200))
                renderer.scale = __designTimeFloat("#7554_361", fallback: 2.0)

                guard let renderedImage = renderer.uiImage else {
                    throw ShareCardError.renderingFailed
                }

                // Remove alpha channel to avoid warning and save memory
                let imageWithoutAlpha = removeAlphaChannel(from: renderedImage)

                // Convert to JPEG and save to temp file for better preview support
                guard let imageData = imageWithoutAlpha.jpegData(compressionQuality: __designTimeFloat("#7554_362", fallback: 0.9)) else {
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
                    isLoading = __designTimeBoolean("#7554_363", fallback: false)
                    isShowingShareSheet = __designTimeBoolean("#7554_364", fallback: true)
                }
            } catch {
                await MainActor.run {
                    isLoading = __designTimeBoolean("#7554_365", fallback: false)
                    errorMessage = error.localizedDescription
                }
            }
        }
    }

    private func removeAlphaChannel(from image: UIImage) -> UIImage {
        let format = UIGraphicsImageRendererFormat()
        format.opaque = __designTimeBoolean("#7554_366", fallback: true) // This removes alpha channel
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
                    .scaleEffect(__designTimeFloat("#7554_367", fallback: 0.8))
                    .progressViewStyle(CircularProgressViewStyle(tint: .black))
                    .frame(width: __designTimeInteger("#7554_368", fallback: 44), height: __designTimeInteger("#7554_369", fallback: 44))
            } else {
                if let shareIcon = UIImage(named: __designTimeString("#7554_370", fallback: "share_icon")) {
                    Image(uiImage: shareIcon)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: __designTimeInteger("#7554_371", fallback: 24), height: __designTimeInteger("#7554_372", fallback: 24))
                        .foregroundColor(.black)
                        .frame(width: __designTimeInteger("#7554_373", fallback: 44), height: __designTimeInteger("#7554_374", fallback: 44))
                        .contentShape(Rectangle())
                } else {
                    Image(systemName: __designTimeString("#7554_375", fallback: "square.and.arrow.up"))
                        .font(.system(size: __designTimeInteger("#7554_376", fallback: 20)))
                        .foregroundColor(.black)
                        .frame(width: __designTimeInteger("#7554_377", fallback: 44), height: __designTimeInteger("#7554_378", fallback: 44))
                        .contentShape(Rectangle())
                }
            }
        }
        .disabled(isLoading)
        .accessibilityLabel(__designTimeString("#7554_379", fallback: "Share"))
        .sheet(isPresented: $isShowingShareSheet) {
            if !shareItems.isEmpty {
                ShareSheetWrapper(activityItems: shareItems)
                    .ignoresSafeArea()
            }
        }
        .alert(__designTimeString("#7554_380", fallback: "Share Error"), isPresented: .constant(errorMessage != nil)) {
            Button(__designTimeString("#7554_381", fallback: "OK")) {
                errorMessage = nil
            }
        } message: {
            if let errorMessage = errorMessage {
                Text(errorMessage)
            }
        }
    }

    private func shareCard() {
        isLoading = __designTimeBoolean("#7554_382", fallback: true)

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
                renderer.scale = __designTimeFloat("#7554_383", fallback: 2.0)

                guard let renderedImage = renderer.uiImage else {
                    throw ShareCardError.renderingFailed
                }

                // Strip alpha, like you already do, to keep iOS happy
                let imageWithoutAlpha = removeAlphaChannel(from: renderedImage)

                guard let imageData = imageWithoutAlpha.jpegData(compressionQuality: __designTimeFloat("#7554_384", fallback: 0.9)) else {
                    throw ShareCardError.pngConversionFailed
                }

                let tempDir = FileManager.default.temporaryDirectory
                let fileName = __designTimeString("#7554_385", fallback: "My Birth Card reading by Cards of The Seven Sisters.jpg")
                let fileURL = tempDir.appendingPathComponent(fileName)

                try imageData.write(to: fileURL)

                await MainActor.run {
                    let activityItemSource = ShareCardActivityItemSource(
                        image: imageWithoutAlpha,
                        fileURL: fileURL,
                        subject: __designTimeString("#7554_386", fallback: "My Birth Card reading by Cards of The Seven Sisters")
                    )

                    self.shareItems = [activityItemSource]
                    isLoading = __designTimeBoolean("#7554_387", fallback: false)
                    isShowingShareSheet = __designTimeBoolean("#7554_388", fallback: true)
                }
            } catch {
                await MainActor.run {
                    isLoading = __designTimeBoolean("#7554_389", fallback: false)
                    errorMessage = error.localizedDescription
                }
            }
        }
    }


    private func removeAlphaChannel(from image: UIImage) -> UIImage {
        let format = UIGraphicsImageRendererFormat()
        format.opaque = __designTimeBoolean("#7554_390", fallback: true) // This removes alpha channel
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
                    .scaleEffect(__designTimeFloat("#7554_391", fallback: 0.8))
                    .progressViewStyle(CircularProgressViewStyle(tint: .black))
                    .frame(width: __designTimeInteger("#7554_392", fallback: 44), height: __designTimeInteger("#7554_393", fallback: 44))
            } else {
                if let shareIcon = UIImage(named: __designTimeString("#7554_394", fallback: "share_icon")) {
                    Image(uiImage: shareIcon)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: __designTimeInteger("#7554_395", fallback: 24), height: __designTimeInteger("#7554_396", fallback: 24))
                        .foregroundColor(.black)
                        .frame(width: __designTimeInteger("#7554_397", fallback: 44), height: __designTimeInteger("#7554_398", fallback: 44))
                        .contentShape(Rectangle())
                } else {
                    Image(systemName: __designTimeString("#7554_399", fallback: "square.and.arrow.up"))
                        .font(.system(size: __designTimeInteger("#7554_400", fallback: 20)))
                        .foregroundColor(.black)
                        .frame(width: __designTimeInteger("#7554_401", fallback: 44), height: __designTimeInteger("#7554_402", fallback: 44))
                        .contentShape(Rectangle())
                }
            }
        }
        .disabled(isLoading)
        .accessibilityLabel(__designTimeString("#7554_403", fallback: "Share"))
        .sheet(isPresented: $isShowingShareSheet) {
            if !shareItems.isEmpty {
                ShareSheetWrapper(activityItems: shareItems)
                    .ignoresSafeArea()
            }
        }
        .alert(__designTimeString("#7554_404", fallback: "Share Error"), isPresented: .constant(errorMessage != nil)) {
            Button(__designTimeString("#7554_405", fallback: "OK")) {
                errorMessage = nil
            }
        } message: {
            if let errorMessage = errorMessage {
                Text(errorMessage)
            }
        }
    }

    private func shareCard() {
        isLoading = __designTimeBoolean("#7554_406", fallback: true)
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
                renderer.proposedSize = ProposedViewSize(width: __designTimeInteger("#7554_407", fallback: 1200), height: __designTimeInteger("#7554_408", fallback: 1200))
                renderer.scale = __designTimeFloat("#7554_409", fallback: 2.0)

                guard let renderedImage = renderer.uiImage else {
                    throw ShareCardError.renderingFailed
                }

                // Remove alpha channel to avoid warning and save memory
                let imageWithoutAlpha = removeAlphaChannel(from: renderedImage)

                // Convert to JPEG and save to temp file for better preview support
                guard let imageData = imageWithoutAlpha.jpegData(compressionQuality: __designTimeFloat("#7554_410", fallback: 0.9)) else {
                    throw ShareCardError.pngConversionFailed
                }

                let tempDir = FileManager.default.temporaryDirectory
                // Create descriptive filename with spaces
                let fileName = __designTimeString("#7554_411", fallback: "My Astral Cycle reading by Cards of The Seven Sisters.jpg")
                let fileURL = tempDir.appendingPathComponent(fileName)

                try imageData.write(to: fileURL)

                await MainActor.run {
                    // Create custom activity item source with thumbnail for preview
                    let activityItemSource = ShareCardActivityItemSource(
                        image: imageWithoutAlpha,
                        fileURL: fileURL,
                        subject: __designTimeString("#7554_412", fallback: "My Astral Cycle reading by Cards of The Seven Sisters")
                    )

                    // Share only the image (URL and promotional text now embedded in image)
                    self.shareItems = [activityItemSource]
                    isLoading = __designTimeBoolean("#7554_413", fallback: false)
                    isShowingShareSheet = __designTimeBoolean("#7554_414", fallback: true)
                }
            } catch {
                await MainActor.run {
                    isLoading = __designTimeBoolean("#7554_415", fallback: false)
                    errorMessage = error.localizedDescription
                }
            }
        }
    }

    private func removeAlphaChannel(from image: UIImage) -> UIImage {
        let format = UIGraphicsImageRendererFormat()
        format.opaque = __designTimeBoolean("#7554_416", fallback: true) // This removes alpha channel
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
                    .scaleEffect(__designTimeFloat("#7554_417", fallback: 0.8))
                    .progressViewStyle(CircularProgressViewStyle(tint: .black))
                    .frame(width: __designTimeInteger("#7554_418", fallback: 44), height: __designTimeInteger("#7554_419", fallback: 44))
            } else {
                if let shareIcon = UIImage(named: __designTimeString("#7554_420", fallback: "share_icon")) {
                    Image(uiImage: shareIcon)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: __designTimeInteger("#7554_421", fallback: 24), height: __designTimeInteger("#7554_422", fallback: 24))
                        .foregroundColor(.black)
                        .frame(width: __designTimeInteger("#7554_423", fallback: 44), height: __designTimeInteger("#7554_424", fallback: 44))
                        .contentShape(Rectangle())
                } else {
                    Image(systemName: __designTimeString("#7554_425", fallback: "square.and.arrow.up"))
                        .font(.system(size: __designTimeInteger("#7554_426", fallback: 20)))
                        .foregroundColor(.black)
                        .frame(width: __designTimeInteger("#7554_427", fallback: 44), height: __designTimeInteger("#7554_428", fallback: 44))
                        .contentShape(Rectangle())
                }
            }
        }
        .disabled(isLoading)
        .accessibilityLabel(__designTimeString("#7554_429", fallback: "Share"))
        .sheet(isPresented: $isShowingShareSheet) {
            if !shareItems.isEmpty {
                ShareSheetWrapper(activityItems: shareItems)
                    .ignoresSafeArea()
            }
        }
        .alert(__designTimeString("#7554_430", fallback: "Share Error"), isPresented: .constant(errorMessage != nil)) {
            Button(__designTimeString("#7554_431", fallback: "OK")) {
                errorMessage = nil
            }
        } message: {
            if let errorMessage = errorMessage {
                Text(errorMessage)
            }
        }
    }

    private func shareCard() {
        isLoading = __designTimeBoolean("#7554_432", fallback: true)
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
                renderer.proposedSize = ProposedViewSize(width: __designTimeInteger("#7554_433", fallback: 1200), height: __designTimeInteger("#7554_434", fallback: 1200))
                renderer.scale = __designTimeFloat("#7554_435", fallback: 2.0)

                guard let renderedImage = renderer.uiImage else {
                    throw ShareCardError.renderingFailed
                }

                // Remove alpha channel to avoid warning and save memory
                let imageWithoutAlpha = removeAlphaChannel(from: renderedImage)

                // Convert to JPEG and save to temp file for better preview support
                guard let imageData = imageWithoutAlpha.jpegData(compressionQuality: __designTimeFloat("#7554_436", fallback: 0.9)) else {
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
                    isLoading = __designTimeBoolean("#7554_437", fallback: false)
                    isShowingShareSheet = __designTimeBoolean("#7554_438", fallback: true)
                }
            } catch {
                await MainActor.run {
                    isLoading = __designTimeBoolean("#7554_439", fallback: false)
                    errorMessage = error.localizedDescription
                }
            }
        }
    }

    private func removeAlphaChannel(from image: UIImage) -> UIImage {
        let format = UIGraphicsImageRendererFormat()
        format.opaque = __designTimeBoolean("#7554_440", fallback: true) // This removes alpha channel
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
                    .scaleEffect(__designTimeFloat("#7554_441", fallback: 0.8))
                    .progressViewStyle(CircularProgressViewStyle(tint: .black))
                    .frame(width: __designTimeInteger("#7554_442", fallback: 44), height: __designTimeInteger("#7554_443", fallback: 44))
            } else {
                if let shareIcon = UIImage(named: __designTimeString("#7554_444", fallback: "share_icon")) {
                    Image(uiImage: shareIcon)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: __designTimeInteger("#7554_445", fallback: 24), height: __designTimeInteger("#7554_446", fallback: 24))
                        .foregroundColor(.black)
                        .frame(width: __designTimeInteger("#7554_447", fallback: 44), height: __designTimeInteger("#7554_448", fallback: 44))
                        .contentShape(Rectangle())
                } else {
                    Image(systemName: __designTimeString("#7554_449", fallback: "square.and.arrow.up"))
                        .font(.system(size: __designTimeInteger("#7554_450", fallback: 20)))
                        .foregroundColor(.black)
                        .frame(width: __designTimeInteger("#7554_451", fallback: 44), height: __designTimeInteger("#7554_452", fallback: 44))
                        .contentShape(Rectangle())
                }
            }
        }
        .disabled(isLoading)
        .accessibilityLabel(__designTimeString("#7554_453", fallback: "Share"))
        .alert(__designTimeString("#7554_454", fallback: "Share Error"), isPresented: .constant(errorMessage != nil)) {
            Button(__designTimeString("#7554_455", fallback: "OK")) {
                errorMessage = nil
            }
        } message: {
            if let errorMessage = errorMessage {
                Text(errorMessage)
            }
        }
    }

    private func shareCard() {
        isLoading = __designTimeBoolean("#7554_456", fallback: true)
        Task {
            do {
                // Render the main image
                let image = try await ShareCardRenderer.renderUIImage(content: content, size: size)

                await MainActor.run {
                    isLoading = __designTimeBoolean("#7554_457", fallback: false)
                    presentShareSheet(image: image)
                }
            } catch {
                await MainActor.run {
                    isLoading = __designTimeBoolean("#7554_458", fallback: false)
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
                popover.sourceRect = CGRect(x: topController.view.bounds.midX, y: topController.view.bounds.midY, width: __designTimeInteger("#7554_459", fallback: 0), height: __designTimeInteger("#7554_460", fallback: 0))
                popover.permittedArrowDirections = []
            }

            topController.present(activityVC, animated: __designTimeBoolean("#7554_461", fallback: true))
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

        let excerptLimit = __designTimeInteger("#7554_462", fallback: 200)
        if content.excerpt.count > excerptLimit {
            let truncated = String(content.excerpt.prefix(excerptLimit))
            text += truncated + __designTimeString("#7554_463", fallback: "...")
        } else {
            text += content.excerpt
        }

        // Add additional content if provided
        if let additionalContent = additionalContent {
            text += "\n\n---\n\n"
            text += "\(additionalContent.title): \(additionalContent.subtitle)\n\n"

            if additionalContent.excerpt.count > excerptLimit {
                let truncated = String(additionalContent.excerpt.prefix(excerptLimit))
                text += truncated + __designTimeString("#7554_464", fallback: "...")
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
        
        var cardName = __designTimeString("#7554_465", fallback: "")
        var cardTitle = __designTimeString("#7554_466", fallback: "")
        var description = __designTimeString("#7554_467", fallback: "")
        var image: Image = Image(systemName: __designTimeString("#7554_468", fallback: "questionmark.card"))
        
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
                    description = repo.dailyDescriptions[cardID] ?? __designTimeString("#7554_469", fallback: "No daily description available.")
                case .birth:
                    description = repo.birthDescriptions[cardID] ?? __designTimeString("#7554_470", fallback: "No birth description available.")
                case .yearly:
                    description = repo.yearlyDescriptions[cardID] ?? __designTimeString("#7554_471", fallback: "No yearly description available.")
                case .fiftyTwoDay:
                    description = repo.fiftyTwoDescriptions[cardID] ?? __designTimeString("#7554_472", fallback: "No 52-day description available.")
                case .planetary:
                    description = __designTimeString("#7554_473", fallback: "Error: Should be handled above")
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
