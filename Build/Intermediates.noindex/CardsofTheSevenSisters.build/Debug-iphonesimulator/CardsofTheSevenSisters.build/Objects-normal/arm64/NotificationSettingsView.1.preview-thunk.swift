import func SwiftUI.__designTimeFloat
import func SwiftUI.__designTimeString
import func SwiftUI.__designTimeInteger
import func SwiftUI.__designTimeBoolean

#sourceLocation(file: "/Users/impriints/Downloads/COTSS_PreBoldRemoval_MyCopy/CardsofTheSevenSisters/Components/NotificationSettingsView.swift", line: 1)
//
//  NotificationSettingsView.swift
//  CardsofTheSevenSisters
//
//  Created by Angela Whitehead on 11/14/25.
//


import SwiftUI

struct NotificationSettingsView: View {
    @StateObject private var notificationManager = NotificationManager.shared
    private let fieldBackgroundColor = Color(red: 0.95, green: 0.90, blue: 0.78)

    var body: some View {
        Form {
            Section(header: Text(__designTimeString("#7559_0", fallback: "Reminders"))
                .font(.custom(__designTimeString("#7559_1", fallback: "Iowan Old Style"), size: __designTimeInteger("#7559_2", fallback: 20)))
                .foregroundColor(AppTheme.primaryText)) {

                Toggle(isOn: $notificationManager.notificationsEnabled) {
                    VStack(alignment: .leading, spacing: __designTimeInteger("#7559_3", fallback: 5)) {
                        Text(__designTimeString("#7559_4", fallback: "Daily Card Reminder"))
                            .font(.custom(__designTimeString("#7559_5", fallback: "Iowan Old Style"), size: __designTimeInteger("#7559_6", fallback: 18)))
                            .foregroundColor(AppTheme.primaryText)

                        Text(__designTimeString("#7559_7", fallback: "Receive a Daily Card notification at 12:00 PM each day"))
                            .font(.custom(__designTimeString("#7559_8", fallback: "Iowan Old Style"), size: __designTimeInteger("#7559_9", fallback: 14)))
                            .foregroundColor(AppTheme.secondaryText)
                    }
                }
                .toggleStyle(SwitchToggleStyle(tint: AppTheme.darkAccent))
                .accessibilityLabel(__designTimeString("#7559_10", fallback: "Daily Card Reminder"))
                .accessibilityHint(__designTimeString("#7559_11", fallback: "Toggle daily notification at 12:00 PM"))
            }
        }
        .scrollContentBackground(.hidden)
        .background(AppTheme.backgroundColor.ignoresSafeArea())
        .navigationTitle(__designTimeString("#7559_12", fallback: "Notifications"))
        .navigationBarTitleDisplayMode(.inline)
    }
}
