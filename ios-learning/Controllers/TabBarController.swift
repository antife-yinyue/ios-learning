import UIKit
import Iconfont

class TabBarController: UITabBarController {

  override func viewDidLoad() {
    super.viewDidLoad()

    initViewControllers()
  }

  func initViewControllers() {
    UIFont.register("Assets/Fonts/FontAwesome.otf")

    let homeViewController = HomeViewController()
    let webViewController = WebViewController()

    homeViewController.tabBarItem = UITabBarItem(
      title: "Home",
      image: UIImage.iconfont("\u{f070}", familyName: "FontAwesome", size: 26),
      selectedImage: UIImage.iconfont("\u{f06e}", familyName: "FontAwesome", size: 26)
    )

    webViewController.tabBarItem = UITabBarItem(
      title: "O2O",
      image: UIImage.iconfont("\u{f119}", familyName: "FontAwesome", size: 26),
      selectedImage: UIImage.iconfont("\u{f118}", familyName: "FontAwesome", size: 26)
    )

    viewControllers = [
      UINavigationController(rootViewController: homeViewController),
      UINavigationController(rootViewController: webViewController)
    ]
    tabBar.tintColor = UIColor(hex: "#00a0e9")
  }

}
