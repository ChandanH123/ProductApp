import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // Initialize the window
        window = UIWindow(frame: UIScreen.main.bounds)
        
        // Set up the root view controller
        let homeViewController = HomeViewController()
        let navigationController = UINavigationController(rootViewController: homeViewController)
        
        // Customize navigation bar appearance
        navigationController.configureNavigationBar()
        
        homeViewController.title = "Products" // Set the title for the view controller
        
        
        window?.rootViewController = navigationController
        
        // Make the window visible
        window?.makeKeyAndVisible()
        
        return true
    }
}
