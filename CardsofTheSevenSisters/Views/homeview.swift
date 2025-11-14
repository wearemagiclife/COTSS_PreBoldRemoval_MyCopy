import SwiftUI
import AuthenticationServices

struct HomeView: View {
    @StateObject private var dataManager: DataManager = DataManager.shared
    @StateObject private var viewModel = HomeViewModel()
    @State private var showingProfileSheet = false
    
    var body: some View {
        Group {
            if dataManager.isProfileComplete {
                NavigationView {
                    ScrollView {
                        VStack(spacing: 0) {
                            headerView
                            welcomeSection
                            cardsGrid
                        }
                        .padding(.bottom, AppConstants.Spacing.sectionSpacing)
                    }
                    .background(Color(red: 0.91, green: 0.82, blue: 0.63))
                    .ignoresSafeArea(edges: .bottom)
                    .navigationBarHidden(true)
                    .onAppear {
                        viewModel.startHomeAnimations()
                    }
                }
                .sheet(isPresented: $showingProfileSheet) {
                    ProfileSheet()
                }
            } else {
                ProfileSetupBlockingView()
            }
        }
        .errorFallback(message: viewModel.errorMessage)
    }
    
    private var headerView: some View {
        VStack(spacing: 0) {
            HStack {
                Spacer()
                
                Button(action: { showingProfileSheet = true }) {
                    Image(systemName: "gearshape")
                        .font(.title2)
                        .foregroundColor(.black)
                }
            }
            .padding(.horizontal, AppConstants.Spacing.medium)
            .padding(.vertical, AppConstants.Spacing.medium)
        }
    }
    
    private var welcomeSection: some View {
        VStack(spacing: 0) {
            Text("\(AppConstants.Strings.welcome), \(dataManager.userProfile.name.isEmpty ? "Guest" : dataManager.userProfile.name)")
                .font(.custom("Iowan Old Style", size: AppConstants.FontSizes.extraLarge + 2))
                .foregroundColor(.black)
                .padding(.bottom, AppConstants.Spacing.medium)
            
            LineBreak(height: 22)
                .frame(width: 280)
                .padding(.top, AppConstants.Spacing.small)
                .padding(.bottom, AppConstants.Spacing.small)
        }
    }
    
    private var cardsGrid: some View {
        VStack(spacing: 0) {
            HStack {
                Spacer()
                SectionHeader(AppConstants.Strings.yourDailyCard, fontSize: AppConstants.FontSizes.title)
                    .tracking(0.5)
                Spacer()
            }
            .padding(.bottom, AppConstants.Spacing.small)
            
            VStack(spacing: 0) {
                Spacer(minLength: 30)
                
                DailyCardLarge()
                    .padding(.bottom, 14)
                
                Spacer(minLength: 0)
                
                Text(dataManager.isDailyCardRevealed ? "Tap to View" : AppConstants.Strings.tapToReveal)
                    .font(.custom("Iowan Old Style", size: AppConstants.FontSizes.headline + 2))
                    .foregroundColor(.black)
                    .multilineTextAlignment(.center)
                    .padding(.bottom, AppConstants.Spacing.titleSpacing)
                    .scaleEffect(dataManager.isDailyCardRevealed ? 1.0 : viewModel.pulseScale)
                    .opacity(viewModel.showTapToReveal ? 1 : 0)
                
                LineBreak("linedesignd", height: 22)
                    .frame(width: 280)
                    .padding(.bottom, AppConstants.Spacing.sectionSpacing)
            }
            .frame(height: 350)
            
            HStack(spacing: AppConstants.Spacing.small) {
                ActualCardTileSmall(
                    card: viewModel.userBirthCard,
                    title: AppConstants.Strings.birthCard,
                    destination: BirthCardView()
                )
                
                ActualCardTileSmall(
                    card: viewModel.userYearlyCard,
                    title: AppConstants.Strings.yearlyCard,
                    destination: YearlySpreadView()
                )
                
                ActualCardTileSmall(
                    card: viewModel.user52DayCard,
                    title: AppConstants.Strings.fiftyTwoDayCycle,
                    destination: FiftyTwoDayCycleView()
                )
            }
            .padding(.horizontal, AppConstants.Spacing.medium)
            .padding(.top, AppConstants.Spacing.large)
        }
    }
}

