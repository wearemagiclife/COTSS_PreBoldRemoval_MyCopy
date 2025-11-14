import SwiftUI
import AuthenticationServices

struct ProfileSheet: View {
    @StateObject private var dataManager = DataManager.shared
    @StateObject private var authManager = AuthenticationManager.shared
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
            errorMessage = "Invalid birth date. Please check that the date is not in the future."
            showingError = true
        }
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                AppTheme.backgroundColor
                    .ignoresSafeArea()
                
                ScrollView {
                    VStack(spacing: 30) {
                        // Apple ID Info Section (if signed in)
                        if authManager.isSignedIn && (!authManager.userEmail.isEmpty || !authManager.userName.isEmpty) {
                            VStack(alignment: .leading, spacing: 15) {
                                Text("Apple ID")
                                    .font(.custom("Iowan Old Style", size: 22))
                                    .foregroundColor(AppTheme.primaryText)
                                
                                VStack(alignment: .leading, spacing: 10) {
                                    if !authManager.userName.isEmpty {
                                        HStack {
                                            Image(systemName: "person.fill")
                                                .foregroundColor(AppTheme.secondaryText)
                                            Text(authManager.userName)
                                                .font(.custom("Iowan Old Style", size: 16))
                                                .foregroundColor(AppTheme.primaryText)
                                        }
                                    }
                                    if !authManager.userEmail.isEmpty {
                                        HStack {
                                            Image(systemName: "envelope.fill")
                                                .foregroundColor(AppTheme.secondaryText)
                                            Text(authManager.userEmail)
                                                .font(.custom("Iowan Old Style", size: 16))
                                                .foregroundColor(AppTheme.primaryText)
                                        }
                                    }
                                }
                                .padding()
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .background(
                                    RoundedRectangle(cornerRadius: 10)
                                        .fill(fieldBackgroundColor)
                                )
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.black.opacity(0.1), lineWidth: 1)
                                )
                            }
                            .padding(.horizontal)
                            .padding(.top, 20)
                        }
                        
                        VStack(alignment: .center, spacing: 10) {
                            Text("Profile Name")
                                .font(.custom("Iowan Old Style", size: 22))
                                .foregroundColor(AppTheme.primaryText)
                                .padding(.top, authManager.isSignedIn ? 0 : 20)
                            
                            TextField("Enter your name", text: $name)
                                .font(.custom("Iowan Old Style", size: 20))
                                .padding()
                                .background(
                                    RoundedRectangle(cornerRadius: 10)
                                        .fill(fieldBackgroundColor)
                                )
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.black.opacity(0.1), lineWidth: 1)
                                )
                                .accessibilityLabel("Profile Name")
                        }
                        .padding(.horizontal)
                        
                        VStack(spacing: 15) {
                            Text("Birth Date")
                                .font(.custom("Iowan Old Style", size: 22))
                                .foregroundColor(AppTheme.primaryText)
                            
                            Text(formattedDate)
                                .font(.custom("Iowan Old Style", size: 20))
                                .foregroundColor(AppTheme.primaryText)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(
                                    RoundedRectangle(cornerRadius: 10)
                                        .fill(fieldBackgroundColor)
                                )
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.black.opacity(0.1), lineWidth: 1)
                                )
                                .padding(.horizontal, 50)
                            
                            DatePicker("", selection: $birthDate, displayedComponents: .date)
                                .datePickerStyle(WheelDatePickerStyle())
                                .labelsHidden()
                                .background(
                                    RoundedRectangle(cornerRadius: 10)
                                        .fill(fieldBackgroundColor)
                                )
                                .padding(.horizontal)
                                .accessibilityLabel("Birth Date")
                                .accessibilityHint("Select your birth date")
                        }
                        
                        Button {
                            saveAndDismiss()
                        } label: {
                            HStack {
                                if isSaving {
                                    ProgressView()
                                        .scaleEffect(0.8)
                                        .foregroundColor(.white)
                                }
                                Text(isSaving ? "Saving..." : "Save Changes")
                                    .font(.custom("Iowan Old Style", size: 19))
                                    .tracking(0.5)
                                    .foregroundColor(.white)
                            }
                            .padding(.horizontal, 50)
                            .padding(.vertical, 18)
                            .background(AppTheme.darkAccent.opacity(0.7))
                            .cornerRadius(30)
                            .multilineTextAlignment(.center)
                        }
                        .disabled(isSaving)
                        .accessibilityLabel("Save Changes")
                        .accessibilityHint("Saves profile information and closes the sheet")
                        .padding(.horizontal)
                        .cardShadow(isLarge: true)
                        
                        VStack(alignment: .leading, spacing: 15) {
                            Text("Legal")
                                .font(.custom("Iowan Old Style", size: 22))
                                .foregroundColor(AppTheme.primaryText)
                            
                            Button(action: {
                                if let url = URL(string: "https://wearemagic.life/privacy-policy") {
                                    UIApplication.shared.open(url)
                                }
                            }) {
                                HStack {
                                    Text("Privacy Policy")
                                        .font(.custom("Iowan Old Style", size: 18))
                                        .foregroundColor(AppTheme.primaryText)
                                    Spacer()
                                    Image(systemName: "arrow.up.right")
                                        .foregroundColor(AppTheme.primaryText)
                                }
                                .padding()
                                .background(fieldBackgroundColor)
                                .cornerRadius(10)
                            }
                            .accessibilityLabel("Privacy Policy")
                            .accessibilityHint("Opens privacy policy in web browser")
                            
                            Button(action: {
                                if let url = URL(string: "https://wearemagic.life/terms-of-service") {
                                    UIApplication.shared.open(url)
                                }
                            }) {
                                HStack {
                                    Text("Terms of Service")
                                        .font(.custom("Iowan Old Style", size: 18))
                                        .foregroundColor(AppTheme.primaryText)
                                    Spacer()
                                    Image(systemName: "arrow.up.right")
                                        .foregroundColor(AppTheme.primaryText)
                                }
                                .padding()
                                .background(fieldBackgroundColor)
                                .cornerRadius(10)
                            }
                            .accessibilityLabel("Terms of Service")
                            .accessibilityHint("Opens terms of service in web browser")
                        }
                        .padding(.horizontal)
                        
                        // Sign Out Button
                        if authManager.isSignedIn {
                            Button {
                                showingSignOutAlert = true
                            } label: {
                                Text("Sign Out")
                                    .font(.custom("Iowan Old Style", size: 18))
                                    .foregroundColor(.red)
                                    .padding(.horizontal, 50)
                                    .padding(.vertical, 12)
                                    .background(
                                        RoundedRectangle(cornerRadius: 10)
                                            .fill(fieldBackgroundColor)
                                    )
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(Color.red.opacity(0.3), lineWidth: 1)
                                    )
                            }
                            .padding(.top, 10)
                            .padding(.bottom, 30)
                        }
                    }
                    .padding()
                }
            }
            .navigationBarItems(
                trailing: Button {
                    saveAndDismiss()
                } label: {
                    Image(systemName: "xmark")
                        .font(.title2)
                        .foregroundColor(AppTheme.primaryText)
                }
                .accessibilityLabel("Close")
                .accessibilityHint("Saves changes and closes profile")
            )
            .onAppear {
                name = dataManager.userProfile.name
                birthDate = dataManager.userProfile.birthDate
            }
            .alert("Invalid Birth Date", isPresented: $showingError) {
                Button("OK") { }
            } message: {
                Text(errorMessage)
            }
            .alert("Sign Out", isPresented: $showingSignOutAlert) {
                Button("Cancel", role: .cancel) { }
                Button("Sign Out", role: .destructive) {
                    authManager.signOut()
                    presentationMode.wrappedValue.dismiss()
                }
            } message: {
                Text("Are you sure you want to sign out? You'll need to sign in again to access your cards.")
            }
        }
    }
}

#Preview("Profile Sheet") {
    ProfileSheet()
}
