import SwiftUI

struct SettingsMenuView: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    NavigationLink {
                        // Your existing profile sheet UI
                        ProfileSheet()
                    } label: {
                        SettingsRow(
                            systemImage: "person.crop.circle",
                            title: "Profile",
                            subtitle: "Name & birth date"
                        )
                    }
                    
                    NavigationLink {
                        // Your new notifications settings screen
                        NotificationSettingsView()
                    } label: {
                        SettingsRow(
                            systemImage: "bell.badge",
                            title: "Notifications",
                            subtitle: "Daily card reminders"
                        )
                    }
                    
                    NavigationLink {
                        // Your onboarding/tutorial flow
                        OnboardingTutorialView()
                    } label: {
                        SettingsRow(
                            systemImage: "sparkles",
                            title: "Tutorial",
                            subtitle: "How this deck works"
                        )
                    }
                    
                    NavigationLink {
                        // Your legal links screen
                        LegalLinksView()
                    } label: {
                        SettingsRow(
                            systemImage: "doc.text.magnifyingglass",
                            title: "Legal & Policies",
                            subtitle: "Privacy & Terms"
                        )
                    }
                    
                    Button {
                        openWebsite()
                    } label: {
                        SettingsRow(
                            systemImage: "globe",
                            title: "Visit Website",
                            subtitle: "wearemagic.life"
                        )
                    }
                }
            }
            .scrollContentBackground(.hidden)
            .background(Color(red: 0.91, green: 0.82, blue: 0.63))
            .navigationTitle("Settings")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark")
                            .font(.system(size: 16, weight: .bold))
                            .padding(8)
                            .background(
                                Circle()
                                    .fill(Color.white.opacity(0.7))
                            )
                            .foregroundColor(.black)
                    }
                }
            }
        }
    }
    
    private func openWebsite() {
        if let url = URL(string: "https://wearemagic.life") {
            UIApplication.shared.open(url)
        }
    }
}

// Reusable row style for the settings list
private struct SettingsRow: View {
    let systemImage: String
    let title: String
    let subtitle: String?
    
    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: systemImage)
                .font(.system(size: 20))
                .frame(width: 32, height: 32)
            
            VStack(alignment: .leading, spacing: 2) {
                Text(title)
                    .font(.custom("Iowan Old Style", size: 18))
                
                if let subtitle = subtitle {
                    Text(subtitle)
                        .font(.custom("Iowan Old Style", size: 14))
                        .foregroundColor(.secondary)
                }
            }
        }
        .padding(.vertical, 6)
    }
}