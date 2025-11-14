import func SwiftUI.__designTimeFloat
import func SwiftUI.__designTimeString
import func SwiftUI.__designTimeInteger
import func SwiftUI.__designTimeBoolean

#sourceLocation(file: "/Users/impriints/Downloads/COTSS_PreBoldRemoval_MyCopy/CardsofTheSevenSisters/Views/birthcardview.swift", line: 1)
import SwiftUI

struct BirthCardView: View {
    @StateObject private var dataManager = DataManager.shared
    @StateObject private var calculator = CardCalculationService()
    @Environment(\.presentationMode) var presentationMode
    @State private var showCardDetail = false
    @State private var detailCard: Card? = nil
    @State private var isKarmaCard = false
    @State private var karmaDescription = ""
    
    private var userCalendar: Calendar {
        var calendar = Calendar.current
        calendar.timeZone = TimeZone.current
        return calendar
    }
    
    private var birthCard: Card {
        let components = userCalendar.dateComponents([.month, .day], from: dataManager.userProfile.birthDate)
        let cardId = BirthCardLookup.shared.calculateCardForDate(
            monthValue: components.month ?? __designTimeInteger("#7035_0", fallback: 1),
            dayValue: components.day ?? __designTimeInteger("#7035_1", fallback: 1)
        )
        return dataManager.getCard(by: cardId)
    }
    
    // Backed by karma_cards.json through DataManager – same call you already use
    private var karmaConnections: [KarmaConnection] {
        dataManager.getKarmaConnections(for: birthCard.id)
    }
    
    /// All "first karma" card IDs for this birth card (karmaConnections[0])
    private var karma1CardIds: [Int] {
        guard let firstConnection = karmaConnections.first else { return [] }
        return firstConnection.cards
    }
    
    /// All "second karma" card IDs for this birth card (karmaConnections[1], if present)
    private var karma2CardIds: [Int] {
        guard karmaConnections.count > __designTimeInteger("#7035_2", fallback: 1) else { return [] }
        return karmaConnections[__designTimeInteger("#7035_3", fallback: 1)].cards
    }
    
    /// All karma cards (KC1 + KC2) as Card models
    private var allKarmaCards: [Card] {
        let ids = karma1CardIds + karma2CardIds
        return ids.compactMap { dataManager.getCard(by: $0) }
    }

    private var birthCardTitle: String {
        if let def = getCardDefinition(by: birthCard.id) {
            return def.name
        }
        return birthCard.name
    }

    private var birthCardDescription: String {
        let repo = DescriptionRepository.shared
        return repo.birthDescriptions[String(birthCard.id)] ?? __designTimeString("#7035_4", fallback: "No description available.")
    }

