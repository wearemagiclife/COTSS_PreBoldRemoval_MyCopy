import func SwiftUI.__designTimeFloat
import func SwiftUI.__designTimeString
import func SwiftUI.__designTimeInteger
import func SwiftUI.__designTimeBoolean

#sourceLocation(file: "/Users/impriints/Downloads/COTSS_PreBoldRemoval_MyCopy/CardsofTheSevenSisters/CardsofTheSevenSisters.swift", line: 1)
import SwiftUI

@main
struct CardsOfTheSevenSisters: App {
    @State private var showSplash = true
    @StateObject private var authManager = AuthenticationManager.shared
    @StateObject private var dataManager = DataManager.shared
    @StateObject private var notificationManager = NotificationManager.shared

    init() {
        setupGlobalAppearance()
    }

    var body: some Scene {
        WindowGroup {
            ZStack {
                AppTheme.backgroundColor
                    .ignoresSafeArea(.all)

                if showSplash {
                    VintageSplashView(onStart: {
                        withAnimation(.easeInOut(duration: 0.3)) {
                            showSplash = false
                        }
                    })
                    .preferredColorScheme(.light)
                    .transition(.opacity.animation(.easeInOut(duration: 0.3)))
                    .zIndex(1)
                } else {
                    HomeView()
                        .preferredColorScheme(.light)
                        .transition(.opacity.animation(.easeInOut(duration: 0.3)))
                        .zIndex(0)
                        .environmentObject(authManager)
                        .environmentObject(dataManager)
                }
            }
            .onAppear {
                // Optional: Verify Apple ID credentials are still valid
                // The authentication state is already restored automatically on init
                authManager.checkAuthenticationState()

                // Reschedule notifications if enabled
                if notificationManager.notificationsEnabled {
                    notificationManager.scheduleDailyNotification()
                }
            }
        }
    }
    
    private func setupGlobalAppearance() {
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithOpaqueBackground()
        navBarAppearance.backgroundColor = UIColor(red: __designTimeFloat("#7549_0", fallback: 0.86), green: __designTimeFloat("#7549_1", fallback: 0.77), blue: __designTimeFloat("#7549_2", fallback: 0.57), alpha: __designTimeFloat("#7549_3", fallback: 1.0))
        navBarAppearance.titleTextAttributes = [
            .foregroundColor: UIColor.black,
            .font: UIFont(name: __designTimeString("#7549_4", fallback: "Iowan Old Style"), size: __designTimeInteger("#7549_5", fallback: 20)) ?? UIFont.systemFont(ofSize: __designTimeInteger("#7549_6", fallback: 20))
        ]
        navBarAppearance.largeTitleTextAttributes = [
            .foregroundColor: UIColor.black,
            .font: UIFont(name: __designTimeString("#7549_7", fallback: "Iowan Old Style"), size: __designTimeInteger("#7549_8", fallback: 34)) ?? UIFont.systemFont(ofSize: __designTimeInteger("#7549_9", fallback: 34))
        ]
        
        UINavigationBar.appearance().standardAppearance = navBarAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navBarAppearance
        UINavigationBar.appearance().compactAppearance = navBarAppearance
        
        UIView.appearance().tintColor = UIColor.black
        
        UITabBar.appearance().backgroundColor = UIColor(red: __designTimeFloat("#7549_10", fallback: 0.86), green: __designTimeFloat("#7549_11", fallback: 0.77), blue: __designTimeFloat("#7549_12", fallback: 0.57), alpha: __designTimeFloat("#7549_13", fallback: 1.0))
        UITabBar.appearance().barTintColor = UIColor(red: __designTimeFloat("#7549_14", fallback: 0.86), green: __designTimeFloat("#7549_15", fallback: 0.77), blue: __designTimeFloat("#7549_16", fallback: 0.57), alpha: __designTimeFloat("#7549_17", fallback: 1.0))
        
        UITableView.appearance().backgroundColor = UIColor(red: __designTimeFloat("#7549_18", fallback: 0.86), green: __designTimeFloat("#7549_19", fallback: 0.77), blue: __designTimeFloat("#7549_20", fallback: 0.57), alpha: __designTimeFloat("#7549_21", fallback: 1.0))
        UITableViewCell.appearance().backgroundColor = UIColor(red: __designTimeFloat("#7549_22", fallback: 0.86), green: __designTimeFloat("#7549_23", fallback: 0.77), blue: __designTimeFloat("#7549_24", fallback: 0.57), alpha: __designTimeFloat("#7549_25", fallback: 1.0))
        
        UIScrollView.appearance().backgroundColor = UIColor(red: __designTimeFloat("#7549_26", fallback: 0.86), green: __designTimeFloat("#7549_27", fallback: 0.77), blue: __designTimeFloat("#7549_28", fallback: 0.57), alpha: __designTimeFloat("#7549_29", fallback: 1.0))
    }
}
