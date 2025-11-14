import func SwiftUI.__designTimeFloat
import func SwiftUI.__designTimeString
import func SwiftUI.__designTimeInteger
import func SwiftUI.__designTimeBoolean

#sourceLocation(file: "/Users/impriints/Downloads/COTSS_PreBoldRemoval_MyCopy/CardsofTheSevenSisters/Components/profilesheet.swift", line: 1)
import SwiftUI
import AuthenticationServices

struct ProfileSheet: View {
    @StateObject private var dataManager = DataManager.shared
    @StateObject private var authManager = AuthenticationManager.shared
    @StateObject private var notificationManager = NotificationManager.shared
    @Environment(\.presentationMode) var presentationMode
    @State private var name: String = ""
    @State private var birthDate = Date()
    @State private var showingError = false
    @State private var errorMessage = ""
    @State private var showDatePicker: Bool = true
    @State private var isSaving = false
    @State private var showingSignOutAlert = false
    
    private let fieldBackgroundColor = Color(red: 0.95, green: 0.90, blue: 0.78)
    
    private var formattedDate: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: birthDate)
    }
    
    private func isValidBirthdate(_ date: Date) -> Bool {
        return date <= Date()
    }
    
    private func saveAndDismiss() {
        if isValidBirthdate(birthDate) {
            if dataManager.updateProfile(name: name, birthDate: birthDate) {
                dataManager.explorationDate = nil
                presentationMode.wrappedValue.dismiss()
            }
        } else {
            errorMessage = __designTimeString("#7019_0", fallback: "Invalid birth date. Please check that the date is not in the future.")
            showingError = __designTimeBoolean("#7019_1", fallback: true)
        }
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                AppTheme.backgroundColor
                    .ignoresSafeArea()
                
                ScrollView {
                    VStack(spacing: __designTimeInteger("#7019_2", fallback: 30)) {
                        // Apple ID Info Section (if signed in)
                        if authManager.isSignedIn && (authManager.email != nil || authManager.displayName != __designTimeString("#7019_3", fallback: "User")) {
                            VStack(alignment: .leading, spacing: __designTimeInteger("#7019_4", fallback: 15)) {
                                Text(__designTimeString("#7019_5", fallback: "Apple ID"))
                                    .font(.custom(__designTimeString("#7019_6", fallback: "Iowan Old Style"), size: __designTimeInteger("#7019_7", fallback: 22)))
                                    .foregroundColor(AppTheme.primaryText)
                                
                                VStack(alignment: .leading, spacing: __designTimeInteger("#7019_8", fallback: 10)) {
                                    if authManager.displayName != __designTimeString("#7019_9", fallback: "User") {
                                        HStack {
                                            Image(systemName: __designTimeString("#7019_10", fallback: "person.fill"))
                                                .foregroundColor(AppTheme.secondaryText)
                                                .accessibilityHidden(__designTimeBoolean("#7019_11", fallback: true))
                                            Text(authManager.displayName)
                                                .font(.custom(__designTimeString("#7019_12", fallback: "Iowan Old Style"), size: __designTimeInteger("#7019_13", fallback: 16)))
                                                .foregroundColor(AppTheme.primaryText)
                                        }
                                        .accessibilityElement(children: .combine)
                                        .accessibilityLabel("Name: \(authManager.displayName)")
                                    }
                                    if let email = authManager.email, !email.isEmpty {
                                        HStack {
                                            Image(systemName: __designTimeString("#7019_14", fallback: "envelope.fill"))
                                                .foregroundColor(AppTheme.secondaryText)
                                                .accessibilityHidden(__designTimeBoolean("#7019_15", fallback: true))
                                            Text(email)
                                                .font(.custom(__designTimeString("#7019_16", fallback: "Iowan Old Style"), size: __designTimeInteger("#7019_17", fallback: 16)))
                                                .foregroundColor(AppTheme.primaryText)
                                        }
                                        .accessibilityElement(children: .combine)
                                        .accessibilityLabel("Email: \(email)")
                                    }
                                }
                                .padding()
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .background(
                                    RoundedRectangle(cornerRadius: __designTimeInteger("#7019_18", fallback: 10))
                                        .fill(fieldBackgroundColor)
                                )
                                .overlay(
                                    RoundedRectangle(cornerRadius: __designTimeInteger("#7019_19", fallback: 10))
                                        .stroke(Color.black.opacity(__designTimeFloat("#7019_20", fallback: 0.1)), lineWidth: __designTimeInteger("#7019_21", fallback: 1))
                                )
                            }
                            .padding(.horizontal)
                            .padding(.top, __designTimeInteger("#7019_22", fallback: 20))
                        }
                        
                        VStack(alignment: .center, spacing: __designTimeInteger("#7019_23", fallback: 10)) {
                            Text(__designTimeString("#7019_24", fallback: "Profile Name"))
                                .font(.custom(__designTimeString("#7019_25", fallback: "Iowan Old Style"), size: __designTimeInteger("#7019_26", fallback: 22)))
                                .foregroundColor(AppTheme.primaryText)
                                .padding(.top, authManager.isSignedIn ? __designTimeInteger("#7019_27", fallback: 0) : __designTimeInteger("#7019_28", fallback: 20))
                            
                            TextField(__designTimeString("#7019_29", fallback: "Enter your name"), text: $name)
                                .font(.custom(__designTimeString("#7019_30", fallback: "Iowan Old Style"), size: __designTimeInteger("#7019_31", fallback: 20)))
                                .padding()
                                .background(
                                    RoundedRectangle(cornerRadius: __designTimeInteger("#7019_32", fallback: 10))
                                        .fill(fieldBackgroundColor)
                                )
                                .overlay(
                                    RoundedRectangle(cornerRadius: __designTimeInteger("#7019_33", fallback: 10))
                                        .stroke(Color.black.opacity(__designTimeFloat("#7019_34", fallback: 0.1)), lineWidth: __designTimeInteger("#7019_35", fallback: 1))
                                )
                                .accessibilityLabel(__designTimeString("#7019_36", fallback: "Profile Name"))
                        }
                        .padding(.horizontal)
                        
                        VStack(spacing: __designTimeInteger("#7019_37", fallback: 15)) {
                            Text(__designTimeString("#7019_38", fallback: "Birth Date"))
                                .font(.custom(__designTimeString("#7019_39", fallback: "Iowan Old Style"), size: __designTimeInteger("#7019_40", fallback: 22)))
                                .foregroundColor(AppTheme.primaryText)
                            
                            Text(formattedDate)
                                .font(.custom(__designTimeString("#7019_41", fallback: "Iowan Old Style"), size: __designTimeInteger("#7019_42", fallback: 20)))
                                .foregroundColor(AppTheme.primaryText)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(
                                    RoundedRectangle(cornerRadius: __designTimeInteger("#7019_43", fallback: 10))
                                        .fill(fieldBackgroundColor)
                                )
                                .overlay(
                                    RoundedRectangle(cornerRadius: __designTimeInteger("#7019_44", fallback: 10))
                                        .stroke(Color.black.opacity(__designTimeFloat("#7019_45", fallback: 0.1)), lineWidth: __designTimeInteger("#7019_46", fallback: 1))
                                )
                                .padding(.horizontal, __designTimeInteger("#7019_47", fallback: 50))
                            
                            DatePicker(__designTimeString("#7019_48", fallback: ""), selection: $birthDate, displayedComponents: .date)
                                .datePickerStyle(WheelDatePickerStyle())
                                .labelsHidden()
                                .background(
                                    RoundedRectangle(cornerRadius: __designTimeInteger("#7019_49", fallback: 10))
                                        .fill(fieldBackgroundColor)
                                )
                                .padding(.horizontal)
                                .accessibilityLabel(__designTimeString("#7019_50", fallback: "Birth Date"))
                                .accessibilityHint(__designTimeString("#7019_51", fallback: "Select your birth date"))
                        }
                        
                        Button {
                            saveAndDismiss()
                        } label: {
                            HStack {
                                if isSaving {
                                    ProgressView()
                                        .scaleEffect(__designTimeFloat("#7019_52", fallback: 0.8))
                                        .foregroundColor(.white)
                                }
                                Text(isSaving ? __designTimeString("#7019_53", fallback: "Saving...") : __designTimeString("#7019_54", fallback: "Save Changes"))
                                    .font(.custom(__designTimeString("#7019_55", fallback: "Iowan Old Style"), size: __designTimeInteger("#7019_56", fallback: 19)))
                                    .tracking(__designTimeFloat("#7019_57", fallback: 0.5))
                                    .foregroundColor(.white)
                            }
                            .padding(.horizontal, __designTimeInteger("#7019_58", fallback: 50))
                            .padding(.vertical, __designTimeInteger("#7019_59", fallback: 18))
                            .background(AppTheme.darkAccent.opacity(__designTimeFloat("#7019_60", fallback: 0.7)))
                            .cornerRadius(__designTimeInteger("#7019_61", fallback: 30))
                            .multilineTextAlignment(.center)
                        }
                        .disabled(isSaving)
                        .accessibilityLabel(__designTimeString("#7019_62", fallback: "Save Changes"))
                        .accessibilityHint(__designTimeString("#7019_63", fallback: "Saves profile information and closes the sheet"))
                        .padding(.horizontal)

                        // Sign Out Button
                        if authManager.isSignedIn {
                            Button {
                                showingSignOutAlert = __designTimeBoolean("#7019_64", fallback: true)
                            } label: {
                                Text(__designTimeString("#7019_65", fallback: "Sign Out"))
                                    .font(.custom(__designTimeString("#7019_66", fallback: "Iowan Old Style"), size: __designTimeInteger("#7019_67", fallback: 18)))
                                    .foregroundColor(.red)
                                    .padding(.horizontal, __designTimeInteger("#7019_68", fallback: 50))
                                    .padding(.vertical, __designTimeInteger("#7019_69", fallback: 12))
                                    .background(
                                        RoundedRectangle(cornerRadius: __designTimeInteger("#7019_70", fallback: 10))
                                            .fill(fieldBackgroundColor)
                                    )
                                    .overlay(
                                        RoundedRectangle(cornerRadius: __designTimeInteger("#7019_71", fallback: 10))
                                            .stroke(Color.red.opacity(__designTimeFloat("#7019_72", fallback: 0.3)), lineWidth: __designTimeInteger("#7019_73", fallback: 1))
                                    )
                            }
                            .padding(.top, __designTimeInteger("#7019_74", fallback: 10))
                            .padding(.bottom, __designTimeInteger("#7019_75", fallback: 30))
                        }
                    }
                    .padding()
                }
            }
            .navigationBarItems(
                trailing: Button {
                    saveAndDismiss()
                } label: {
                    Image(systemName: __designTimeString("#7019_76", fallback: "xmark"))
                        .font(.title2)
                        .foregroundColor(AppTheme.primaryText)
                }
                .accessibilityLabel(__designTimeString("#7019_77", fallback: "Close"))
                .accessibilityHint(__designTimeString("#7019_78", fallback: "Saves changes and closes profile"))
            )
            .onAppear {
                name = dataManager.userProfile.name
                birthDate = dataManager.userProfile.birthDate
            }
            .alert(__designTimeString("#7019_79", fallback: "Invalid Birth Date"), isPresented: $showingError) {
                Button(__designTimeString("#7019_80", fallback: "OK")) { }
            } message: {
                Text(errorMessage)
            }
            .alert(__designTimeString("#7019_81", fallback: "Sign Out"), isPresented: $showingSignOutAlert) {
                Button(__designTimeString("#7019_82", fallback: "Cancel"), role: .cancel) { }
                Button(__designTimeString("#7019_83", fallback: "Sign Out"), role: .destructive) {
                    authManager.signOut()
                    presentationMode.wrappedValue.dismiss()
                }
            } message: {
                Text(__designTimeString("#7019_84", fallback: "Are you sure you want to sign out? You'll need to sign in again to access your cards."))
            }
        }
    }
}

#Preview("Profile Sheet") {
    ProfileSheet()
}
