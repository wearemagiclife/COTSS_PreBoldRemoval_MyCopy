// Services/AuthenticationManager.swift
import SwiftUI
import AuthenticationServices

class AuthenticationManager: ObservableObject {
    static let shared = AuthenticationManager()
    
    @Published var isSignedIn = false
    @Published var userEmail = ""
    @Published var userName = ""
    @Published var userID = ""
    
    private init() {
        checkExistingAuthentication()
    }
    
    func checkExistingAuthentication() {
        // Check if user was previously signed in
        if let userID = UserDefaults.standard.string(forKey: "appleUserID") {
            // Verify the credential is still valid
            let appleIDProvider = ASAuthorizationAppleIDProvider()
            appleIDProvider.getCredentialState(forUserID: userID) { credentialState, error in
                DispatchQueue.main.async {
                    switch credentialState {
                    case .authorized:
                        self.userID = userID
                        self.userEmail = UserDefaults.standard.string(forKey: "userEmail") ?? ""
                        self.userName = UserDefaults.standard.string(forKey: "userName") ?? ""
                        self.isSignedIn = true
                    case .revoked, .notFound:
                        self.signOut()
                    default:
                        break
                    }
                }
            }
        }
    }
    
    func handleAuthorization(_ result: Result<ASAuthorization, Error>) {
        switch result {
        case .success(let auth):
            switch auth.credential {
            case let appleIDCredential as ASAuthorizationAppleIDCredential:
                let userID = appleIDCredential.user
                let email = appleIDCredential.email
                let fullName = appleIDCredential.fullName
                
                // Save user info
                self.userID = userID
                self.userEmail = email ?? UserDefaults.standard.string(forKey: "userEmail") ?? ""
                self.userName = "\(fullName?.givenName ?? "") \(fullName?.familyName ?? "")"
                
                // If no name from Apple, check saved name
                if self.userName.trimmingCharacters(in: .whitespaces).isEmpty {
                    self.userName = UserDefaults.standard.string(forKey: "userName") ?? ""
                }
                
                // Save to UserDefaults for persistence
                UserDefaults.standard.set(userID, forKey: "appleUserID")
                if let email = email, !email.isEmpty {
                    UserDefaults.standard.set(email, forKey: "userEmail")
                }
                if !self.userName.trimmingCharacters(in: .whitespaces).isEmpty {
                    UserDefaults.standard.set(self.userName, forKey: "userName")
                }
                
                // Mark as signed in
                self.isSignedIn = true
                
            default:
                break
            }
        case .failure(let error):
            print("Authorization failed: \(error.localizedDescription)")
        }
    }
    
    func signOut() {
        UserDefaults.standard.removeObject(forKey: "appleUserID")
        UserDefaults.standard.removeObject(forKey: "userEmail")
        UserDefaults.standard.removeObject(forKey: "userName")
        
        userID = ""
        userEmail = ""
        userName = ""
        isSignedIn = false
        
        // Also clear profile data
        DataManager.shared.clearProfile()
    }
}