    private var birthDateString: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .none
        return formatter.string(from: dataManager.userProfile.birthDate)
    }

    /// Card used in the trailing share button:
    /// prefer the first KC1 card, otherwise any karma card.
    private var firstKarmaCard: Card? {
        if let firstId = karma1CardIds.first {
            return dataManager.getCard(by: firstId)
        }
        return allKarmaCards.first
    }

    private var karmaCardTitle: String {
        guard let karmaCard = firstKarmaCard else { return __designTimeString("#7035_5", fallback: "") }
        if let def = getCardDefinition(by: karmaCard.id) {
            return def.name
        }
        return karmaCard.name
    }

    private var karmaCardDescription: String {
        guard let karmaCard = firstKarmaCard else { return __designTimeString("#7035_6", fallback: "") }
        let repo = DescriptionRepository.shared
        let cardId = String(karmaCard.id)
        
        if karma1CardIds.contains(karmaCard.id),
           let desc = repo.karmaCard1Descriptions[cardId] {
            return desc
        }
        if karma2CardIds.contains(karmaCard.id),
           let desc = repo.karmaCard2Descriptions[cardId] {
            return desc
        }
        return __designTimeString("#7035_7", fallback: "No description available.")
    }
    
    var body: some View {
        ZStack {
            Color(red: __designTimeFloat("#7035_8", fallback: 0.86), green: __designTimeFloat("#7035_9", fallback: 0.77), blue: __designTimeFloat("#7035_10", fallback: 0.57))
                .ignoresSafeArea(.all)
            
            ScrollView {
                VStack(spacing: AppConstants.Spacing.sectionSpacing) {
                    
                    mainTitleSection
                    birthCardSection
                    
                    if !allKarmaCards.isEmpty {
                        karmaConnectionsSection
                    }
                    
                    // Closing line at bottom of the page
                    if !allKarmaCards.isEmpty {
                        LineBreak(__designTimeString("#7035_11", fallback: "linedesignd"))
                            .frame(width: UIScreen.main.bounds.width * __designTimeFloat("#7035_12", fallback: 0.65))
                            .padding(.top, AppConstants.Spacing.sectionSpacing / __designTimeInteger("#7035_13", fallback: 2))   // space after whatever is above
                            .padding(.bottom, AppConstants.Spacing.large)             // nice bottom margin
                    }
                }
                .padding(.horizontal, AppConstants.Spacing.medium)
                .padding(.vertical, AppConstants.Spacing.large)

            }
            
            if showCardDetail, let card = detailCard {
                CardDetailModalView(
                    card: card,
                    cardType: .birth,
                    contentType: isKarmaCard ? .karma(karmaDescription) : nil,
                    isPresented: $showCardDetail
                )
                .zIndex(__designTimeInteger("#7035_14", fallback: 10))
                .id("\(card.id)-\(isKarmaCard ? karmaDescription : __designTimeString("#7035_15", fallback: "standard"))")
            }
        }
        .standardNavigation(
            title: __designTimeString("#7035_16", fallback: "Birth Card"),
            backAction: {
                if showCardDetail {
                    withAnimation(.spring(
                        response: AppConstants.Animation.springResponse,
                        dampingFraction: AppConstants.Animation.springDamping
                    )) {
                        showCardDetail = __designTimeBoolean("#7035_17", fallback: false)
                    }
                } else {
                    presentationMode.wrappedValue.dismiss()
                }
            },
            trailingContent: {
                AnyView(
                    Group {
                        if let karmaCard = firstKarmaCard {
                            BirthCardWithKarmaShareLink(
                                birthCard: birthCard,
                                birthCardTitle: birthCardTitle,
                                birthCardDescription: birthCardDescription,
                                karmaCard: karmaCard,
                                karmaCardTitle: karmaCardTitle,
                                karmaCardDescription: karmaCardDescription,
                                birthDate: dataManager.userProfile.birthDate,
                                userName: dataManager.userProfile.name
                            )
                        } else {
                            SingleCardShareLink(
                                card: birthCard,
                                cardTitle: birthCardTitle,
                                cardDescription: birthCardDescription,
                                readingType: __designTimeString("#7035_18", fallback: "Birth Card"),
                                subtitle: birthDateString
                            )
                        }
                    }
                )
            }
        )
    }
    
    private var mainTitleSection: some View {
        VStack(spacing: AppConstants.Spacing.titleSpacing) {
            SectionHeader(
                birthCard.name.uppercased(),
                fontSize: AppConstants.FontSizes.large
            )
            
            if let def = getCardDefinition(by: birthCard.id) {
                Text(def.title.lowercased())
                    .font(.custom(__designTimeString("#7035_19", fallback: "Iowan Old Style"), size: AppConstants.FontSizes.subheadline))
                    .foregroundColor(.black)
                    .multilineTextAlignment(.center)
            }
        }
        .padding(.top, AppConstants.Spacing.small)
    }
    
    private var birthCardSection: some View {
        HStack(spacing: AppConstants.Spacing.cardSpacing) {
            Spacer()
            TappableCard(
                card: birthCard,
                size: AppConstants.CardSizes.large,
                action: showBirthCard
            )
            Spacer()
        }
    }
    
    // MARK: - Karmic Connections Layout
    
    private var karmaConnectionsSection: some View {
        let width = UIScreen.main.bounds.width
        let horizontalPadding = width * __designTimeFloat("#7035_20", fallback: 0.06)   // slightly wider than 0.08
        let interCardSpacing  = width * __designTimeFloat("#7035_21", fallback: 0.04)

        // How much space between First block and Second block
        let blockSpacing: CGFloat = AppConstants.Spacing.sectionSpacing

        // How much space between line ↔ title ↔ cards *inside* each block
        let innerSpacing: CGFloat = __designTimeInteger("#7035_22", fallback: 10)  // make this smaller/bigger to taste

        let firstKarmaCards  = karma1CardIds.compactMap { dataManager.getCard(by: $0) }
        let secondKarmaCards = karma2CardIds.compactMap { dataManager.getCard(by: $0) }

        // Only keep placements that actually have cards
        let placements: [(title: String, cards: [Card])] = [
            (__designTimeString("#7035_23", fallback: "First Karma Card"), firstKarmaCards),
            (__designTimeString("#7035_24", fallback: "Second Karma Card"), secondKarmaCards)
        ].filter { !$0.cards.isEmpty }

        return VStack(spacing: blockSpacing) {
            ForEach(Array(placements.enumerated()), id: \.offset) { _, placement in
                // This inner VStack controls: line → title → cards spacing
                VStack(spacing: innerSpacing) {
                    LineBreak(__designTimeString("#7035_25", fallback: "linedesign"))
                        .frame(width: width * __designTimeFloat("#7035_26", fallback: 0.70))

                    Text(placement.title)
                        .font(.custom(__designTimeString("#7035_27", fallback: "Iowan Old Style"), size: AppConstants.FontSizes.dynamicHeadline))
                        .foregroundColor(.black)

                    karmaCardsLayout(
                        cards: placement.cards,
                        interCardSpacing: interCardSpacing,
                        verticalSpacing: AppConstants.Spacing.sectionSpacing
                    )
                }
            }
        }
        .padding(.horizontal, horizontalPadding)
    }
    @ViewBuilder
    private func karmaCardsLayout(
        cards: [Card],
        interCardSpacing: CGFloat,
        verticalSpacing: CGFloat
    ) -> some View {
        if cards.count == __designTimeInteger("#7035_28", fallback: 1) {
            // Single card: centered
            HStack {
                Spacer(minLength: __designTimeInteger("#7035_29", fallback: 0))
                TappableCard(
                    card: cards[__designTimeInteger("#7035_30", fallback: 0)],
                    size: AppConstants.CardSizes.medium,
                    action: { showKarmaCard(cards[__designTimeInteger("#7035_31", fallback: 0)]) }
                )
                Spacer(minLength: __designTimeInteger("#7035_32", fallback: 0))
            }
        } else {
            // 2 or more cards: always use the same 2-column grid
            LazyVGrid(
                columns: [
                    GridItem(.flexible(), spacing: interCardSpacing),
                    GridItem(.flexible(), spacing: interCardSpacing)
                ],
                alignment: .center,
                spacing: verticalSpacing
            ) {
                ForEach(cards, id: \.id) { card in
                    TappableCard(
                        card: card,
                        size: AppConstants.CardSizes.medium,
                        action: { showKarmaCard(card) }
                    )
                }
            }
        }
    }
    
    // MARK: - Card taps
    
    private func showBirthCard() {
        detailCard = birthCard
        isKarmaCard = __designTimeBoolean("#7035_33", fallback: false)
        karmaDescription = __designTimeString("#7035_34", fallback: "")
        withAnimation(.easeInOut(duration: __designTimeFloat("#7035_35", fallback: 0.3))) {
            showCardDetail = __designTimeBoolean("#7035_36", fallback: true)
        }
    }
    
    /// Decide if tapped card is KC1 or KC2 for THIS birth card
    /// and pull the right description from karmacard1_descriptions / karmacard2_descriptions.
    private func showKarmaCard(_ card: Card) {
        let cardId = String(card.id)
        let descRepo = DescriptionRepository.shared
        
        let isKC1 = karma1CardIds.contains(card.id)
        let description: String
        
        if isKC1 {
            description = descRepo.karmaCard1Descriptions[cardId] ?? __designTimeString("#7035_37", fallback: "No description available.")
        } else if karma2CardIds.contains(card.id) {
            description = descRepo.karmaCard2Descriptions[cardId] ?? __designTimeString("#7035_38", fallback: "No description available.")
        } else {
            description = __designTimeString("#7035_39", fallback: "No description available.")
        }

        detailCard = card
        isKarmaCard = __designTimeBoolean("#7035_40", fallback: true)
        karmaDescription = description
        
        withAnimation(.easeInOut(duration: __designTimeFloat("#7035_41", fallback: 0.3))) {
            showCardDetail = __designTimeBoolean("#7035_42", fallback: true)
        }
    }
    
    private func dismissCardDetail() {
        withAnimation(.easeInOut(duration: __designTimeFloat("#7035_43", fallback: 0.3))) {
            showCardDetail = __designTimeBoolean("#7035_44", fallback: false)
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + __designTimeFloat("#7035_45", fallback: 0.3)) {
            detailCard = nil
            isKarmaCard = __designTimeBoolean("#7035_46", fallback: false)
            karmaDescription = __designTimeString("#7035_47", fallback: "")
        }
    }
}

#Preview {
    NavigationView {
        BirthCardView()
    }
}
