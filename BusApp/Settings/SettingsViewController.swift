import UIKit

class SettingsViewController: UIViewController {

    // UI Elements for color selection
    var menuBackgroundColorPicker: UISegmentedControl!
    var textColorPicker: UISegmentedControl!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Set up the UI for the settings
        view.backgroundColor = .white

        // Menu Background Color Picker
        menuBackgroundColorPicker = UISegmentedControl(items: ["Purple", "Blue", "Green"])
        menuBackgroundColorPicker.selectedSegmentIndex = UserDefaults.standard.integer(forKey: "menuBackgroundColor")
        menuBackgroundColorPicker.addTarget(self, action: #selector(menuBackgroundColorChanged), for: .valueChanged)
        menuBackgroundColorPicker.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(menuBackgroundColorPicker)

        // Text Color Picker
        textColorPicker = UISegmentedControl(items: ["White", "Black"])
        textColorPicker.selectedSegmentIndex = UserDefaults.standard.integer(forKey: "textColor")
        textColorPicker.addTarget(self, action: #selector(textColorChanged), for: .valueChanged)
        textColorPicker.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(textColorPicker)

        // Layout for the settings UI
        NSLayoutConstraint.activate([
            menuBackgroundColorPicker.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            menuBackgroundColorPicker.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            
            textColorPicker.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textColorPicker.topAnchor.constraint(equalTo: menuBackgroundColorPicker.bottomAnchor, constant: 30)
        ])
    }

    // Action for changing menu background color
    @objc func menuBackgroundColorChanged() {
        let selectedIndex = menuBackgroundColorPicker.selectedSegmentIndex
        UserDefaults.standard.set(selectedIndex, forKey: "menuBackgroundColor")
    }

    // Action for changing text color
    @objc func textColorChanged() {
        let selectedIndex = textColorPicker.selectedSegmentIndex
        UserDefaults.standard.set(selectedIndex, forKey: "textColor")
    }
}

