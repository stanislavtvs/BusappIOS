import UIKit
import GoogleSignIn
import FBSDKLoginKit

class ViewController: UIViewController {

    // MARK: - Properties
    var googleButton: GIDSignInButton!
    var facebookLoginButton: FBLoginButton!
    var titleLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setup the UI
        setupUI()
    }

    // MARK: - UI Setup
    func setupUI() {
        // Set the background color or image (can be changed based on theme settings)
        view.backgroundColor = .systemBackground  // Default background color based on system settings

        // Add a title label at the top of the screen
        titleLabel = UILabel()
        titleLabel.text = "Welcome to BusApp"
        titleLabel.textColor = .black  // You can change to white or any color based on theme
        titleLabel.font = UIFont.boldSystemFont(ofSize: 24)
        titleLabel.textAlignment = .center
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleLabel)
        
        // Constraints for the title label
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        // Setup the Google Sign-In button
        googleButton = GIDSignInButton()
        googleButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(googleButton)
        
        // Constraints for Google Sign-In button
        NSLayoutConstraint.activate([
            googleButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 40),
            googleButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            googleButton.widthAnchor.constraint(equalToConstant: 200),
            googleButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        // Setup the Facebook Login button
        facebookLoginButton = FBLoginButton()
        facebookLoginButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(facebookLoginButton)
        
        // Constraints for Facebook Login button
        NSLayoutConstraint.activate([
            facebookLoginButton.topAnchor.constraint(equalTo: googleButton.bottomAnchor, constant: 20),
            facebookLoginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            facebookLoginButton.widthAnchor.constraint(equalToConstant: 200),
            facebookLoginButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}

