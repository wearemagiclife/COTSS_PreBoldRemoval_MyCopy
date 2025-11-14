import func SwiftUI.__designTimeFloat
import func SwiftUI.__designTimeString
import func SwiftUI.__designTimeInteger
import func SwiftUI.__designTimeBoolean

#sourceLocation(file: "/Users/impriints/Downloads/COTSS_PreBoldRemoval_MyCopy/CardsofTheSevenSisters/Components/SettingsMenuView.swift", line: 1)
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
                            systemImage: __designTimeString("#7564_0", fallback: "person.crop.circle"),
                            title: __designTimeString("#7564_1", fallback: "Profile"),
                            subtitle: __designTimeString("#7564_2", fallback: "Name, birth date & sign-in")
                        )
                    }
                    
                    NavigationLink {
                        NotificationSettingsView()
                    } label: {
                        SettingsRow(
                            systemImage: __designTimeString("#7564_3", fallback: "bell.badge"),
                            title: __designTimeString("#7564_4", fallback: "Notifications"),
                            subtitle: __designTimeString("#7564_5", fallback: "Daily card reminders")
                        )
                    }
                    
                    
                    NavigationLink {
                        LegalLinksView()
                    } label: {
                        SettingsRow(
                            systemImage: __designTimeString("#7564_6", fallback: "doc.text.magnifyingglass"),
                            title: __designTimeString("#7564_7", fallback: "Legal & Policies"),
                            subtitle: __designTimeString("#7564_8", fallback: "Privacy & Terms")
                        )
                    }
                    
                    Button {
                        openWebsite()
                    } label: {
                        SettingsRow(
                            systemImage: __designTimeString("#7564_9", fallback: "globe"),
                            title: __designTimeString("#7564_10", fallback: "Visit Website"),
                            subtitle: __designTimeString("#7564_11", fallback: "wearemagic.life")
                        )
                    }
                }
            }
            .scrollContentBackground(.hidden)
            .background(AppTheme.backgroundColor)
            .navigationTitle(__designTimeString("#7564_12", fallback: "Settings"))
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: __designTimeString("#7564_13", fallback: "xmark"))
                            .font(.system(size: __designTimeInteger("#7564_14", fallback: 16), weight: .bold))
                            .padding(__designTimeInteger("#7564_15", fallback: 8))
                            .background(
                                Circle()
                                    .fill(Color.white.opacity(__designTimeFloat("#7564_16", fallback: 0.7)))
                            )
                            .foregroundColor(AppTheme.primaryText)
                    }
                }
            }
        }
    }
    
    private func openWebsite() {
        if let url = URL(string: __designTimeString("#7564_17", fallback: "https://wearemagic.life")) {
            UIApplication.shared.open(url)
        }
    }
}

private struct SettingsRow: View {
    let systemImage: String
    let title: String
    let subtitle: String?
    
    var body: some View {
        HStack(spacing: __designTimeInteger("#7564_18", fallback: 16)) {
            Image(systemName: systemImage)
                .font(.system(size: __designTimeInteger("#7564_19", fallback: 20)))
                .frame(width: __designTimeInteger("#7564_20", fallback: 32), height: __designTimeInteger("#7564_21", fallback: 32))
            
            VStack(alignment: .leading, spacing: __designTimeInteger("#7564_22", fallback: 2)) {
                Text(title)
                    .font(.custom(__designTimeString("#7564_23", fallback: "Iowan Old Style"), size: __designTimeInteger("#7564_24", fallback: 18)))
                    .foregroundColor(AppTheme.primaryText)
                
                if let subtitle = subtitle {
                    Text(subtitle)
                        .font(.custom(__designTimeString("#7564_25", fallback: "Iowan Old Style"), size: __designTimeInteger("#7564_26", fallback: 14)))
                        .foregroundColor(AppTheme.secondaryText)
                }
            }
        }
        .padding(.vertical, __designTimeInteger("#7564_27", fallback: 6))
    }
}
