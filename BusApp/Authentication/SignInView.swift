import UIKit

class SignInView: UIView {
    
    // MARK: - UI Elements
    private let titleLabel = UILabel()
    private let emailTextField = UITextField()
    private let passwordTextField = UITextField()
    private let signInButton = UIButton()
    private let forgotPasswordButton = UIButton()
    private let signUpButton = UIButton()
    
    // Add Activity Indicator
    private let activityIndicator = UIActivityIndicatorView(style: .large)
    
    // MARK: - Properties
    var signInDelegate: SignInViewDelegate?
    
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    private func setupUI() {
        // Set background color
        self.backgroundColor = .white
        
        // Add and configure the activity indicator
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.hidesWhenStopped = true
        addSubview(activityIndicator)
        
        // Title label
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "Sign In"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 30)
        titleLabel.textAlignment = .center
        addSubview(titleLabel)
        
        // Email text field
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.placeholder = "Enter email"
        emailTextField.borderStyle = .roundedRect
        emailTextField.keyboardType = .emailAddress
        addSubview(emailTextField)
        
        // Password text field
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.placeholder = "Enter password"
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.isSecureTextEntry = true
        addSubview(passwordTextField)
        
        // Sign-In button
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.setTitle("Sign In", for: .normal)
        signInButton.backgroundColor = .purple
        signInButton.layer.cornerRadius = 8
        signInButton.addTarget(self, action: #selector(handleSignIn), for: .touchUpInside)
        addSubview(signInButton)
        
        // Forgot Password button
        forgotPasswordButton.translatesAutoresizingMaskIntoConstraints = false
        forgotPasswordButton.setTitle("Forgot Password?", for: .normal)
        forgotPasswordButton.setTitleColor(.purple, for: .normal)
        forgotPasswordButton.addTarget(self, action: #selector(handleForgotPassword), for: .touchUpInside)
        addSubview(forgotPasswordButton)
        
        // Sign-up button
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        signUpButton.setTitle("Create an Account", for: .normal)
        signUpButton.setTitleColor(.purple, for: .normal)
        signUpButton.addTarget(self, action: #selector(handleSignUp), for: .touchUpInside)
        addSubview(signUpButton)
        
        // Constraints
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            // Title Label
            titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 100),
            
            // Email TextField
            emailTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            emailTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            emailTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 30),
            emailTextField.heightAnchor.constraint(equalToConstant: 40),
            
            // Password TextField
            passwordTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            passwordTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20),
            passwordTextField.heightAnchor.constraint(equalToConstant: 40),
            
            // Sign-In Button
            signInButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            signInButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            signInButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 30),
            signInButton.heightAnchor.constraint(equalToConstant: 50),
            
            // Forgot Password Button
            forgotPasswordButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            forgotPasswordButton.topAnchor.constraint(equalTo: signInButton.bottomAnchor, constant: 20),
            
            // Sign-Up Button
            signUpButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            signUpButton.topAnchor.constraint(equalTo: forgotPasswordButton.bottomAnchor, constant: 20),
            
            // Activity Indicator (Centering in the middle of the view)
            activityIndicator.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
    
    // MARK: - Actions
    @objc private func handleSignIn() {
        let email = emailTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        signInDelegate?.signInWithEmail(email: email, password: password)
    }
    
    @objc private func handleForgotPassword() {
        signInDelegate?.navigateToForgotPassword()
    }
    
    @objc private func handleSignUp() {
        signInDelegate?.navigateToSignUp()
    }
    
    // MARK: - Loading Indicator Methods
    func setLoading(_ isLoading: Bool) {
        if isLoading {
            activityIndicator.startAnimating()
        } else {
            activityIndicator.stopAnimating()
        }
    }
}

// MARK: - SignInViewDelegate
protocol SignInViewDelegate {
    func signInWithEmail(email: String, password: String)
    func navigateToForgotPassword()
    func navigateToSignUp()
}

