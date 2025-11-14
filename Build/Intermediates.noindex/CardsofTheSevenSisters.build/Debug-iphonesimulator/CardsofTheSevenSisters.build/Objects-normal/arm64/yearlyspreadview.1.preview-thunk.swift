import func SwiftUI.__designTimeFloat
import func SwiftUI.__designTimeString
import func SwiftUI.__designTimeInteger
import func SwiftUI.__designTimeBoolean

#sourceLocation(file: "/Users/impriints/Downloads/COTSS_PreBoldRemoval_MyCopy/CardsofTheSevenSisters/Views/yearlyspreadview.swift", line: 1)
import SwiftUI

struct YearlySpreadView: View {
    @StateObject private var viewModel = YearlyCardViewModel()
    @StateObject private var dataManager = DataManager.shared
    @Environment(\.presentationMode) var presentationMode
    @State private var showCardDetail = false
    @State private var selectedCard: Card? = nil
    
    private let cardType: CardType = .yearly

    private var yearlyCardTitle: String {
        if let def = getCardDefinition(by: viewModel.currentYearCard.id) {
            return def.name
        }
        return viewModel.currentYearCard.name
    }

    private var yearlyCardDescription: String {
        let repo = DescriptionRepository.shared
        return repo.yearlyDescriptions[String(viewModel.currentYearCard.id)] ?? __designTimeString("#7138_0", fallback: "No description available.")
    }

    private var currentYear: String {
        let formatter = DateFormatter()
        formatter.dateFormat = __designTimeString("#7138_1", fallback: "yyyy")
        return formatter.string(from: viewModel.calculationDate)
    }
    
    // Date range computed properties
    private var currentCycleDateRange: String {
        if let dates = dataManager.getCycleDates(for: dataManager.userProfile.birthDate) {
            return dataManager.formatDateRange(start: dates.start, end: dates.end)
        }
        return __designTimeString("#7138_2", fallback: "Aug 30 - Oct 20") // fallback
    }
    
    private var previousCycleDateRange: String {
        if let dates = dataManager.getPreviousCycleDates(for: dataManager.userProfile.birthDate) {
            return dataManager.formatDateRange(start: dates.start, end: dates.end)
        }
        return __designTimeString("#7138_3", fallback: "Jul 9 - Aug 29") // fallback
    }
    
    private var nextCycleDateRange: String {
        if let dates = dataManager.getNextCycleDates(for: dataManager.userProfile.birthDate) {
            return dataManager.formatDateRange(start: dates.start, end: dates.end)
        }
        return __designTimeString("#7138_4", fallback: "Oct 21 - Dec 11") // fallback
    }
    
    var body: some View {
        ZStack {
            Color(red: __designTimeFloat("#7138_5", fallback: 0.86), green: __designTimeFloat("#7138_6", fallback: 0.77), blue: __designTimeFloat("#7138_7", fallback: 0.57))
                .ignoresSafeArea(.all)
                
            ScrollView {
                VStack(spacing: AppConstants.Spacing.sectionSpacing) {
                    headerSection
                    mainCardSection
                    
                    LineBreak()
                    
                    yearlyCardsSection
                    
                    LineBreak(__designTimeString("#7138_8", fallback: "linedesignd"))
                }
                .padding(.horizontal, AppConstants.Spacing.medium)
                .padding(.vertical, AppConstants.Spacing.large)
            }
            
            if showCardDetail, let card = selectedCard {
                CardDetailModalView(
                    card: card,
                    cardType: cardType,
                    contentType: nil as DetailContentType?,
                    isPresented: $showCardDetail
                )
                .zIndex(__designTimeInteger("#7138_9", fallback: 10))
                .id("\(card.id)")
            }
        }
        .standardNavigation(
            title: AppConstants.Strings.yearlyInfluence,
            backAction: {
                if showCardDetail {
                    withAnimation(.spring(response: AppConstants.Animation.springResponse, dampingFraction: AppConstants.Animation.springDamping)) {
                        showCardDetail = __designTimeBoolean("#7138_10", fallback: false)
                    }
                } else {
                    presentationMode.wrappedValue.dismiss()
                }
            },
            trailingContent: {
                AnyView(
                    HStack(spacing: __designTimeInteger("#7138_11", fallback: 12)) {
                        SingleCardShareLink(
                            card: viewModel.currentYearCard,
                            cardTitle: yearlyCardTitle,
                            cardDescription: yearlyCardDescription,
                            readingType: __designTimeString("#7138_12", fallback: "Yearly Card"),
                            subtitle: currentYear
                        )

                        if DataManager.shared.explorationDate != nil {
                            Button(AppConstants.Strings.reset) {
                                DataManager.shared.explorationDate = nil
                            }
                            .font(.custom(__designTimeString("#7138_13", fallback: "Iowan Old Style"), size: AppConstants.FontSizes.callout))
                            .foregroundColor(.black)
                        }
                    }
                )
            }
        )
        .errorFallback(message: viewModel.errorMessage)
    }
    
