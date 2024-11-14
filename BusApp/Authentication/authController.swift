import Foundation
import FirebaseAuth
import GoogleSignIn
import FBSDKLoginKit

class AuthController {
    
    // Assuming these variables exist in your class
    var showCustomAlertLoading = false
    var signUpResultText = ""
    var isSignUpSucces = false
    var navigateHome = false

    // Google Sign-In
    func signIn() {
        guard let presentingVC = (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.windows.first?.rootViewController else {
            print("No root view controller found.")
            return
        }

        GIDSignIn.sharedInstance.signIn(withPresenting: presentingVC) { result, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }

            // Safely unwrap the result
            guard let result = result else {
                print("Google Sign-In result is nil.")
                return
            }

            // Safely unwrap the idToken and accessToken from the result
            let idToken = result.user.idToken?.tokenString

              let accessToken = result.user.accessToken.tokenString

            // Create Firebase credential with unwrapped tokens
            let credential = GoogleAuthProvider.credential(withIDToken: idToken!, accessToken: accessToken)

            self.showCustomAlertLoading = true

            // Sign in with Firebase
            Auth.auth().signIn(with: credential) { authResult, error in
                guard let user = authResult?.user, error == nil else {
                    self.signUpResultText = error?.localizedDescription ?? "Error occurred"
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        self.showCustomAlertLoading = false
                    }
                    return
                }

                self.signUpResultText = "\(user.email ?? "No email")\nSigned in successfully"
                self.isSignUpSucces = true

                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    self.showCustomAlertLoading = false
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                        self.navigateHome = true
                    }
                }

                print("\(user.email ?? "No email") signed in successfully")
            }
        }
    }

    // Facebook Sign-In
    func signInWithFacebook(presentingViewController: UIViewController, completion: @escaping (Bool, Error?) -> Void) {
        let manager = LoginManager()
        manager.logIn(permissions: ["public_profile", "email"], from: presentingViewController) { result, error in
            if let error = error {
                completion(false, error)
                return
            }

            guard let result = result, !result.isCancelled else {
                completion(false, NSError(domain: "Facebook Login Error", code: 400, userInfo: nil))
                return
            }

            if let token = result.token {
                let credential = FacebookAuthProvider.credential(withAccessToken: token.tokenString)

                Auth.auth().signIn(with: credential) { (authResult, error) in
                    if let error = error {
                        completion(false, error)
                        return
                    }
                    completion(true, nil)
                }
            }
        }
    }

    

    // Email Sign-In
    func signInWithEmail(email: String, password: String, completion: @escaping (Bool, Error?) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { (authResult, error) in
            if let error = error {
                completion(false, error)
                return
            }
            completion(true, nil)
        }
    }
}

