import UIKit
import WebKit
import Iconfont

class HomeViewController: UIViewController {

  // 设置顶部状态栏颜色
  override func preferredStatusBarStyle() -> UIStatusBarStyle {
    return UIStatusBarStyle.LightContent
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.


    UIFont.register("Assets/Fonts/FontAwesome.otf")


    let label = UILabel(frame: CGRectMake(100, 100, 100, 100))
    label.font = UIFont(name: "FontAwesome", size: 100)
    label.text = "\u{f09b}"

    self.view.addSubview(label)



    let btn = UIButton(frame: CGRectMake(100, 300, 100, 40))
    btn.titleLabel!.font = UIFont(name: "FontAwesome", size: 40)
    btn.setTitle("\u{f09b}", forState: .Normal)
    btn.setTitleColor(UIColor.blackColor(), forState: .Normal)
    btn.backgroundColor = UIColor(hex: "#eee")

    self.view.addSubview(btn)



    let img = UIImage.iconfont("\u{f09b}", familyName: "FontAwesome", size: 100)
    let imgView = UIImageView()
    imgView.image = img
    imgView.frame = CGRectMake(100, 400, img.size.width, img.size.height)
    imgView.backgroundColor = UIColor(hex: "#eee")

//    let imgView = UIImageView(frame: CGRectMake(100, 400, 100, 100))
//    let fontSize = min(imgView.frame.size.width, imgView.frame.size.height)
//    imgView.image = UIImage.iconfont("\u{f09b}", familyName: "FontAwesome", size: fontSize)
//    imgView.backgroundColor = UIColor(hex: "#eee")
    
    self.view.addSubview(imgView)






    //let source = "document.body.style.paddingTop = '22px';document.body.style.backgroundColor = '#f63';"
    //let userScript = WKUserScript(source: source, injectionTime: .AtDocumentEnd, forMainFrameOnly: false)

//        let userContentController = WKUserContentController()
//        //userContentController.addUserScript(userScript)
//
//        let config = WKWebViewConfiguration()
//        config.userContentController = userContentController
//
//
//
//        let w = self.view.frame.size.width
//        let h = self.view.frame.size.height// - 49
//
//        let webview = WKWebView(frame: CGRectMake(0, 0, w, h), configuration: config)
//
//        let url = NSURL(string: "http://m.dianping.com/")
//        webview.loadRequest(NSURLRequest(URL: url!))
//
//        self.view = webview
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

}
