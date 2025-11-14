import SwiftUI

struct NotificationSettingsView: View {
    @StateObject private var notificationManager = NotificationManager.shared
    private let cardBackground = Color(red: 0.95, green: 0.91, blue: 0.82)
    
    var body: some View {
        ZStack {
            // Same background as the rest of the app
            Color.launchScreenBackground
                .ignoresSafeArea()
            
            ScrollView {
                VStack(spacing: 24) {
                    // Header – similar vibe to Profile/Birth Date labels
                    Text("Reminders")
                        .font(.custom("Iowan Old Style", size: 28))
                        .foregroundColor(AppTheme.primaryText)
                        .padding(.top, 24)
                    
                    // Soft intro text
                    Text("Set a gentle reminder to check your Daily Card at noon each day.")
                        .font(.custom("Iowan Old Style", size: 16))
                        .foregroundColor(AppTheme.secondaryText)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 32)
                    
                    // Daily reminder card
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Daily Card Reminder")
                            .font(.custom("Iowan Old Style", size: 20))
                            .foregroundColor(AppTheme.primaryText)
                        
                        // Card container (like your text field / date picker background)
                        ZStack {
                            RoundedRectangle(cornerRadius: 18, style: .continuous)
                                .fill(cardBackground.opacity(0.96))
                                .shadow(color: .black.opacity(0.12), radius: 8, x: 0, y: 4)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 18, style: .continuous)
                                        .stroke(AppTheme.primaryText.opacity(0.10), lineWidth: 1)
                                )
                            
                            VStack(alignment: .leading, spacing: 10) {
                                HStack {
                                    VStack(alignment: .leading, spacing: 4) {
                                        Text("12:00 PM Daily")
                                            .font(.custom("Iowan Old Style", size: 16))
                                            .foregroundColor(AppTheme.primaryText)
                                        
                                        Text("You’ll get a reminder to open your Daily Card at this time.")
                                            .font(.custom("Iowan Old Style", size: 13))
                                            .foregroundColor(AppTheme.secondaryText)
                                            .fixedSize(horizontal: false, vertical: true)
                                    }
                                    
                                    Spacer()
                                    
                                    Toggle("", isOn: $notificationManager.notificationsEnabled)
                                        .labelsHidden()
                                        .toggleStyle(SwitchToggleStyle(tint: AppTheme.darkAccent))
                                        .accessibilityLabel("Daily Card Reminder")
                                        .accessibilityHint("Toggle daily notification at 12:00 PM")
                                }
                            }
                            .padding(16)
                        }
                    }
                    .padding(.horizontal, 20)
                    
                    Spacer(minLength: 20)
                }
                .padding(.bottom, 32)
            }
        }
        .navigationTitle("Notifications")
        .navigationBarTitleDisplayMode(.inline)
    }
}
