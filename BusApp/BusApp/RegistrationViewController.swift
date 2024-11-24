import UIKit

class RegistrationViewController: UIViewController {
    
    // Create an instance of RegistrationController
    var registrationController = RegistrationController()
    
    // UI Elements
    var loginField: UITextField!
    var fullNameField: UITextField!
    var phoneField: UITextField!
    var emailField: UITextField!
    var passwordField: UITextField!
    var genderManButton: UIButton!
    var genderWomanButton: UIButton!
    
    var gender: Int? // 1 for male, 2 for female
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setupUI()
    }
    
    func setupUI() {
        // Title
        let titleLabel = UILabel()
        titleLabel.text = "Создать аккаунт\nBusapp"
        titleLabel.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        titleLabel.textAlignment = .center
        titleLabel.textColor = .white
        titleLabel.numberOfLines = 0
        view.addSubview(titleLabel)
        
        // TextFields
        loginField = UITextField()
        loginField.placeholder = "Придумайте логин"
        loginField.textColor = .white
        loginField.backgroundColor = .black
        loginField.layer.borderColor = UIColor.white.cgColor
        loginField.layer.borderWidth = 1
        loginField.layer.cornerRadius = 5

        fullNameField = UITextField()
        fullNameField.placeholder = "Фамилия, Имя, Отчество"
        fullNameField.textColor = .white
        fullNameField.backgroundColor = .black
        fullNameField.layer.borderColor = UIColor.white.cgColor
        fullNameField.layer.borderWidth = 1
        fullNameField.layer.cornerRadius = 5

        phoneField = UITextField()
        phoneField.placeholder = "Номер телефона"
        phoneField.textColor = .white
        phoneField.backgroundColor = .black
        phoneField.layer.borderColor = UIColor.white.cgColor
        phoneField.layer.borderWidth = 1
        phoneField.layer.cornerRadius = 5

        emailField = UITextField()
        emailField.placeholder = "Адрес эл.почты"
        emailField.textColor = .white
        emailField.backgroundColor = .black
        emailField.layer.borderColor = UIColor.white.cgColor
        emailField.layer.borderWidth = 1
        emailField.layer.cornerRadius = 5

        passwordField = UITextField()
        passwordField.placeholder = "Пароль"
        passwordField.textColor = .white
        passwordField.backgroundColor = .black
        passwordField.layer.borderColor = UIColor.white.cgColor
        passwordField.layer.borderWidth = 1
        passwordField.layer.cornerRadius = 5

        // Custom Gender Selector (Buttons)
        genderManButton = UIButton(type: .system)
        genderManButton.setTitle("Мужчина", for: .normal)
        genderManButton.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        genderManButton.setTitleColor(.white, for: .normal)
        genderManButton.backgroundColor = .black
        genderManButton.layer.cornerRadius = 25
        genderManButton.layer.borderWidth = 2
        genderManButton.layer.borderColor = UIColor.white.cgColor
        genderManButton.addTarget(self, action: #selector(genderSelected(_:)), for: .touchUpInside)

        genderWomanButton = UIButton(type: .system)
        genderWomanButton.setTitle("Женщина", for: .normal)
        genderWomanButton.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        genderWomanButton.setTitleColor(.white, for: .normal)
        genderWomanButton.backgroundColor = .black
        genderWomanButton.layer.cornerRadius = 25
        genderWomanButton.layer.borderWidth = 2
        genderWomanButton.layer.borderColor = UIColor.white.cgColor
        genderWomanButton.addTarget(self, action: #selector(genderSelected(_:)), for: .touchUpInside)

        // Register Button
        let registerButton = UIButton(type: .system)
        registerButton.setTitle("Регистрация", for: .normal)
        registerButton.backgroundColor = .purple
        registerButton.setTitleColor(.white, for: .normal)
        registerButton.layer.cornerRadius = 20
        registerButton.addTarget(self, action: #selector(registerButtonTapped), for: .touchUpInside)

        // Add to View
        [titleLabel, loginField, fullNameField, phoneField, emailField, passwordField, genderManButton, genderWomanButton, registerButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }

        // Layout Constraints
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            loginField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            loginField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            loginField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            loginField.heightAnchor.constraint(equalToConstant: 50),
            
            fullNameField.topAnchor.constraint(equalTo: loginField.bottomAnchor, constant: 20),
            fullNameField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            fullNameField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            fullNameField.heightAnchor.constraint(equalToConstant: 50),
            
            genderManButton.topAnchor.constraint(equalTo: fullNameField.bottomAnchor, constant: 20),
            genderManButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            genderManButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            genderManButton.heightAnchor.constraint(equalToConstant: 50),
            
            genderWomanButton.topAnchor.constraint(equalTo: genderManButton.bottomAnchor, constant: 10),
            genderWomanButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            genderWomanButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            genderWomanButton.heightAnchor.constraint(equalToConstant: 50),
            
            phoneField.topAnchor.constraint(equalTo: genderWomanButton.bottomAnchor, constant: 20),
            phoneField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            phoneField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            phoneField.heightAnchor.constraint(equalToConstant: 50),
            
            emailField.topAnchor.constraint(equalTo: phoneField.bottomAnchor, constant: 20),
            emailField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            emailField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            emailField.heightAnchor.constraint(equalToConstant: 50),
            
            passwordField.topAnchor.constraint(equalTo: emailField.bottomAnchor, constant: 20),
            passwordField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            passwordField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            passwordField.heightAnchor.constraint(equalToConstant: 50),
            
            registerButton.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 30),
            registerButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            registerButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            registerButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

    @objc func genderSelected(_ sender: UIButton) {
        if sender == genderManButton {
            gender = 1
        } else if sender == genderWomanButton {
            gender = 2
        }
    }
    
    @objc func registerButtonTapped() {
        // Retrieve text field values
        guard let login = loginField.text, !login.isEmpty,
              let fullName = fullNameField.text, !fullName.isEmpty,
              let phone = phoneField.text, !phone.isEmpty,
              let email = emailField.text, !email.isEmpty,
              let password = passwordField.text, !password.isEmpty,
              let gender = gender else {
                  print("Please fill all the fields correctly.")
                  return
        }
        
        let isValid = registrationController.validateRegistrationData(username: login, fullName: fullName, phone: phone, email: email, password: password, gender: gender)
        
        if isValid {
            registrationController.registerUser { success, errorMessage in
                DispatchQueue.main.async {
                    if success {
                        print("Registration successful")
                    } else {
                        print(errorMessage ?? "Unknown error")
                    }
                }
            }
        } else {
            print("Please fill all the fields correctly.")
        }
    }
}