    private var headerSection: some View {
        VStack(spacing: AppConstants.Spacing.titleSpacing) {
            // "YOUR YEARLY CYCLE" as main title
            Text(__designTimeString("#7138_14", fallback: "YOUR YEARLY CYCLE"))
                .font(.custom(__designTimeString("#7138_15", fallback: "Iowan Old Style"), size: AppConstants.FontSizes.large))
                .fontWeight(.heavy)
                .foregroundColor(.black)
                .multilineTextAlignment(.center)
                .minimumScaleFactor(__designTimeFloat("#7138_16", fallback: 0.7))
            
            // "beginning on your birthday" as subtitle
            Text(__designTimeString("#7138_17", fallback: "beginning on your birthday"))
                .font(.custom(__designTimeString("#7138_18", fallback: "Iowan Old Style"), size: AppConstants.FontSizes.subheadline))
                .foregroundColor(.black)
                .multilineTextAlignment(.center)
        }
        .padding(.top, AppConstants.Spacing.small)
    }
    
    private var mainCardSection: some View {
        TappableCard(
            card: viewModel.currentYearCard,
            size: AppConstants.CardSizes.large,
            action: {
                showCardDetail(card: viewModel.currentYearCard)
            }
        )
    }
    
    private var yearlyCardsSection: some View {
        HStack(spacing: AppConstants.Spacing.cardSpacing) {
            // Last Cycle Card with Date
            VStack(spacing: AppConstants.Spacing.small) {
                Text(AppConstants.Strings.lastCycle)
                    .dynamicType(baseSize: AppConstants.FontSizes.body, textStyle: .body)
                    .fontWeight(.heavy)
                    .foregroundColor(.black)
                    .multilineTextAlignment(.center)
                    .minimumScaleFactor(__designTimeFloat("#7138_19", fallback: 0.8))
                
                TappableCard(
                    card: viewModel.lastYearCard,
                    size: AppConstants.CardSizes.medium,
                    action: {
                        showCardDetail(card: viewModel.lastYearCard)
                    }
                )
            }
            
            // Next Cycle Card with Date
            VStack(spacing: AppConstants.Spacing.small) {
                Text(AppConstants.Strings.nextCycle)
                    .dynamicType(baseSize: AppConstants.FontSizes.body, textStyle: .body)
                    .fontWeight(.heavy)
                    .foregroundColor(.black)
                    .multilineTextAlignment(.center)
                    .minimumScaleFactor(__designTimeFloat("#7138_20", fallback: 0.8))
                              
                TappableCard(
                    card: viewModel.nextYearCard,
                    size: AppConstants.CardSizes.medium,
                    action: {
                        showCardDetail(card: viewModel.nextYearCard)
                    }
                )
            }
        }
    }
    
    private func showCardDetail(card: Card) {
        selectedCard = card
        withAnimation(.easeInOut(duration: __designTimeFloat("#7138_21", fallback: 0.3))) {
            showCardDetail = __designTimeBoolean("#7138_22", fallback: true)
        }
    }
    
    private func dismissCardDetail() {
        withAnimation(.easeInOut(duration: __designTimeFloat("#7138_23", fallback: 0.3))) {
            showCardDetail = __designTimeBoolean("#7138_24", fallback: false)
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + __designTimeFloat("#7138_25", fallback: 0.3)) {
            selectedCard = nil
        }
    }
}

#Preview {
    NavigationView {
        YearlySpreadView()
    }
}
