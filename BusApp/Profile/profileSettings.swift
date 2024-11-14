import Foundation

// This struct represents the settings or preferences associated with a user's profile.
struct ProfileSettings {
    var isDarkModeEnabled: Bool
    var notificationsEnabled: Bool
    var preferredLanguage: String
    var isLocationTrackingEnabled: Bool

    // Initializer to set up the user's profile settings.
    init(isDarkModeEnabled: Bool = false, notificationsEnabled: Bool = true, preferredLanguage: String = "en", isLocationTrackingEnabled: Bool = true) {
        self.isDarkModeEnabled = isDarkModeEnabled
        self.notificationsEnabled = notificationsEnabled
        self.preferredLanguage = preferredLanguage
        self.isLocationTrackingEnabled = isLocationTrackingEnabled
    }
    
    // Method to toggle dark mode setting.
    mutating func toggleDarkMode() {
        isDarkModeEnabled.toggle()
    }
    
    // Method to toggle notification setting.
    mutating func toggleNotifications() {
        notificationsEnabled.toggle()
    }

    // Method to change the preferred language.
    mutating func changeLanguage(to newLanguage: String) {
        preferredLanguage = newLanguage
    }

    // Method to toggle location tracking.
    mutating func toggleLocationTracking() {
        isLocationTrackingEnabled.toggle()
    }

    // Save the profile settings to UserDefaults.
    func saveSettings() {
        UserDefaults.standard.set(isDarkModeEnabled, forKey: "isDarkModeEnabled")
        UserDefaults.standard.set(notificationsEnabled, forKey: "notificationsEnabled")
        UserDefaults.standard.set(preferredLanguage, forKey: "preferredLanguage")
        UserDefaults.standard.set(isLocationTrackingEnabled, forKey: "isLocationTrackingEnabled")
    }

    // Load the profile settings from UserDefaults.
    static func loadSettings() -> ProfileSettings {
        let isDarkModeEnabled = UserDefaults.standard.bool(forKey: "isDarkModeEnabled")
        let notificationsEnabled = UserDefaults.standard.bool(forKey: "notificationsEnabled")
        let preferredLanguage = UserDefaults.standard.string(forKey: "preferredLanguage") ?? "en"
        let isLocationTrackingEnabled = UserDefaults.standard.bool(forKey: "isLocationTrackingEnabled")
        
        return ProfileSettings(isDarkModeEnabled: isDarkModeEnabled, notificationsEnabled: notificationsEnabled, preferredLanguage: preferredLanguage, isLocationTrackingEnabled: isLocationTrackingEnabled)
    }
}