struct ProfileSetupBlockingView: View {
    @StateObject private var dataManager: DataManager = DataManager.shared
    @StateObject private var authManager: AuthenticationManager = AuthenticationManager.shared
    @State private var showingProfileSheet = false
    
    var body: some View {
        ZStack {
            AppTheme.backgroundColor
                .ignoresSafeArea()
            
            VStack(spacing: AppConstants.Spacing.sectionSpacing) {
                Spacer()
                
                // App Title/Logo
                Group {
                    if let titleImage = UIImage(named: "apptitle") {
                        Image(uiImage: titleImage)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: 280)
                    } else {
                        VStack(spacing: 4) {
                            Text("MY CARDS")
                                .font(.custom("Iowan Old Style", size: AppConstants.FontSizes.extraLarge + 2))
                                .tracking(1)
                            Text("OF DESTINY")
                                .font(.custom("Iowan Old Style", size: AppConstants.FontSizes.extraLarge + 2))
                                .tracking(1)
                        }
                        .foregroundColor(AppTheme.primaryText)
                        .multilineTextAlignment(.center)
                    }
                }
                
                // Show different content based on sign-in status
                if !authManager.isSignedIn {
                    // Not signed in - show Sign in with Apple
                    VStack(spacing: AppConstants.Spacing.medium) {
                        Text("Cardology for Self-Discovery")
                            .font(.custom("Iowan Old Style", size: AppConstants.FontSizes.headline + 2))
                            .foregroundColor(AppTheme.primaryText)
                            .multilineTextAlignment(.center)
                        
                        Text("To begin your journey please sign in.")
                            .font(.custom("Iowan Old Style", size: AppConstants.FontSizes.callout + 2))
                            .foregroundColor(AppTheme.primaryText)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, AppConstants.Spacing.medium)
                        
                        SignInWithAppleButton(.signIn) { request in
                            request.requestedScopes = [.fullName, .email]
                        } onCompletion: { result in
                            authManager.handleAuthorization(result)
                        }
                        .signInWithAppleButtonStyle(.black)
                        .frame(height: 50)
                        .frame(maxWidth: 280)
                        .cornerRadius(AppConstants.CornerRadius.button)
                        .cardShadow(isLarge: true)
                    }
                } else {
                    // Signed in but profile not complete - show profile setup
                    VStack(spacing: AppConstants.Spacing.medium) {
                        Text("Welcome back!")
                            .font(.custom("Iowan Old Style", size: AppConstants.FontSizes.headline + 2))
                            .foregroundColor(AppTheme.primaryText)
                            .multilineTextAlignment(.center)
                        
                        if !authManager.userName.isEmpty {
                            Text("Hello, \(authManager.userName)")
                                .font(.custom("Iowan Old Style", size: AppConstants.FontSizes.body))
                                .foregroundColor(AppTheme.secondaryText)
                                .multilineTextAlignment(.center)
                        }
                        
                        Text("To reveal your personalized cards, please set up your profile.")
                            .font(.custom("Iowan Old Style", size: AppConstants.FontSizes.callout + 2))
                            .foregroundColor(AppTheme.primaryText)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, AppConstants.Spacing.medium)
                        
                        Button("Set Up Your Profile") {
                            showingProfileSheet = true
                        }
                        .font(.custom("Iowan Old Style", size: AppConstants.FontSizes.subheadline))
                        .tracking(0.5)
                        .foregroundColor(.white)
                        .padding(.horizontal, 50)
                        .padding(.vertical, AppConstants.Spacing.medium)
                        .background(AppTheme.darkAccent.opacity(0.7))
                        .cornerRadius(AppConstants.CornerRadius.button)
                        .multilineTextAlignment(.center)
                        .cardShadow(isLarge: true)
                    }
                }
                
                Spacer()
            }
        }
        .sheet(isPresented: $showingProfileSheet) {
            ProfileSheet()
        }
        .onAppear {
            // Only auto-show profile sheet if signed in
            if authManager.isSignedIn && !dataManager.isProfileComplete {
                showingProfileSheet = true
            }
        }
    }
}

