import func SwiftUI.__designTimeFloat
import func SwiftUI.__designTimeString
import func SwiftUI.__designTimeInteger
import func SwiftUI.__designTimeBoolean

#sourceLocation(file: "/Users/impriints/Downloads/COTSS_PreBoldRemoval_MyCopy/CardsofTheSevenSisters/Components/OnboardingTutorialView.swift", line: 1)
import SwiftUI

struct OnboardingTutorialView: View {
    @Binding var isPresented: Bool
    @State private var currentStep: Int = 0
    @State private var showContent: Bool = false
    @State private var showOverlay: Bool = false
    @State private var backgroundOpacity: Double = 0
    @State private var isTransitioning: Bool = false
    
    // Animation states for the floating card
    @State private var cardPosition: CGPoint = .zero
    @State private var cardScale: CGFloat = 1.0
    @State private var cardOpacity: Double = 0
    @State private var showFloatingCard: Bool = false
    @State private var cardShadowRadius: CGFloat = 5
    @State private var cardShadowOpacity: Double = 0.2
    @State private var highlightedCardStep: Int? = nil  // Which card to highlight before pickup

    // Store background card positions
    @State private var birthCardFrame: CGRect = .zero
    @State private var solarCardFrame: CGRect = .zero
    @State private var astralCardFrame: CGRect = .zero
    @State private var dailyCardFrame: CGRect = .zero
    
    // Modal card position
    @State private var modalCardPosition: CGPoint = .zero

    // Welcome screen animation states
    @State private var showWelcomeTitle: Bool = false
    @State private var showWelcomeLineDesign: Bool = false
    @State private var showWelcomeText: Bool = false
    @State private var showWelcomeBody: Bool = false

    // Final screen animation state
    @State private var showSettingsText: Bool = false

    // Button visibility state (fades in after card settles)
    @State private var showButtons: Bool = false

    let birthCard: Card
    let solarCard: Card
    let astralCard: Card
    let dailyCard: Card
    let userName: String
    let onComplete: () -> Void

    private let tutorialSteps = [
           TutorialStep(
               cardTypeHeader: "WELCOME",
               description: "" // This will be handled separately for the welcome screen
           ),
           TutorialStep(
               cardTypeHeader: "YOUR BIRTH CARD",
               description: "This archetype gives insight to lifelong motifs. Your Birth Card, or Sun Card, is based on your birthday. It's used to calculate every other card in your Spread."
           ),
           TutorialStep(
               cardTypeHeader: "YEARLY SOLAR CYCLE",
               description: "Each birthday, you get a fresh start with a new Yearly Card to grow and learn from. This Card joins you for your 365-day cycle around the Sun."
           ),
           TutorialStep(
               cardTypeHeader: "52 DAY ASTRAL CYCLE",
               description: "There are 7 Planetary Periods in a year, that each offer a 52 Day Card to help us explore the multiple aspects of the larger Yearly Cycle."
           ),
           TutorialStep(
               cardTypeHeader: "YOUR DAILY CARD",
               description: "Big change comes from small steps. Again, the 7 Planets are here keep us aligned. Your Daily Card sets a weekly check in with each one."
           ),
       ]

    var body: some View {
        ZStack {
            // Static background image of home view
            staticHomeViewBackground

            // Dark overlay that fades in/out
            Color.black.opacity(backgroundOpacity)
                .ignoresSafeArea()
                .animation(.easeInOut(duration: __designTimeFloat("#7539_0", fallback: 0.4)), value: backgroundOpacity)

            // Tutorial modal
            if showOverlay {
                tutorialModalContent
            }
            
            // Floating animating card
            if showFloatingCard {
                floatingCard
            }
        }
        .onAppear {
            startTutorial()
        }
    }

