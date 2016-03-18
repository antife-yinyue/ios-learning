import UIKit
import WebKit

class WebViewController: UIViewController {

  // 设置顶部状态栏颜色
  override func preferredStatusBarStyle() -> UIStatusBarStyle {
    return UIStatusBarStyle.LightContent
  }


  override func viewDidLoad() {
    super.viewDidLoad()

    // 设置 Title
    navigationItem.title = "大众点评"

    initWebview()
  }

  func initWebview() {
    //let source = "document.body.style.paddingTop = '22px';document.body.style.backgroundColor = '#f63';"
    //let userScript = WKUserScript(source: source, injectionTime: .AtDocumentEnd, forMainFrameOnly: false)

    let userContentController = WKUserContentController()
    //userContentController.addUserScript(userScript)

    let config = WKWebViewConfiguration()
    config.userContentController = userContentController


    let w = self.view.frame.size.width
    let h = self.view.frame.size.height

    let webview = WKWebView(frame: CGRectMake(0, 0, w, h), configuration: config)

    let url = NSURL(string: "http://m.dianping.com/")
    webview.loadRequest(NSURLRequest(URL: url!))

    self.view = webview
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

}
