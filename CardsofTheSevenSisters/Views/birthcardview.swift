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
            monthValue: components.month ?? 1,
            dayValue: components.day ?? 1
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
        guard karmaConnections.count > 1 else { return [] }
        return karmaConnections[1].cards
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
        return repo.birthDescriptions[String(birthCard.id)] ?? "No description available."
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
        guard let karmaCard = firstKarmaCard else { return "" }
        if let def = getCardDefinition(by: karmaCard.id) {
            return def.name
        }
        return karmaCard.name
    }

    private var karmaCardDescription: String {
        guard let karmaCard = firstKarmaCard else { return "" }
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
        return "No description available."
    }
    
    var body: some View {
        ZStack {
            Color(red: 0.86, green: 0.77, blue: 0.57)
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
                        LineBreak("linedesignd")
                            .frame(width: UIScreen.main.bounds.width * 0.65)
                            .padding(.top, AppConstants.Spacing.sectionSpacing / 2)   // space after whatever is above
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
                .zIndex(10)
                .id("\(card.id)-\(isKarmaCard ? karmaDescription : "standard")")
            }
        }
        .standardNavigation(
            title: "Birth Card",
            backAction: {
                if showCardDetail {
                    withAnimation(.spring(
                        response: AppConstants.Animation.springResponse,
                        dampingFraction: AppConstants.Animation.springDamping
                    )) {
                        showCardDetail = false
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
                                readingType: "Birth Card",
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
                    .font(.custom("Iowan Old Style", size: AppConstants.FontSizes.subheadline))
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
        let horizontalPadding = width * 0.06   // slightly wider than 0.08
        let interCardSpacing  = width * 0.04

        // How much space between First block and Second block
        let blockSpacing: CGFloat = AppConstants.Spacing.sectionSpacing

        // How much space between line ↔ title ↔ cards *inside* each block
        let innerSpacing: CGFloat = 10  // make this smaller/bigger to taste

        let firstKarmaCards  = karma1CardIds.compactMap { dataManager.getCard(by: $0) }
        let secondKarmaCards = karma2CardIds.compactMap { dataManager.getCard(by: $0) }

        // Only keep placements that actually have cards
        let placements: [(title: String, cards: [Card])] = [
            ("First Karma Card", firstKarmaCards),
            ("Second Karma Card", secondKarmaCards)
        ].filter { !$0.cards.isEmpty }

        return VStack(spacing: blockSpacing) {
            ForEach(Array(placements.enumerated()), id: \.offset) { _, placement in
                // This inner VStack controls: line → title → cards spacing
                VStack(spacing: innerSpacing) {
                    LineBreak("linedesign")
                        .frame(width: width * 0.70)

                    Text(placement.title)
                        .font(.custom("Iowan Old Style", size: AppConstants.FontSizes.dynamicHeadline))
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
        if cards.count == 1 {
            // Single card: centered
            HStack {
                Spacer(minLength: 0)
                TappableCard(
                    card: cards[0],
                    size: AppConstants.CardSizes.medium,
                    action: { showKarmaCard(cards[0]) }
                )
                Spacer(minLength: 0)
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
        isKarmaCard = false
        karmaDescription = ""
        withAnimation(.easeInOut(duration: 0.3)) {
            showCardDetail = true
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
            description = descRepo.karmaCard1Descriptions[cardId] ?? "No description available."
        } else if karma2CardIds.contains(card.id) {
            description = descRepo.karmaCard2Descriptions[cardId] ?? "No description available."
        } else {
            description = "No description available."
        }

        detailCard = card
        isKarmaCard = true
        karmaDescription = description
        
        withAnimation(.easeInOut(duration: 0.3)) {
            showCardDetail = true
        }
    }
    
    private func dismissCardDetail() {
        withAnimation(.easeInOut(duration: 0.3)) {
            showCardDetail = false
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            detailCard = nil
            isKarmaCard = false
            karmaDescription = ""
        }
    }
}

#Preview {
    NavigationView {
        BirthCardView()
    }
}
