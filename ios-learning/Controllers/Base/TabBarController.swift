import UIKit
import Iconfont

class TabBarController: UITabBarController {

  override func viewDidLoad() {
    super.viewDidLoad()

    self.initViewControllers()
  }

  func initViewControllers() {

    UIFont.register("Assets/Fonts/FontAwesome.otf")

    let homeNavController = UINavigationController(rootViewController: HomeViewController())
    //homeNavController.tabBarItem = UITabBarItem(title: "Home", image: UIImage(named: "Home"), selectedImage: UIImage(named: "Home-selected"))
    homeNavController.tabBarItem.title = "GitHub"
     homeNavController.tabBarItem.image = UIImage.iconfont("\u{f09b}", familyName: "FontAwesome", size: 30)

    let webviewNavController = UINavigationController(rootViewController: WebViewController())
    //webviewNavController.tabBarItem = UITabBarItem(title: "Webview", image: UIImage(named: "Puzzle"), selectedImage: UIImage(named: "Puzzle-selected"))
    webviewNavController.tabBarItem.title = "Webview"


    self.tabBar.tintColor = UIColor(hex: "#00a0e9")
    self.viewControllers = [homeNavController, webviewNavController]

  }

}
