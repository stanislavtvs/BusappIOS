import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let _ = (scene as? UIWindowScene) else { return }

        // Initialize the window
        window = UIWindow(windowScene: scene as! UIWindowScene)

        // Check if the user has any preferences saved for theme
        applySavedSettings()

        // Set up the root view controller
        let profileViewController = ProfileViewController() // Your main view controller
        let navigationController = UINavigationController(rootViewController: profileViewController)

        // Set the root view controller
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Handle scene disconnection if needed
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Handle app becoming active if needed
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Handle app resigning active if needed
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Handle app entering foreground if needed
        applySavedSettings()
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Handle app entering background if needed
    }

    // Helper function to apply saved settings for theme and colors
    private func applySavedSettings() {
        // Check UserDefaults for saved theme settings and apply them globally
        let menuBackgroundColorIndex = UserDefaults.standard.integer(forKey: "menuBackgroundColor")
        let textColorIndex = UserDefaults.standard.integer(forKey: "textColor")
        
        // Here, you can set any global appearance settings if necessary.
        // For example, you might want to update the status bar or UINavigationBar appearance based on the theme.
        
        // Example: Customize navigation bar based on theme
        switch menuBackgroundColorIndex {
        case 1:
            UINavigationBar.appearance().barTintColor = .blue
        case 2:
            UINavigationBar.appearance().barTintColor = .green
        default:
            UINavigationBar.appearance().barTintColor = .purple
        }
        
        // Set text color based on preference
        if textColorIndex == 1 {
            UINavigationBar.appearance().tintColor = .black
        } else {
            UINavigationBar.appearance().tintColor = .white
        }
        
        // Additional customization can go here for other elements like buttons or labels
    }
}