    // MARK: - Static Background
    private var staticHomeViewBackground: some View {
        ScrollView {
            VStack(spacing: __designTimeInteger("#7539_1", fallback: 0)) {
                // Header
                HStack {
                    Spacer()
                    Image(systemName: __designTimeString("#7539_2", fallback: "gearshape"))
                        .font(.title2)
                        .foregroundColor(.black)
                }
                .padding(.horizontal, AppConstants.Spacing.medium)
                .padding(.vertical, AppConstants.Spacing.medium)

                // Welcome text
                               Text("Welcome, \(userName.isEmpty ? __designTimeString("#7539_3", fallback: "Guest") : userName)")
                                   .font(.custom(__designTimeString("#7539_4", fallback: "Iowan Old Style"), size: AppConstants.FontSizes.extraLarge + __designTimeInteger("#7539_5", fallback: 2)))
                                   .foregroundColor(.black)
                                   .padding(.bottom, AppConstants.Spacing.medium)
                                   .opacity(showOverlay ? __designTimeInteger("#7539_6", fallback: 0) : __designTimeInteger("#7539_7", fallback: 1))
                    .animation(.easeOut(duration: __designTimeFloat("#7539_8", fallback: 0.3)), value: showOverlay)

                if let lineImage = UIImage(named: __designTimeString("#7539_9", fallback: "linedesign")) {
                    Image(uiImage: lineImage)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: __designTimeInteger("#7539_10", fallback: 280), height: __designTimeInteger("#7539_11", fallback: 22))
                        .padding(.top, AppConstants.Spacing.small)
                        .padding(.bottom, AppConstants.Spacing.small)
                }

                // Cards section
                VStack(spacing: __designTimeInteger("#7539_12", fallback: 0)) {
                    HStack {
                        Spacer()
                        Text(__designTimeString("#7539_13", fallback: "TODAY'S CYCLE"))
                            .font(.custom(__designTimeString("#7539_14", fallback: "Iowan Old Style"), size: AppConstants.FontSizes.title))
                            .foregroundColor(.black)
                        Spacer()
                    }
                    .padding(.bottom, AppConstants.Spacing.small)
                    .opacity(showOverlay ? __designTimeInteger("#7539_15", fallback: 0) : __designTimeInteger("#7539_16", fallback: 1))
                    .animation(.easeOut(duration: __designTimeFloat("#7539_17", fallback: 0.3)), value: showOverlay)

                    VStack(spacing: __designTimeInteger("#7539_18", fallback: 20)) {
                        // Daily card back placeholder
                        if let cardBackImage = UIImage(named: __designTimeString("#7539_19", fallback: "cardback")) {
                            Image(uiImage: cardBackImage)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: AppConstants.CardSizes.extraLarge.width, height: AppConstants.CardSizes.extraLarge.height)
                                .clipShape(RoundedRectangle(cornerRadius: AppConstants.CornerRadius.cardLarge))
                                .cardShadow(isLarge: __designTimeBoolean("#7539_20", fallback: true))
                                .scaleEffect(highlightedCardStep == __designTimeInteger("#7539_21", fallback: 4) ? __designTimeFloat("#7539_22", fallback: 1.15) : __designTimeFloat("#7539_23", fallback: 1.0))
                                .animation(.spring(response: __designTimeFloat("#7539_24", fallback: 0.5), dampingFraction: __designTimeFloat("#7539_25", fallback: 0.65)), value: highlightedCardStep)
                                .opacity((currentStep == __designTimeInteger("#7539_26", fallback: 4) && showFloatingCard) ? __designTimeInteger("#7539_27", fallback: 0) : __designTimeInteger("#7539_28", fallback: 1))
                                .animation(.none, value: showFloatingCard)
                                .overlay(
                                    GeometryReader { geo in
                                        Color.clear.onAppear {
                                            DispatchQueue.main.async {
                                                dailyCardFrame = geo.frame(in: .global)
                                            }
                                        }
                                    }
                                )
                        }

                        Text(__designTimeString("#7539_29", fallback: "Tap to Reveal"))
                            .font(.custom(__designTimeString("#7539_30", fallback: "Iowan Old Style"), size: AppConstants.FontSizes.headline + __designTimeInteger("#7539_31", fallback: 2)))
                            .foregroundColor(.black)
                            .multilineTextAlignment(.center)
                            .opacity((showFloatingCard && currentStep >= __designTimeInteger("#7539_32", fallback: 1) && currentStep <= __designTimeInteger("#7539_33", fallback: 3)) ? __designTimeInteger("#7539_34", fallback: 0) : __designTimeInteger("#7539_35", fallback: 1))
                            .animation(.easeOut(duration: __designTimeFloat("#7539_36", fallback: 0.2)), value: showFloatingCard)
                    }
                    .padding(.vertical, __designTimeInteger("#7539_37", fallback: 20))

                    if let lineImageD = UIImage(named: __designTimeString("#7539_38", fallback: "linedesignd")) {
                        Image(uiImage: lineImageD)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: __designTimeInteger("#7539_39", fallback: 280), height: __designTimeInteger("#7539_40", fallback: 22))
                            .padding(.bottom, AppConstants.Spacing.sectionSpacing)
                    }

                    // Three small cards row
                    HStack(spacing: AppConstants.Spacing.small) {
                        // Birth card
                        VStack(spacing: AppConstants.Spacing.small) {
                            if let cardImage = ImageManager.shared.loadCardImage(for: birthCard) {
                                Image(uiImage: cardImage)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: AppConstants.CardSizes.small.width, height: AppConstants.CardSizes.small.height)
                                    .clipShape(RoundedRectangle(cornerRadius: AppConstants.CornerRadius.card))
                                    .cardShadow(isLarge: __designTimeBoolean("#7539_41", fallback: true))
                                    .scaleEffect(highlightedCardStep == __designTimeInteger("#7539_42", fallback: 1) ? __designTimeFloat("#7539_43", fallback: 1.15) : __designTimeFloat("#7539_44", fallback: 1.0))
                                    .animation(.spring(response: __designTimeFloat("#7539_45", fallback: 0.5), dampingFraction: __designTimeFloat("#7539_46", fallback: 0.65)), value: highlightedCardStep)
                                    .opacity((currentStep == __designTimeInteger("#7539_47", fallback: 1) && showFloatingCard) ? __designTimeInteger("#7539_48", fallback: 0) : __designTimeInteger("#7539_49", fallback: 1))
                                    .animation(.none, value: showFloatingCard)
                                    .overlay(
                                        GeometryReader { geo in
                                            Color.clear.onAppear {
                                                DispatchQueue.main.async {
                                                    birthCardFrame = geo.frame(in: .global)
                                                }
                                            }
                                        }
                                    )
                            }
                            Text(__designTimeString("#7539_50", fallback: "Your Birth Card"))
                                .font(.custom(__designTimeString("#7539_51", fallback: "Iowan Old Style"), size: AppConstants.FontSizes.body))
                                .foregroundColor(.black)
                                .multilineTextAlignment(.center)
                                .lineLimit(__designTimeInteger("#7539_52", fallback: 2))
                        }
                        .frame(maxWidth: .infinity)

                        // Solar card
                        VStack(spacing: AppConstants.Spacing.small) {
                            if let cardImage = ImageManager.shared.loadCardImage(for: solarCard) {
                                Image(uiImage: cardImage)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: AppConstants.CardSizes.small.width, height: AppConstants.CardSizes.small.height)
                                    .clipShape(RoundedRectangle(cornerRadius: AppConstants.CornerRadius.card))
                                    .cardShadow(isLarge: __designTimeBoolean("#7539_53", fallback: true))
                                    .scaleEffect(highlightedCardStep == __designTimeInteger("#7539_54", fallback: 2) ? __designTimeFloat("#7539_55", fallback: 1.15) : __designTimeFloat("#7539_56", fallback: 1.0))
                                    .animation(.spring(response: __designTimeFloat("#7539_57", fallback: 0.5), dampingFraction: __designTimeFloat("#7539_58", fallback: 0.65)), value: highlightedCardStep)
                                    .opacity((currentStep == __designTimeInteger("#7539_59", fallback: 2) && showFloatingCard) ? __designTimeInteger("#7539_60", fallback: 0) : __designTimeInteger("#7539_61", fallback: 1))
                                    .animation(.none, value: showFloatingCard)
                                    .overlay(
                                        GeometryReader { geo in
                                            Color.clear.onAppear {
                                                DispatchQueue.main.async {
                                                    solarCardFrame = geo.frame(in: .global)
                                                }
                                            }
                                        }
                                    )
                            }
                            Text(__designTimeString("#7539_62", fallback: "Yearly Solar Cycle"))
                                .font(.custom(__designTimeString("#7539_63", fallback: "Iowan Old Style"), size: AppConstants.FontSizes.body))
                                .foregroundColor(.black)
                                .multilineTextAlignment(.center)
                                .lineLimit(__designTimeInteger("#7539_64", fallback: 2))
                        }
                        .frame(maxWidth: .infinity)

                        // Astral card
                        VStack(spacing: AppConstants.Spacing.small) {
                            if let cardImage = ImageManager.shared.loadCardImage(for: astralCard) {
                                Image(uiImage: cardImage)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: AppConstants.CardSizes.small.width, height: AppConstants.CardSizes.small.height)
                                    .clipShape(RoundedRectangle(cornerRadius: AppConstants.CornerRadius.card))
                                    .cardShadow(isLarge: __designTimeBoolean("#7539_65", fallback: true))
                                    .scaleEffect(highlightedCardStep == __designTimeInteger("#7539_66", fallback: 3) ? __designTimeFloat("#7539_67", fallback: 1.15) : __designTimeFloat("#7539_68", fallback: 1.0))
                                    .animation(.spring(response: __designTimeFloat("#7539_69", fallback: 0.5), dampingFraction: __designTimeFloat("#7539_70", fallback: 0.65)), value: highlightedCardStep)
                                    .opacity((currentStep == __designTimeInteger("#7539_71", fallback: 3) && showFloatingCard) ? __designTimeInteger("#7539_72", fallback: 0) : __designTimeInteger("#7539_73", fallback: 1))
                                    .animation(.none, value: showFloatingCard)
                                    .overlay(
                                        GeometryReader { geo in
                                            Color.clear.onAppear {
                                                DispatchQueue.main.async {
                                                    astralCardFrame = geo.frame(in: .global)
                                                }
                                            }
                                        }
                                    )
                            }
                            Text(__designTimeString("#7539_74", fallback: "52 Day Astral Cycle"))
                                .font(.custom(__designTimeString("#7539_75", fallback: "Iowan Old Style"), size: AppConstants.FontSizes.body))
                                .foregroundColor(.black)
                                .multilineTextAlignment(.center)
                                .lineLimit(__designTimeInteger("#7539_76", fallback: 2))
                        }
                        .frame(maxWidth: .infinity)
                    }
                    .padding(.horizontal, AppConstants.Spacing.medium)
                    .padding(.bottom, __designTimeInteger("#7539_77", fallback: 62))
                    .opacity(showOverlay ? __designTimeFloat("#7539_78", fallback: 0.65) : __designTimeFloat("#7539_79", fallback: 1.0))
                    .blur(radius: showOverlay ? __designTimeInteger("#7539_80", fallback: 2) : __designTimeInteger("#7539_81", fallback: 0))
                    .animation(.easeInOut(duration: __designTimeFloat("#7539_82", fallback: 0.3)), value: showOverlay)
                }

                Spacer()
            }
        }
        .background(Color(red: __designTimeFloat("#7539_83", fallback: 0.91), green: __designTimeFloat("#7539_84", fallback: 0.82), blue: __designTimeFloat("#7539_85", fallback: 0.63)))
        .ignoresSafeArea(edges: .bottom)
    }
    
    // MARK: - Floating Card
    private var floatingCard: some View {
        Group {
            if currentStep == __designTimeInteger("#7539_86", fallback: 4) {
                if let cardBackImage = UIImage(named: __designTimeString("#7539_87", fallback: "cardback")) {
                    Image(uiImage: cardBackImage)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: __designTimeInteger("#7539_88", fallback: 240) * cardScale)
                        .clipShape(RoundedRectangle(cornerRadius: AppConstants.CornerRadius.cardLarge))
                        .shadow(color: .black.opacity(cardShadowOpacity), radius: cardShadowRadius, x: __designTimeInteger("#7539_89", fallback: 0), y: cardShadowRadius / __designTimeInteger("#7539_90", fallback: 2))
                }
            } else {
                if let uiImage = ImageManager.shared.loadCardImage(for: currentCard) {
                    Image(uiImage: uiImage)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: __designTimeInteger("#7539_91", fallback: 240) * cardScale)
                        .clipShape(RoundedRectangle(cornerRadius: AppConstants.CornerRadius.cardLarge))
                        .shadow(color: .black.opacity(cardShadowOpacity), radius: cardShadowRadius, x: __designTimeInteger("#7539_92", fallback: 0), y: cardShadowRadius / __designTimeInteger("#7539_93", fallback: 2))
                }
            }
        }
        .position(cardPosition)
        .opacity(cardOpacity)
    }

    // MARK: - Tutorial Modal Content
    private var tutorialModalContent: some View {
        ScrollView {
            VStack(spacing: __designTimeInteger("#7539_94", fallback: 25)) {
                if currentStep == __designTimeInteger("#7539_95", fallback: 0) {
                    welcomeScreenContent
                } else {
                    cardTutorialContent
                }
            }
            .padding(.vertical, __designTimeInteger("#7539_96", fallback: 20))
            .padding(.horizontal, __designTimeInteger("#7539_97", fallback: 20))
        }
        .scrollIndicators(.hidden)
        .background(
            GeometryReader { geo in
                RoundedRectangle(cornerRadius: AppConstants.CornerRadius.modal)
                    .fill(Color(red: __designTimeFloat("#7539_98", fallback: 0.86), green: __designTimeFloat("#7539_99", fallback: 0.77), blue: __designTimeFloat("#7539_100", fallback: 0.57)).opacity(__designTimeFloat("#7539_101", fallback: 0.95)))
                    .onAppear {
                        // Modal card position - center in placeholder area
                        let frame = geo.frame(in: .global)
                        modalCardPosition = CGPoint(
                            x: frame.midX,
                            y: frame.minY + __designTimeInteger("#7539_102", fallback: 90)
                        )
                    }
            }
        )
        .cornerRadius(AppConstants.CornerRadius.modal)
        .padding(.horizontal, __designTimeInteger("#7539_103", fallback: 25))
        .padding(.top, __designTimeInteger("#7539_104", fallback: 44))
        .padding(.bottom, __designTimeInteger("#7539_105", fallback: 20))
    }

    // MARK: - Welcome Screen Content
    private var welcomeScreenContent: some View {
        VStack(spacing: __designTimeInteger("#7539_106", fallback: 10)) {
            Spacer()

            if let appLogo = UIImage(named: __designTimeString("#7539_107", fallback: "apptitle")) {
                Image(uiImage: appLogo)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: __designTimeInteger("#7539_108", fallback: 218))
                    .opacity(showWelcomeTitle ? __designTimeInteger("#7539_109", fallback: 1) : __designTimeInteger("#7539_110", fallback: 0))
                    .animation(.easeInOut(duration: __designTimeFloat("#7539_111", fallback: 0.9)), value: showWelcomeTitle)
            }

            Spacer()

            VStack(spacing: __designTimeInteger("#7539_112", fallback: 6)) {
                if let lineImage = UIImage(named: __designTimeString("#7539_113", fallback: "linedesign")) {
                    Image(uiImage: lineImage)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: __designTimeInteger("#7539_114", fallback: 160), height: __designTimeInteger("#7539_115", fallback: 22))
                        .opacity(showWelcomeLineDesign ? __designTimeInteger("#7539_116", fallback: 1) : __designTimeInteger("#7539_117", fallback: 0))
                        .animation(.easeInOut(duration: __designTimeFloat("#7539_118", fallback: 0.7)), value: showWelcomeLineDesign)
                }

                VStack(alignment: .leading, spacing: __designTimeInteger("#7539_119", fallback: 10)) {
                Text(__designTimeString("#7539_120", fallback: "For centuries, The Deck of Cards charted the planet's movements and shaped the archetypal roles that became the foundation for the Tarot and Jung. Like a constellation, Your Cards offer a fixed pattern that you can navigate by."))
                    .font(.custom(__designTimeString("#7539_121", fallback: "Iowan Old Style"), size: __designTimeInteger("#7539_122", fallback: 13)))
                    .tracking(__designTimeFloat("#7539_123", fallback: 0.3))
                    .foregroundColor(.black)
                    .multilineTextAlignment(.leading)

                Text(__designTimeString("#7539_124", fallback: "Cardology isn't designed to predict futures or outcomes. Any meanings you find here are the echoes of your own self-discovery. Interpretations are here for historical reference and entertainment only, never advice."))
                    .font(.custom(__designTimeString("#7539_125", fallback: "Iowan Old Style"), size: __designTimeInteger("#7539_126", fallback: 13)))
                    .tracking(__designTimeFloat("#7539_127", fallback: 0.3))
                    .foregroundColor(.black)
                    .multilineTextAlignment(.leading)

                    Text(__designTimeString("#7539_128", fallback: "The tutorial will introduce The Cards and shows you around. You can access it and more information anytime in the Settings menu."))
                        .font(.custom(__designTimeString("#7539_129", fallback: "Iowan Old Style"), size: __designTimeInteger("#7539_130", fallback: 13)))
                        .tracking(__designTimeFloat("#7539_131", fallback: 0.3))
                        .foregroundColor(.black)
                        .multilineTextAlignment(.leading)
                }
                .padding(.horizontal, __designTimeInteger("#7539_132", fallback: 20))
                .padding(.vertical, __designTimeInteger("#7539_133", fallback: 4))
                .opacity(showWelcomeText ? __designTimeInteger("#7539_134", fallback: 1) : __designTimeInteger("#7539_135", fallback: 0))
                .animation(.easeInOut(duration: __designTimeFloat("#7539_136", fallback: 0.7)), value: showWelcomeText)

                if let lineImageD = UIImage(named: __designTimeString("#7539_137", fallback: "linedesignd")) {
                    Image(uiImage: lineImageD)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: __designTimeInteger("#7539_138", fallback: 160), height: __designTimeInteger("#7539_139", fallback: 22))
                        .opacity(showWelcomeText ? __designTimeInteger("#7539_140", fallback: 1) : __designTimeInteger("#7539_141", fallback: 0))
                        .animation(.easeInOut(duration: __designTimeFloat("#7539_142", fallback: 0.7)), value: showWelcomeText)
                }
            }

            Spacer()

            Button(action: skipTutorial) {
                Text(__designTimeString("#7539_143", fallback: "Skip"))
                    .font(.custom(__designTimeString("#7539_144", fallback: "Iowan Old Style"), size: __designTimeInteger("#7539_145", fallback: 16)))
                    .foregroundColor(.black)
            }
            .opacity(showWelcomeBody ? __designTimeInteger("#7539_146", fallback: 1) : __designTimeInteger("#7539_147", fallback: 0))
            .animation(.easeInOut(duration: __designTimeFloat("#7539_148", fallback: 0.6)), value: showWelcomeBody)
            .padding(.bottom, __designTimeInteger("#7539_149", fallback: 8))

            Button(action: advanceStep) {
                Text(__designTimeString("#7539_150", fallback: "Continue"))
                    .font(.custom(__designTimeString("#7539_151", fallback: "Iowan Old Style"), size: __designTimeInteger("#7539_152", fallback: 18)))
                    .foregroundColor(.white)
                    .padding(.horizontal, __designTimeInteger("#7539_153", fallback: 50))
                    .padding(.vertical, __designTimeInteger("#7539_154", fallback: 12))
                    .background(AppTheme.darkAccent.opacity(__designTimeFloat("#7539_155", fallback: 0.7)))
                    .cornerRadius(AppConstants.CornerRadius.button)
                    .shadow(color: .black.opacity(__designTimeFloat("#7539_156", fallback: 0.15)), radius: __designTimeInteger("#7539_157", fallback: 4), x: __designTimeInteger("#7539_158", fallback: 0), y: __designTimeInteger("#7539_159", fallback: 2))
            }
            .opacity(showWelcomeBody ? __designTimeInteger("#7539_160", fallback: 1) : __designTimeInteger("#7539_161", fallback: 0))
            .animation(.easeInOut(duration: __designTimeFloat("#7539_162", fallback: 0.6)), value: showWelcomeBody)

            Spacer()
                .frame(height: __designTimeInteger("#7539_163", fallback: 15))
        }
    }

    // MARK: - Card Tutorial Content
    private var cardTutorialContent: some View {
        VStack(spacing: __designTimeInteger("#7539_164", fallback: 10)) {
            // Invisible placeholder for card (actual card is floating)
            Color.clear
                .frame(height: __designTimeInteger("#7539_165", fallback: 240))

            Text(tutorialSteps[currentStep].cardTypeHeader)
                .font(.custom(__designTimeString("#7539_166", fallback: "Iowan Old Style"), size: __designTimeInteger("#7539_167", fallback: 22)))
                .foregroundColor(.black)
                .multilineTextAlignment(.center)
                .opacity(showContent ? __designTimeInteger("#7539_168", fallback: 1) : __designTimeInteger("#7539_169", fallback: 0))
                .animation(.easeInOut(duration: __designTimeFloat("#7539_170", fallback: 0.4)), value: showContent)
                .padding(.top, __designTimeInteger("#7539_171", fallback: 20))

            Spacer()
                .frame(height: __designTimeInteger("#7539_172", fallback: 15))

            // Text content
            VStack(spacing: __designTimeInteger("#7539_173", fallback: 6)) {
                if let lineImage = UIImage(named: __designTimeString("#7539_174", fallback: "linedesign")) {
                    Image(uiImage: lineImage)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: __designTimeInteger("#7539_175", fallback: 120), height: __designTimeInteger("#7539_176", fallback: 22))
                }

                Text(tutorialSteps[currentStep].description)
                    .font(.custom(__designTimeString("#7539_177", fallback: "Iowan Old Style"), size: __designTimeInteger("#7539_178", fallback: 18)))
                    .tracking(__designTimeFloat("#7539_179", fallback: 0.8))
                    .foregroundColor(.black)
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal, __designTimeInteger("#7539_180", fallback: 25))
                    .padding(.vertical, __designTimeInteger("#7539_181", fallback: 4))

                if let lineImageD = UIImage(named: __designTimeString("#7539_182", fallback: "linedesignd")) {
                    Image(uiImage: lineImageD)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: __designTimeInteger("#7539_183", fallback: 120), height: __designTimeInteger("#7539_184", fallback: 22))
                }
            }
            .opacity(showContent ? __designTimeInteger("#7539_185", fallback: 1) : __designTimeInteger("#7539_186", fallback: 0))
            .animation(.easeInOut(duration: __designTimeFloat("#7539_187", fallback: 0.4)), value: showContent)

            Spacer()

            // Settings text for final tile
            if currentStep == __designTimeInteger("#7539_188", fallback: 4) {
                Text(__designTimeString("#7539_189", fallback: "To learn more about the Cards, or to revisit this tutorial, go to Settings."))
                    .font(.custom(__designTimeString("#7539_190", fallback: "Iowan Old Style"), size: __designTimeInteger("#7539_191", fallback: 16)))
                    .foregroundColor(.black)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, __designTimeInteger("#7539_192", fallback: 30))
                    .padding(.bottom, __designTimeInteger("#7539_193", fallback: 20))
                    .opacity(showSettingsText ? __designTimeInteger("#7539_194", fallback: 1) : __designTimeInteger("#7539_195", fallback: 0))
                    .animation(.easeInOut(duration: __designTimeFloat("#7539_196", fallback: 0.4)), value: showSettingsText)
            }

            VStack(spacing: __designTimeInteger("#7539_197", fallback: 8)) {
                // Skip button centered above Continue (hidden on final tile)
                if currentStep < __designTimeInteger("#7539_198", fallback: 4) {
                    Button(action: skipTutorial) {
                        Text(__designTimeString("#7539_199", fallback: "Skip"))
                            .font(.custom(__designTimeString("#7539_200", fallback: "Iowan Old Style"), size: __designTimeInteger("#7539_201", fallback: 16)))
                            .foregroundColor(.black)
                    }
                    .padding(.bottom, __designTimeInteger("#7539_202", fallback: 5))
                }

                // Continue/Begin button
                Button(action: advanceStep) {
                    Text(currentStep < __designTimeInteger("#7539_203", fallback: 4) ? __designTimeString("#7539_204", fallback: "Continue") : __designTimeString("#7539_205", fallback: "Begin"))
                        .font(.custom(__designTimeString("#7539_206", fallback: "Iowan Old Style"), size: __designTimeInteger("#7539_207", fallback: 18)))
                        .foregroundColor(.white)
                        .padding(.horizontal, __designTimeInteger("#7539_208", fallback: 50))
                        .padding(.vertical, __designTimeInteger("#7539_209", fallback: 12))
                        .background(currentStep == __designTimeInteger("#7539_210", fallback: 4) ? AppTheme.darkAccent : AppTheme.darkAccent.opacity(__designTimeFloat("#7539_211", fallback: 0.7)))
                        .cornerRadius(AppConstants.CornerRadius.button)
                        .shadow(color: .black.opacity(currentStep == __designTimeInteger("#7539_212", fallback: 4) ? __designTimeFloat("#7539_213", fallback: 0.2) : __designTimeFloat("#7539_214", fallback: 0.15)), radius: currentStep == __designTimeInteger("#7539_215", fallback: 4) ? __designTimeInteger("#7539_216", fallback: 6) : __designTimeInteger("#7539_217", fallback: 4), x: __designTimeInteger("#7539_218", fallback: 0), y: __designTimeInteger("#7539_219", fallback: 2))
                }

                // Progress dots with back button
                HStack(spacing: __designTimeInteger("#7539_220", fallback: 20)) {
                    // Back button - always present but invisible when not needed
                    Group {
                        if currentStep > __designTimeInteger("#7539_221", fallback: 1) {
                            Button(action: goBack) {
                                HStack(spacing: __designTimeInteger("#7539_222", fallback: 4)) {
                                    Image(systemName: __designTimeString("#7539_223", fallback: "chevron.left"))
                                        .font(.system(size: __designTimeInteger("#7539_224", fallback: 14), weight: .semibold))
                                    Text(__designTimeString("#7539_225", fallback: "Back"))
                                        .font(.custom(__designTimeString("#7539_226", fallback: "Iowan Old Style"), size: __designTimeInteger("#7539_227", fallback: 16)))
                                }
                                .foregroundColor(.black)
                            }
                            .disabled(isTransitioning)
                        } else {
                            // Invisible spacer
                            HStack(spacing: __designTimeInteger("#7539_228", fallback: 4)) {
                                Image(systemName: __designTimeString("#7539_229", fallback: "chevron.left"))
                                    .font(.system(size: __designTimeInteger("#7539_230", fallback: 14), weight: .semibold))
                                Text(__designTimeString("#7539_231", fallback: "Back"))
                                    .font(.custom(__designTimeString("#7539_232", fallback: "Iowan Old Style"), size: __designTimeInteger("#7539_233", fallback: 16)))
                            }
                            .foregroundColor(.clear)
                        }
                    }
                    .frame(width: __designTimeInteger("#7539_234", fallback: 50))

                    // Progress dots
                    HStack(spacing: __designTimeInteger("#7539_235", fallback: 8)) {
                        ForEach(__designTimeInteger("#7539_236", fallback: 1)..<__designTimeInteger("#7539_237", fallback: 5), id: \.self) { index in
                            Circle()
                                .fill(index == currentStep ? Color.black : Color.black.opacity(__designTimeFloat("#7539_238", fallback: 0.15)))
                                .frame(width: __designTimeInteger("#7539_239", fallback: 8), height: __designTimeInteger("#7539_240", fallback: 8))
                                .scaleEffect(index == currentStep ? __designTimeFloat("#7539_241", fallback: 1.4) : __designTimeFloat("#7539_242", fallback: 1.0))
                                .animation(.spring(response: __designTimeFloat("#7539_243", fallback: 0.3), dampingFraction: __designTimeFloat("#7539_244", fallback: 0.7)), value: currentStep)
                        }
                    }

                    // Right spacer for symmetry
                    Color.clear.frame(width: __designTimeInteger("#7539_245", fallback: 50))
                }
                .padding(.top, __designTimeInteger("#7539_246", fallback: 4))
            }
            .opacity(showButtons ? __designTimeInteger("#7539_247", fallback: 1) : __designTimeInteger("#7539_248", fallback: 0))
            .animation(.easeInOut(duration: __designTimeFloat("#7539_249", fallback: 0.4)), value: showButtons)

            Spacer()
                .frame(height: __designTimeInteger("#7539_250", fallback: 20))
        }
    }

    // MARK: - Helper Functions
    private func startTutorial() {
        if currentStep == __designTimeInteger("#7539_251", fallback: 0) {
            // Wait 2 seconds to let users absorb the background cards, then show modal with dimming
            DispatchQueue.main.asyncAfter(deadline: .now() + __designTimeFloat("#7539_252", fallback: 2.0)) {
                withAnimation(.easeInOut(duration: __designTimeFloat("#7539_253", fallback: 0.6))) {
                    showOverlay = __designTimeBoolean("#7539_254", fallback: true)
                    backgroundOpacity = __designTimeFloat("#7539_255", fallback: 0.65)
                }

                // 1. App Logo fades in
                DispatchQueue.main.asyncAfter(deadline: .now() + __designTimeFloat("#7539_256", fallback: 0.4)) {
                    withAnimation(.easeInOut(duration: __designTimeFloat("#7539_257", fallback: 0.9))) {
                        showWelcomeTitle = __designTimeBoolean("#7539_258", fallback: true)
                    }
                }

                // 2. Line design fades in
                DispatchQueue.main.asyncAfter(deadline: .now() + __designTimeFloat("#7539_259", fallback: 1.1)) {
                    withAnimation(.easeInOut(duration: __designTimeFloat("#7539_260", fallback: 0.7))) {
                        showWelcomeLineDesign = __designTimeBoolean("#7539_261", fallback: true)
                    }
                }

                // 3. Text fades in
                DispatchQueue.main.asyncAfter(deadline: .now() + __designTimeFloat("#7539_262", fallback: 1.6)) {
                    withAnimation(.easeInOut(duration: __designTimeFloat("#7539_263", fallback: 0.7))) {
                        showWelcomeText = __designTimeBoolean("#7539_264", fallback: true)
                    }
                }

                // 4. Buttons fade in
                DispatchQueue.main.asyncAfter(deadline: .now() + __designTimeFloat("#7539_265", fallback: 2.1)) {
                    withAnimation(.easeInOut(duration: __designTimeFloat("#7539_266", fallback: 0.6))) {
                        showWelcomeBody = __designTimeBoolean("#7539_267", fallback: true)
                    }
                }
            }
        }
    }

    private func skipTutorial() {
        guard !isTransitioning else { return }
        isTransitioning = __designTimeBoolean("#7539_268", fallback: true)

        withAnimation(.easeOut(duration: __designTimeFloat("#7539_269", fallback: 0.3))) {
            showWelcomeTitle = __designTimeBoolean("#7539_270", fallback: false)
            showWelcomeLineDesign = __designTimeBoolean("#7539_271", fallback: false)
            showWelcomeText = __designTimeBoolean("#7539_272", fallback: false)
            showWelcomeBody = __designTimeBoolean("#7539_273", fallback: false)
            showContent = __designTimeBoolean("#7539_274", fallback: false)
            showSettingsText = __designTimeBoolean("#7539_275", fallback: false)
            showButtons = __designTimeBoolean("#7539_276", fallback: false)
            cardOpacity = __designTimeInteger("#7539_277", fallback: 0)
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + __designTimeFloat("#7539_278", fallback: 0.3)) {
            withAnimation(.easeInOut(duration: __designTimeFloat("#7539_279", fallback: 0.4))) {
                backgroundOpacity = __designTimeInteger("#7539_280", fallback: 0)
            }

            DispatchQueue.main.asyncAfter(deadline: .now() + __designTimeFloat("#7539_281", fallback: 0.4)) {
                showFloatingCard = __designTimeBoolean("#7539_282", fallback: false)
                withAnimation(.spring(response: __designTimeFloat("#7539_283", fallback: 0.6), dampingFraction: __designTimeFloat("#7539_284", fallback: 0.8))) {
                    showOverlay = __designTimeBoolean("#7539_285", fallback: false)
                }

                DispatchQueue.main.asyncAfter(deadline: .now() + __designTimeFloat("#7539_286", fallback: 0.6)) {
                    isPresented = __designTimeBoolean("#7539_287", fallback: false)
                    onComplete()
                }
            }
        }
    }

    private var currentCard: Card {
        switch currentStep {
        case 1: return birthCard
        case 2: return solarCard
        case 3: return astralCard
        default: return dailyCard
        }
    }
    
    private func sourceCardFrame(for step: Int) -> CGRect {
        switch step {
        case 1: return birthCardFrame
        case 2: return solarCardFrame
        case 3: return astralCardFrame
        case 4: return dailyCardFrame
        default: return .zero
        }
    }
    
    private func animateCardTransition(to nextStep: Int) {
        let sourceFrame = sourceCardFrame(for: nextStep)

        // Ensure we have a valid frame
        guard sourceFrame != .zero else {
            print("⚠️ Warning: Card frame is zero for step \(nextStep)")
            return
        }

        // Skip pulse for daily card (step 4), use pulse for small cards (1-3)
        if nextStep == __designTimeInteger("#7539_288", fallback: 4) {
            // Daily card: no pulse, start animation immediately
            let sourceHeight = sourceFrame.height
            let targetHeight: CGFloat = __designTimeInteger("#7539_289", fallback: 240)

            // Start card at background position - offset to match visual position
            let yOffset: CGFloat = __designTimeInteger("#7539_290", fallback: -217)
            cardPosition = CGPoint(x: sourceFrame.midX, y: sourceFrame.midY + yOffset)
            cardScale = sourceHeight / targetHeight
            cardOpacity = __designTimeInteger("#7539_291", fallback: 1)
            cardShadowRadius = __designTimeInteger("#7539_292", fallback: 5)  // Small shadow to match background cards
            cardShadowOpacity = __designTimeFloat("#7539_293", fallback: 0.2)
            showFloatingCard = __designTimeBoolean("#7539_294", fallback: true)

            print("🎴 Starting animation for step \(nextStep)")
            print("   Source: \(sourceFrame)")
            print("   Target: \(modalCardPosition)")
            print("   Scale: \(sourceHeight / targetHeight) -> 1.0")

            // Start card movement and overlay fade in simultaneously
            withAnimation(.easeOut(duration: __designTimeFloat("#7539_295", fallback: 0.5))) {
                showOverlay = __designTimeBoolean("#7539_296", fallback: true)
            }

            DispatchQueue.main.asyncAfter(deadline: .now() + __designTimeFloat("#7539_297", fallback: 0.1)) {
                withAnimation(.spring(response: __designTimeFloat("#7539_298", fallback: 0.7), dampingFraction: __designTimeFloat("#7539_299", fallback: 0.8))) {
                    cardPosition = modalCardPosition
                    cardScale = __designTimeFloat("#7539_300", fallback: 1.0)
                    cardShadowRadius = __designTimeInteger("#7539_301", fallback: 12)  // Larger shadow for modal card
                    cardShadowOpacity = __designTimeFloat("#7539_302", fallback: 0.3)
                }

                // Fade in background during animation
                DispatchQueue.main.asyncAfter(deadline: .now() + __designTimeFloat("#7539_303", fallback: 0.3)) {
                    withAnimation(.easeInOut(duration: __designTimeFloat("#7539_304", fallback: 0.6))) {
                        backgroundOpacity = __designTimeFloat("#7539_305", fallback: 0.65)
                    }
                }

                // Show content while card is still settling
                DispatchQueue.main.asyncAfter(deadline: .now() + __designTimeFloat("#7539_306", fallback: 0.4)) {
                    withAnimation(.easeInOut(duration: __designTimeFloat("#7539_307", fallback: 0.4))) {
                        showContent = __designTimeBoolean("#7539_308", fallback: true)
                    }

                    DispatchQueue.main.asyncAfter(deadline: .now() + __designTimeFloat("#7539_309", fallback: 0.4)) {
                        isTransitioning = __designTimeBoolean("#7539_310", fallback: false)
                    }
                }

                // Fade in buttons after card animation completes
                DispatchQueue.main.asyncAfter(deadline: .now() + __designTimeFloat("#7539_311", fallback: 1.2)) {
                    withAnimation(.easeInOut(duration: __designTimeFloat("#7539_312", fallback: 0.4))) {
                        showButtons = __designTimeBoolean("#7539_313", fallback: true)
                    }

                    // Show settings text after buttons for step 4
                    DispatchQueue.main.asyncAfter(deadline: .now() + __designTimeFloat("#7539_314", fallback: 0.5)) {
                        withAnimation(.easeInOut(duration: __designTimeFloat("#7539_315", fallback: 0.4))) {
                            showSettingsText = __designTimeBoolean("#7539_316", fallback: true)
                        }
                    }
                }
            }
        } else {
            // Small cards: use pulse effect
            highlightedCardStep = nextStep

            // Wait for pulse to complete before starting card animation
            let pulseDelay: Double = __designTimeFloat("#7539_317", fallback: 0.5)
            DispatchQueue.main.asyncAfter(deadline: .now() + pulseDelay) {
                highlightedCardStep = nil

                // Show overlay after pulse completes
                withAnimation(.easeOut(duration: __designTimeFloat("#7539_318", fallback: 0.5))) {
                    showOverlay = __designTimeBoolean("#7539_319", fallback: true)
                }

                let sourceHeight = sourceFrame.height
                let targetHeight: CGFloat = __designTimeInteger("#7539_320", fallback: 240)

                // Start card at background position - offset to match visual position
                let yOffset: CGFloat = __designTimeInteger("#7539_321", fallback: -62)
                cardPosition = CGPoint(x: sourceFrame.midX, y: sourceFrame.midY + yOffset)
                cardScale = sourceHeight / targetHeight
                cardOpacity = __designTimeInteger("#7539_322", fallback: 1)
                cardShadowRadius = __designTimeInteger("#7539_323", fallback: 5)  // Small shadow to match background cards
                cardShadowOpacity = __designTimeFloat("#7539_324", fallback: 0.2)
                showFloatingCard = __designTimeBoolean("#7539_325", fallback: true)

                print("🎴 Starting animation for step \(nextStep)")
                print("   Source: \(sourceFrame)")
                print("   Target: \(modalCardPosition)")
                print("   Scale: \(sourceHeight / targetHeight) -> 1.0")

                // Slower, more gradual animation for first slide
                let animationDuration: Double = nextStep == __designTimeInteger("#7539_326", fallback: 1) ? __designTimeFloat("#7539_327", fallback: 1.0) : __designTimeFloat("#7539_328", fallback: 0.7)
                let animationDelay: Double = __designTimeFloat("#7539_329", fallback: 0.1)

                // Animate to modal position with proper timing
                DispatchQueue.main.asyncAfter(deadline: .now() + animationDelay) {
                    withAnimation(.spring(response: __designTimeFloat("#7539_330", fallback: 0.7), dampingFraction: __designTimeFloat("#7539_331", fallback: 0.8))) {
                        cardPosition = modalCardPosition
                        cardScale = __designTimeFloat("#7539_332", fallback: 1.0)
                        cardShadowRadius = __designTimeInteger("#7539_333", fallback: 12)  // Larger shadow for modal card
                        cardShadowOpacity = __designTimeFloat("#7539_334", fallback: 0.3)
                    }

                    // Fade in background during animation
                    DispatchQueue.main.asyncAfter(deadline: .now() + __designTimeFloat("#7539_335", fallback: 0.3)) {
                        withAnimation(.easeInOut(duration: __designTimeFloat("#7539_336", fallback: 0.6))) {
                            backgroundOpacity = __designTimeFloat("#7539_337", fallback: 0.65)
                        }
                    }

                    // Show content while card is still settling (earlier for smoother transition)
                    let contentFadeDelay = nextStep == __designTimeInteger("#7539_338", fallback: 1) ? __designTimeFloat("#7539_339", fallback: 0.9) : __designTimeFloat("#7539_340", fallback: 0.4)
                    DispatchQueue.main.asyncAfter(deadline: .now() + contentFadeDelay) {
                        withAnimation(.easeInOut(duration: __designTimeFloat("#7539_341", fallback: 0.4))) {
                            showContent = __designTimeBoolean("#7539_342", fallback: true)
                        }

                        DispatchQueue.main.asyncAfter(deadline: .now() + __designTimeFloat("#7539_343", fallback: 0.4)) {
                            isTransitioning = __designTimeBoolean("#7539_344", fallback: false)
                        }
                    }

                    // Fade in buttons after card animation completes
                    let buttonFadeDelay = animationDuration + __designTimeFloat("#7539_345", fallback: 0.2)
                    DispatchQueue.main.asyncAfter(deadline: .now() + buttonFadeDelay) {
                        withAnimation(.easeInOut(duration: __designTimeFloat("#7539_346", fallback: 0.4))) {
                            showButtons = __designTimeBoolean("#7539_347", fallback: true)
                        }
                    }
                }
            }
        }
    }

    private func advanceStep() {
        guard !isTransitioning else { return }
        isTransitioning = __designTimeBoolean("#7539_348", fallback: true)

        if currentStep == __designTimeInteger("#7539_349", fallback: 0) {
            // Slower transition for first slide
            // Phase 1: Fade out welcome content
            withAnimation(.easeOut(duration: __designTimeFloat("#7539_350", fallback: 0.4))) {
                showWelcomeTitle = __designTimeBoolean("#7539_351", fallback: false)
                showWelcomeLineDesign = __designTimeBoolean("#7539_352", fallback: false)
                showWelcomeText = __designTimeBoolean("#7539_353", fallback: false)
                showWelcomeBody = __designTimeBoolean("#7539_354", fallback: false)
            }

            // Phase 2: Fade out background (overlap with content fade for smooth transition)
            DispatchQueue.main.asyncAfter(deadline: .now() + __designTimeFloat("#7539_355", fallback: 0.25)) {
                withAnimation(.easeInOut(duration: __designTimeFloat("#7539_356", fallback: 0.5))) {
                    backgroundOpacity = __designTimeInteger("#7539_357", fallback: 0)
                }

                // Phase 3: Hide overlay - give user time to see home view
                DispatchQueue.main.asyncAfter(deadline: .now() + __designTimeFloat("#7539_358", fallback: 0.5)) {
                    withAnimation(.spring(response: __designTimeFloat("#7539_359", fallback: 0.8), dampingFraction: __designTimeFloat("#7539_360", fallback: 1.0))) {
                        showOverlay = __designTimeBoolean("#7539_361", fallback: false)
                    }

                    // Phase 4: Wait longer before showing first card
                    DispatchQueue.main.asyncAfter(deadline: .now() + __designTimeFloat("#7539_362", fallback: 1.0)) {
                        currentStep = __designTimeInteger("#7539_363", fallback: 1)

                        DispatchQueue.main.asyncAfter(deadline: .now() + __designTimeFloat("#7539_364", fallback: 0.2)) {
                            // Overlay will be shown inside animateCardTransition after pulse
                            animateCardTransition(to: __designTimeInteger("#7539_365", fallback: 1))
                        }
                    }
                }
            }
        } else if currentStep < __designTimeInteger("#7539_366", fallback: 4) {
            // Phase 1: Fade out content
            withAnimation(.easeOut(duration: __designTimeFloat("#7539_367", fallback: 0.2))) {
                showContent = __designTimeBoolean("#7539_368", fallback: false)
                showSettingsText = __designTimeBoolean("#7539_369", fallback: false)
                showButtons = __designTimeBoolean("#7539_370", fallback: false)
            }

            // Phase 2: Fade out background
            DispatchQueue.main.asyncAfter(deadline: .now() + __designTimeFloat("#7539_371", fallback: 0.2)) {
                withAnimation(.easeInOut(duration: __designTimeFloat("#7539_372", fallback: 0.4))) {
                    backgroundOpacity = __designTimeInteger("#7539_373", fallback: 0)
                }

                // Phase 3: Animate card back to background and hide overlay
                DispatchQueue.main.asyncAfter(deadline: .now() + __designTimeFloat("#7539_374", fallback: 0.4)) {
                    let currentFrame = sourceCardFrame(for: currentStep)
                    let returnOffset: CGFloat = currentStep == __designTimeInteger("#7539_375", fallback: 4) ? __designTimeInteger("#7539_376", fallback: -217) : __designTimeInteger("#7539_377", fallback: -62)

                    withAnimation(.spring(response: __designTimeFloat("#7539_378", fallback: 0.8), dampingFraction: __designTimeFloat("#7539_379", fallback: 1.0))) {
                        cardPosition = CGPoint(x: currentFrame.midX, y: currentFrame.midY + returnOffset)
                        cardScale = currentFrame.height / __designTimeInteger("#7539_380", fallback: 240)
                        cardShadowRadius = __designTimeInteger("#7539_381", fallback: 5)  // Return to small shadow
                        cardShadowOpacity = __designTimeFloat("#7539_382", fallback: 0.2)
                        showOverlay = __designTimeBoolean("#7539_383", fallback: false)
                    }

                    // Phase 4: Wait for card to reach background, then transition
                    DispatchQueue.main.asyncAfter(deadline: .now() + __designTimeFloat("#7539_384", fallback: 1.0)) {
                        showFloatingCard = __designTimeBoolean("#7539_385", fallback: false)
                        let nextStep = currentStep + __designTimeInteger("#7539_386", fallback: 1)
                        currentStep = nextStep
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + __designTimeFloat("#7539_387", fallback: 0.1)) {
                            // Overlay will be shown inside animateCardTransition after pulse
                            animateCardTransition(to: nextStep)
                        }
                    }
                }
            }
        } else {
            // Final step - close tutorial
            withAnimation(.easeOut(duration: __designTimeFloat("#7539_388", fallback: 0.3))) {
                showContent = __designTimeBoolean("#7539_389", fallback: false)
                showSettingsText = __designTimeBoolean("#7539_390", fallback: false)
                showButtons = __designTimeBoolean("#7539_391", fallback: false)
                cardOpacity = __designTimeInteger("#7539_392", fallback: 0)
            }

            DispatchQueue.main.asyncAfter(deadline: .now() + __designTimeFloat("#7539_393", fallback: 0.3)) {
                withAnimation(.easeInOut(duration: __designTimeFloat("#7539_394", fallback: 0.4))) {
                    backgroundOpacity = __designTimeInteger("#7539_395", fallback: 0)
                }

                DispatchQueue.main.asyncAfter(deadline: .now() + __designTimeFloat("#7539_396", fallback: 0.4)) {
                    showFloatingCard = __designTimeBoolean("#7539_397", fallback: false)
                    withAnimation(.spring(response: __designTimeFloat("#7539_398", fallback: 0.8), dampingFraction: __designTimeFloat("#7539_399", fallback: 1.0))) {
                        showOverlay = __designTimeBoolean("#7539_400", fallback: false)
                    }

                    DispatchQueue.main.asyncAfter(deadline: .now() + __designTimeFloat("#7539_401", fallback: 0.8)) {
                        isPresented = __designTimeBoolean("#7539_402", fallback: false)
                        onComplete()
                    }
                }
            }
        }
    }
    
    private func goBack() {
        guard !isTransitioning && currentStep > __designTimeInteger("#7539_403", fallback: 1) else { return }
        isTransitioning = __designTimeBoolean("#7539_404", fallback: true)

        // Fade out content
        withAnimation(.easeOut(duration: __designTimeFloat("#7539_405", fallback: 0.2))) {
            showContent = __designTimeBoolean("#7539_406", fallback: false)
            showSettingsText = __designTimeBoolean("#7539_407", fallback: false)
            showButtons = __designTimeBoolean("#7539_408", fallback: false)
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + __designTimeFloat("#7539_409", fallback: 0.2)) {
            withAnimation(.easeInOut(duration: __designTimeFloat("#7539_410", fallback: 0.4))) {
                backgroundOpacity = __designTimeInteger("#7539_411", fallback: 0)
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + __designTimeFloat("#7539_412", fallback: 0.4)) {
                let currentFrame = sourceCardFrame(for: currentStep)
                let returnOffset: CGFloat = currentStep == __designTimeInteger("#7539_413", fallback: 4) ? __designTimeInteger("#7539_414", fallback: -217) : __designTimeInteger("#7539_415", fallback: -62)

                withAnimation(.spring(response: __designTimeFloat("#7539_416", fallback: 0.8), dampingFraction: __designTimeFloat("#7539_417", fallback: 1.0))) {
                    cardPosition = CGPoint(x: currentFrame.midX, y: currentFrame.midY + returnOffset)
                    cardScale = currentFrame.height / __designTimeInteger("#7539_418", fallback: 240)
                    cardShadowRadius = __designTimeInteger("#7539_419", fallback: 5)  // Return to small shadow
                    cardShadowOpacity = __designTimeFloat("#7539_420", fallback: 0.2)
                    showOverlay = __designTimeBoolean("#7539_421", fallback: false)
                }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + __designTimeFloat("#7539_422", fallback: 1.0)) {
                    showFloatingCard = __designTimeBoolean("#7539_423", fallback: false)
                    let previousStep = currentStep - __designTimeInteger("#7539_424", fallback: 1)
                    currentStep = previousStep
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + __designTimeFloat("#7539_425", fallback: 0.1)) {
                        withAnimation(.spring(response: __designTimeFloat("#7539_426", fallback: 0.8), dampingFraction: __designTimeFloat("#7539_427", fallback: 1.0))) {
                            showOverlay = __designTimeBoolean("#7539_428", fallback: true)
                        }
                        
                        animateCardTransition(to: previousStep)
                    }
                }
            }
        }
    }
}

struct TutorialStep {
    let cardTypeHeader: String
    let description: String
}
