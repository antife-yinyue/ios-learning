import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.initViewControllers()
    }

    func initViewControllers() {

        let homeNavController = UINavigationController(rootViewController: HomeViewController())
        //homeNavController.tabBarItem = UITabBarItem(title: "Home", image: UIImage(named: "Home"), selectedImage: UIImage(named: "Home-selected"))
        homeNavController.tabBarItem.title = "Home"

        let webviewNavController = UINavigationController(rootViewController: WebViewController())
        //webviewNavController.tabBarItem = UITabBarItem(title: "Webview", image: UIImage(named: "Puzzle"), selectedImage: UIImage(named: "Puzzle-selected"))
        webviewNavController.tabBarItem.title = "Webview"

        self.tabBar.tintColor = UIColor(hex: "#f00")
        self.viewControllers = [homeNavController, webviewNavController]

    }

}