struct DailyCardLarge: View {
    @StateObject private var dataManager: DataManager = DataManager.shared
    @StateObject private var viewModel = HomeViewModel()
    @StateObject private var dailyCardViewModel = DailyCardViewModel()
    
    var body: some View {
        NavigationLink(destination: DailyCardView()) {
            Group {
                if dataManager.isDailyCardRevealed {
                    let todayCard = dailyCardViewModel.todayCard.card
                    let cardImageName = viewModel.cardToImageName(todayCard)
                    
                    if let cardImage = ImageManager.shared.loadCardImage(named: cardImageName) {
                        Image(uiImage: cardImage)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: AppConstants.CardSizes.extraLarge.width, height: AppConstants.CardSizes.extraLarge.height)
                            .clipShape(RoundedRectangle(cornerRadius: AppConstants.CornerRadius.cardLarge))
                            .cardShadow(isLarge: true)
                    } else {
                        RoundedRectangle(cornerRadius: AppConstants.CornerRadius.cardLarge)
                            .fill(Color.gray.opacity(0.3))
                            .frame(width: AppConstants.CardSizes.extraLarge.width, height: AppConstants.CardSizes.extraLarge.height)
                            .overlay(
                                Text("Card Image\nNot Found")
                                    .font(.custom("Iowan Old Style", size: AppConstants.FontSizes.caption + 2))
                                    .foregroundColor(.black)
                                    .multilineTextAlignment(.center)
                            )
                            .cardShadow(isLarge: true)
                    }
                } else {
                    if let cardBackImage = UIImage(named: "cardback") {
                        Image(uiImage: cardBackImage)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: AppConstants.CardSizes.extraLarge.width, height: AppConstants.CardSizes.extraLarge.height)
                            .clipShape(RoundedRectangle(cornerRadius: AppConstants.CornerRadius.cardLarge))
                            .cardShadow(isLarge: true)
                    } else {
                        RoundedRectangle(cornerRadius: AppConstants.CornerRadius.cardLarge)
                            .fill(Color.gray.opacity(0.3))
                            .frame(width: AppConstants.CardSizes.extraLarge.width, height: AppConstants.CardSizes.extraLarge.height)
                            .overlay(
                                Text("Card Back\nNot Found")
                                    .font(.custom("Iowan Old Style", size: AppConstants.FontSizes.caption + 2))
                                    .foregroundColor(.black)
                                    .multilineTextAlignment(.center)
                            )
                            .cardShadow(isLarge: true)
                    }
                }
            }
        }
        .buttonStyle(PlainButtonStyle())
    }
}

struct ActualCardTileSmall<Destination: View>: View {
    let card: Card
    let title: String
    let destination: Destination
    
    var body: some View {
        NavigationLink(destination: destination) {
            VStack(spacing: AppConstants.Spacing.small) {
                Group {
                    if let cardImage = ImageManager.shared.loadCardImage(for: card) {
                        Image(uiImage: cardImage)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: AppConstants.CardSizes.small.width, height: AppConstants.CardSizes.small.height)
                            .clipShape(RoundedRectangle(cornerRadius: AppConstants.CornerRadius.card))
                            .cardShadow(isLarge: true)
                    } else {
                        RoundedRectangle(cornerRadius: AppConstants.CornerRadius.card)
                            .fill(Color.gray.opacity(0.3))
                            .frame(width: AppConstants.CardSizes.small.width, height: AppConstants.CardSizes.small.height)
                            .cardShadow(isLarge: true)
                            .overlay(
                                VStack {
                                    Text(AppConstants.Strings.missingImage)
                                        .font(.custom("Iowan Old Style", size: 8))
                                        .foregroundColor(.black)
                                    Text(card.name)
                                        .font(.custom("Iowan Old Style", size: AppConstants.FontSizes.caption))
                                        .foregroundColor(.black)
                                }
                            )
                    }
                }
                
                Text(title)
                    .font(.custom("Iowan Old Style", size: AppConstants.FontSizes.body))
                    .foregroundColor(.black)
                    .multilineTextAlignment(.center)
                    .lineLimit(2)
            }
            .frame(maxWidth: .infinity)
        }
        .buttonStyle(PlainButtonStyle())
    }
}

#Preview {
    HomeView()
}
