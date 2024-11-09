import UIKit
import CoreData

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    // MARK: - Application Launch Lifecycle
    
    /// Entry point of the application. Customizes behavior upon launch.
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    // MARK: - Scene Session Management

    /// Handles the creation of new scenes within the application (e.g., new windows or instances).
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Selects the configuration for the new scene.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    /// Handles the cleanup of discarded scenes to free resources.
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // Frees resources specific to discarded scenes.
    }

    // MARK: - Core Data Stack Setup

    /// Persistent container setup for Core Data, configured with CloudKit integration.
    lazy var persistentContainer: NSPersistentCloudKitContainer = {
        /*
         Creates and configures the Core Data container with CloudKit integration.
         Loads the persistent store and manages potential errors during load.
        */
        let container = NSPersistentCloudKitContainer(name: "BusApp")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Handle error conditions for store loading failures.
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving Support

    /// Saves changes in the application's managed object context before the application terminates.
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Logs error details and terminates the app in development if saving fails.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}

