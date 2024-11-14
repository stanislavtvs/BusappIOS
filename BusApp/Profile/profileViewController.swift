import UIKit

class ProfileViewController: UIViewController {

    // Create a reference to the bottom menu view and stack view
    var bottomMenuView: UIView!
    var stackView: UIStackView!
    var buttons: [UIButton] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Apply the default background theme
        view.backgroundColor = .systemBackground // Default system background color

        // Initialize the bottom menu view
        bottomMenuView = UIView()
        bottomMenuView.translatesAutoresizingMaskIntoConstraints = false
        bottomMenuView.backgroundColor = getMenuBackgroundColor() // Apply the saved background color
        view.addSubview(bottomMenuView)

        // Set constraints for the bottom menu
        NSLayoutConstraint.activate([
            bottomMenuView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bottomMenuView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bottomMenuView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            bottomMenuView.heightAnchor.constraint(equalToConstant: 60)
        ])
        
        // Create a stack view to hold the menu items
        stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 0
        bottomMenuView.addSubview(stackView)

        // Create 4 buttons
        let menuItems = ["Home", "Search", "Profile", "Settings"]
        
        for item in menuItems {
            let button = UIButton()
            button.setTitle(item, for: .normal)
            button.setTitleColor(getTextColor(), for: .normal) // Apply the saved text color
            button.backgroundColor = getMenuBackgroundColor() // Apply the saved background color
            button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
            button.translatesAutoresizingMaskIntoConstraints = false
            stackView.addArrangedSubview(button)
            buttons.append(button)
        }

        // Set constraints for the stack view
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: bottomMenuView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: bottomMenuView.trailingAnchor),
            stackView.topAnchor.constraint(equalTo: bottomMenuView.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomMenuView.bottomAnchor)
        ])

        // Add actions for the buttons
        buttons[0].addTarget(self, action: #selector(homeButtonTapped), for: .touchUpInside)
        buttons[1].addTarget(self, action: #selector(searchButtonTapped), for: .touchUpInside)
        buttons[2].addTarget(self, action: #selector(profileButtonTapped), for: .touchUpInside)
        buttons[3].addTarget(self, action: #selector(settingsButtonTapped), for: .touchUpInside)
    }
    
    // Get menu background color based on saved setting
    func getMenuBackgroundColor() -> UIColor {
        let selectedIndex = UserDefaults.standard.integer(forKey: "menuBackgroundColor")
        switch selectedIndex {
        case 1:
            return .blue
        case 2:
            return .green
        default:
            return .purple
        }
    }

    // Get text color based on saved setting
    func getTextColor() -> UIColor {
        let selectedIndex = UserDefaults.standard.integer(forKey: "textColor")
        return selectedIndex == 1 ? .black : .white
    }

    // Button actions
    @objc func homeButtonTapped() {
        print("Home button tapped!")
    }
    
    @objc func searchButtonTapped() {
        print("Search button tapped!")
    }
    
    @objc func profileButtonTapped() {
        print("Profile button tapped!")
    }
    
    @objc func settingsButtonTapped() {
        print("Settings button tapped!")
    }
}

