import UIKit

class LoginViewController: UIViewController {
    
    private let loginController = LoginController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setupUI()
    }
    
    func setupUI() {
        // Logo
        let logoContainer = UIStackView()
        logoContainer.axis = .horizontal
        logoContainer.spacing = 10
        logoContainer.alignment = .center
        logoContainer.translatesAutoresizingMaskIntoConstraints = false
        
        let logoImageView = UIImageView()
        logoImageView.image = UIImage(named: "16.png") // Replace with actual logo image name
        logoImageView.contentMode = .scaleAspectFit
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        logoContainer.addArrangedSubview(logoImageView)
        
        let logoTextLabel = UILabel()
        logoTextLabel.text = "Busapp"
        logoTextLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        logoTextLabel.textColor = .systemIndigo
        logoTextLabel.translatesAutoresizingMaskIntoConstraints = false
        logoContainer.addArrangedSubview(logoTextLabel)
        
        view.addSubview(logoContainer)
        
        // Input Fields
        let emailInputField = UITextField()
        emailInputField.placeholder = "Enter login"
        emailInputField.backgroundColor = .black
        emailInputField.textColor = .gray
        emailInputField.layer.borderWidth = 1
        emailInputField.layer.borderColor = UIColor.white.cgColor
        emailInputField.layer.cornerRadius = 15
        emailInputField.layer.masksToBounds = true
        emailInputField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(emailInputField)
        
        let passwordInputField = UITextField()
        passwordInputField.placeholder = "Enter password"
        passwordInputField.isSecureTextEntry = true
        passwordInputField.backgroundColor = .black
        passwordInputField.textColor = .gray
        passwordInputField.layer.borderWidth = 1
        passwordInputField.layer.borderColor = UIColor.white.cgColor
        passwordInputField.layer.cornerRadius = 15
        passwordInputField.layer.masksToBounds = true
        passwordInputField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(passwordInputField)
        
        // Sign-In Button
        let signInButton = UIButton(type: .system)
        signInButton.setTitle("Sign In", for: .normal)
        signInButton.backgroundColor = .white
        signInButton.setTitleColor(.black, for: .normal)
        signInButton.layer.cornerRadius = 15
        signInButton.addTarget(self, action: #selector(handleEmailLogin), for: .touchUpInside)
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(signInButton)
        
        // Social Media Buttons
        let socialStackView = UIStackView()
        socialStackView.axis = .horizontal
        socialStackView.spacing = 20
        socialStackView.alignment = .center
        socialStackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(socialStackView)
        
        let googleButton = UIButton()
        googleButton.setImage(UIImage(named: "google"), for: .normal) // Replace with actual social media images
        googleButton.addTarget(self, action: #selector(handleGoogleLogin), for: .touchUpInside)
        
        let facebookButton = UIButton()
        facebookButton.setImage(UIImage(named: "facebook"), for: .normal)
        facebookButton.addTarget(self, action: #selector(handleFacebookLogin), for: .touchUpInside)
        
        [googleButton, facebookButton].forEach { button in
            button.translatesAutoresizingMaskIntoConstraints = false
            button.widthAnchor.constraint(equalToConstant: 48).isActive = true
            button.heightAnchor.constraint(equalToConstant: 48).isActive = true
            socialStackView.addArrangedSubview(button)
          /*  let vkButton = UIButton()
            vkButton.setImage(UIImage(named: "vkIcon"), for: .normal) // Replace with actual VK icon image
            vkButton.addTarget(self, action: #selector(handleVKLogin), for: .touchUpInside)
            vkButton.translatesAutoresizingMaskIntoConstraints = false
            vkButton.widthAnchor.constraint(equalToConstant: 48).isActive = true
            vkButton.heightAnchor.constraint(equalToConstant: 48).isActive = true
            socialStackView.addArrangedSubview(vkButton)
*/
        }
        
        // Register Button (link to registration view)
        let registerLabel = UILabel()
        registerLabel.text = "Register"
        registerLabel.textColor = .white
        registerLabel.textAlignment = .center
        registerLabel.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        registerLabel.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(registerTapped))
        registerLabel.addGestureRecognizer(tapGesture)
        registerLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(registerLabel)
        
        // Layout Constraints
        NSLayoutConstraint.activate([
            logoContainer.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            logoContainer.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            emailInputField.topAnchor.constraint(equalTo: logoContainer.bottomAnchor, constant: 20),
            emailInputField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            emailInputField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            emailInputField.heightAnchor.constraint(equalToConstant: 40),
            
            passwordInputField.topAnchor.constraint(equalTo: emailInputField.bottomAnchor, constant: 10),
            passwordInputField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            passwordInputField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            passwordInputField.heightAnchor.constraint(equalToConstant: 40),
            
            signInButton.topAnchor.constraint(equalTo: passwordInputField.bottomAnchor, constant: 20),
            signInButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            signInButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            signInButton.heightAnchor.constraint(equalToConstant: 50),
            
            socialStackView.topAnchor.constraint(equalTo: signInButton.bottomAnchor, constant: 20),
            socialStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            registerLabel.topAnchor.constraint(equalTo: socialStackView.bottomAnchor, constant: 20),
            registerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }

    // Handle Google Login
    @objc func handleGoogleLogin() {
        loginController.googleSign()
    }

    // Handle Facebook Login
    @objc func handleFacebookLogin() {
        loginController.signInWithFacebook(presentingViewController: self) { success, error in
            if success {
                print("Facebook login successful")
            } else {
                print("Facebook login failed: \(error?.localizedDescription ?? "Unknown error")")
            }
        }
    }

    // Handle Email Login
    @objc func handleEmailLogin() {
        let email = "user@example.com" // Replace with actual user input
        let password = "password123"   // Replace with actual user input
        loginController.signInWithEmail(email: email, password: password) { success, error in
            if success {
                print("Email login successful")
            } else {
                print("Email login failed: \(error?.localizedDescription ?? "Unknown error")")
            }
        }
    }

    // Navigate to RegistrationViewController
    @objc func registerTapped() {
        let registrationVC = RegistrationViewController()
        navigationController?.pushViewController(registrationVC, animated: true)
    }
}

