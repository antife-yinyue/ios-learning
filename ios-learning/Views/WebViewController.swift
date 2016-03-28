import UIKit
import WebKit

class WebViewController: UIViewController, WKScriptMessageHandler {

  // 设置顶部状态栏颜色
  override func preferredStatusBarStyle() -> UIStatusBarStyle {
    return UIStatusBarStyle.LightContent
  }


  override func viewDidLoad() {
    super.viewDidLoad()

    // 设置 Title
    //navigationItem.title = "淘宝"

    // 隐藏 Navigation Bar
    navigationController!.navigationBarHidden = true

    initWebview()
  }

  func initWebview() {
    let fileURL = NSBundle.mainBundle().URLForResource("bridge", withExtension: "js", subdirectory: "Assets")!
    let data = NSData(contentsOfURL: fileURL)!
    let source = NSString(data: data, encoding: NSUTF8StringEncoding)
    let userScript = WKUserScript(source: source as! String, injectionTime: .AtDocumentEnd, forMainFrameOnly: false)

    let userContentController = WKUserContentController()
    userContentController.addUserScript(userScript)
    userContentController.addScriptMessageHandler(self, name: "callbackHandler")

    let config = WKWebViewConfiguration()
    config.userContentController = userContentController

    let webview = WKWebView(frame: self.view.bounds, configuration: config)
    let url = NSURL(string: "https://m.taobao.com/")

    webview.loadRequest(NSURLRequest(URL: url!))

    self.view = webview
  }

  func userContentController(userContentController: WKUserContentController, didReceiveScriptMessage message: WKScriptMessage) {
    if (message.name == "callbackHandler") {
      print(message.body)
    }
  }

}
