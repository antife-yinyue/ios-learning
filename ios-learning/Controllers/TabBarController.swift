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
    homeNavController.tabBarItem.title = "GitHub"
    homeNavController.tabBarItem.image = UIImage.iconfont("\u{f09b}", familyName: "FontAwesome", size: 30)
    homeNavController.navigationBarHidden = true

    let webviewNavController = UINavigationController(rootViewController: WebViewController())
    webviewNavController.tabBarItem.title = "点评"
    webviewNavController.tabBarItem.image = UIImage.iconfont("\u{f0f5}", familyName: "FontAwesome", size: 24)
    //webviewNavController.navigationBar.barTintColor = UIColor(hex: "#f60")
    

    self.tabBar.tintColor = UIColor(hex: "#00a0e9")
    self.viewControllers = [homeNavController, webviewNavController]

  }

}
