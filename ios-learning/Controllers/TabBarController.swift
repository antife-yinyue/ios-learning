import UIKit
import Iconfont

class TabBarController: UITabBarController {

  override func viewDidLoad() {
    super.viewDidLoad()

    initViewControllers()
  }

  func initViewControllers() {
    let homeViewController = HomeViewController()
    let webViewController = WebViewController()

    homeViewController.tabBarItem.title = "GitHub"
    webViewController.tabBarItem.title = "点评"

    UIFont.register("Assets/Fonts/FontAwesome.otf")
    homeViewController.tabBarItem.image = UIImage.iconfont("\u{f09b}", familyName: "FontAwesome", size: 30)
    webViewController.tabBarItem.image = UIImage.iconfont("\u{f0f5}", familyName: "FontAwesome", size: 24)

    viewControllers = [homeViewController, webViewController]
    tabBar.tintColor = UIColor(hex: "#00a0e9")
  }

}
