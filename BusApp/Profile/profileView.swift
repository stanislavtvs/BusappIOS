import UIKit

class ProfileView: UIView {
    
    // MARK: - UI Elements
    private let profileImageView = UIImageView()
    private let nameLabel = UILabel()
    private let emailLabel = UILabel()
    
    private let darkModeLabel = UILabel() // Added label for dark mode
    private let darkModeSwitch = UISwitch()
    
    private let notificationsLabel = UILabel() // Added label for notifications
    private let notificationsSwitch = UISwitch()
    
    private let languageLabel = UILabel() // Added label for language picker
    private let languagePicker = UIPickerView()
    
    private let saveButton = UIButton()
    
    // MARK: - Properties
    var profileSettings: ProfileSettings? {
        didSet {
            // Update the UI elements with the current settings
            updateUI()
        }
    }
    
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
        
        // Profile image view
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        profileImageView.layer.cornerRadius = 50
        profileImageView.clipsToBounds = true
        profileImageView.image = UIImage(named: "defaultProfileImage") // Replace with a default image
        addSubview(profileImageView)
        
        // Name label
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.text = "User Name"
        nameLabel.font = UIFont.boldSystemFont(ofSize: 24)
        addSubview(nameLabel)
        
        // Email label
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        emailLabel.text = "user@example.com"
        emailLabel.font = UIFont.systemFont(ofSize: 16)
        emailLabel.textColor = .gray
        addSubview(emailLabel)
        
        // Dark Mode label and switch
        darkModeLabel.text = "Dark Mode"
        darkModeLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(darkModeLabel)
        
        darkModeSwitch.translatesAutoresizingMaskIntoConstraints = false
        darkModeSwitch.addTarget(self, action: #selector(toggleDarkMode), for: .valueChanged)
        addSubview(darkModeSwitch)
        
        // Notifications label and switch
        notificationsLabel.text = "Notifications"
        notificationsLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(notificationsLabel)
        
        notificationsSwitch.translatesAutoresizingMaskIntoConstraints = false
        notificationsSwitch.addTarget(self, action: #selector(toggleNotifications), for: .valueChanged)
        addSubview(notificationsSwitch)
        
        // Language picker and label
        languageLabel.text = "Preferred Language"
        languageLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(languageLabel)
        
        languagePicker.translatesAutoresizingMaskIntoConstraints = false
        languagePicker.dataSource = self
        languagePicker.delegate = self
        addSubview(languagePicker)
        
        // Save button
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        saveButton.setTitle("Save Changes", for: .normal)
        saveButton.backgroundColor = .purple
        saveButton.layer.cornerRadius = 8
        saveButton.addTarget(self, action: #selector(saveChanges), for: .touchUpInside)
        addSubview(saveButton)
        
        // Constraints
        setupConstraints()
    }
    
    private func setupConstraints() {
        // Add constraints to profile image, name, email, and other UI elements
        NSLayoutConstraint.activate([
            // Profile Image
            profileImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            profileImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 40),
            profileImageView.widthAnchor.constraint(equalToConstant: 100),
            profileImageView.heightAnchor.constraint(equalToConstant: 100),
            
            // Name Label
            nameLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            nameLabel.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 20),
            
            // Email Label
            emailLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            emailLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            
            // Dark Mode Label and Switch
            darkModeLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            darkModeLabel.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 30),
            darkModeSwitch.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            darkModeSwitch.centerYAnchor.constraint(equalTo: darkModeLabel.centerYAnchor),
            
            // Notifications Label and Switch
            notificationsLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            notificationsLabel.topAnchor.constraint(equalTo: darkModeLabel.bottomAnchor, constant: 20),
            notificationsSwitch.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            notificationsSwitch.centerYAnchor.constraint(equalTo: notificationsLabel.centerYAnchor),
            
            // Language Picker
            languageLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            languageLabel.topAnchor.constraint(equalTo: notificationsLabel.bottomAnchor, constant: 30),
            languagePicker.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            languagePicker.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            languagePicker.topAnchor.constraint(equalTo: languageLabel.bottomAnchor, constant: 10),
            languagePicker.heightAnchor.constraint(equalToConstant: 150),
            
            // Save Button
            saveButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            saveButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            saveButton.widthAnchor.constraint(equalToConstant: 200),
            saveButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func updateUI() {
        guard let settings = profileSettings else { return }
        
        // Update UI based on settings
        darkModeSwitch.isOn = settings.isDarkModeEnabled
        notificationsSwitch.isOn = settings.notificationsEnabled
        
        // Update the language picker to reflect the user's language
        let languages = ["en", "fr", "es"]
        if let selectedLanguage = languages.firstIndex(of: settings.preferredLanguage) {
            languagePicker.selectRow(selectedLanguage, inComponent: 0, animated: false)
        }
    }
    
    // MARK: - Actions
    @objc private func toggleDarkMode() {
        profileSettings?.toggleDarkMode()
    }
    
    @objc private func toggleNotifications() {
        profileSettings?.toggleNotifications()
    }
    
    @objc private func saveChanges() {
        profileSettings?.saveSettings()
        // Show a confirmation message, e.g., "Settings saved."
    }
}

// MARK: - UIPickerViewDataSource & UIPickerViewDelegate
extension ProfileView: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 3 // Assuming 3 language options: "en", "fr", "es"
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch row {
        case 0: return "English"
        case 1: return "French"
        case 2: return "Spanish"
        default: return nil
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let language: String
        switch row {
        case 0: language = "en"
        case 1: language = "fr"
        case 2: language = "es"
        default: language = "en"
        }
        profileSettings?.changeLanguage(to: language)
    }
}

