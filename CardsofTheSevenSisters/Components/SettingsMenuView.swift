import SwiftUI

struct SettingsMenuView: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    NavigationLink {
                        ProfileSheet()
                    } label: {
                        SettingsRow(
                            systemImage: "person.crop.circle",
                            title: "Profile",
                            subtitle: "Name, birth date & sign-in"
                        )
                    }
                    
                    NavigationLink {
                        NotificationSettingsView()
                    } label: {
                        SettingsRow(
                            systemImage: "bell.badge",
                            title: "Notifications",
                            subtitle: "Daily card reminders"
                        )
                    }
                    
                    
                    NavigationLink {
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
            .background(AppTheme.backgroundColor)
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
                            .foregroundColor(AppTheme.primaryText)
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
                    .foregroundColor(AppTheme.primaryText)
                
                if let subtitle = subtitle {
                    Text(subtitle)
                        .font(.custom("Iowan Old Style", size: 14))
                        .foregroundColor(AppTheme.secondaryText)
                }
            }
        }
        .padding(.vertical, 6)
    }
}
