import UIKit

class SignInViewController: UIViewController, SignInViewDelegate {
    
    private var signInView: SignInView!
    private let authController = AuthController()
    
    override func loadView() {
        signInView = SignInView()
        view = signInView
        signInView.signInDelegate = self  // Set the delegate to self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Additional setup if needed
    }
    
    // MARK: - SignInViewDelegate Methods
    func signInWithEmail(email: String, password: String) {
        signInView.setLoading(true)
        
        // Call the authController or handle sign-in logic here
        
    }
    
    func navigateToForgotPassword() {
        showForgotPasswordScreen()
    }
    
    func navigateToSignUp() {
        showSignUpScreen()
    }
    
    // MARK: - Navigation Methods
    private func showForgotPasswordScreen() {
        let forgotPasswordVC = ForgotPasswordViewController()
        navigationController?.pushViewController(forgotPasswordVC, animated: true)
    }
    
    private func showSignUpScreen() {
        let signUpVC = SignUpViewController()
        navigationController?.pushViewController(signUpVC, animated: true)
    }
    
    private func showMainAppScreen() {
        let mainAppVC = MainAppViewController()
        navigationController?.pushViewController(mainAppVC, animated: true)
    }
    
    private func showError(_ message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true)
    }
}

