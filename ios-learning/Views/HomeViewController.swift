import UIKit

class HomeViewController: UIViewController {

  // 设置顶部状态栏颜色
  //override func preferredStatusBarStyle() -> UIStatusBarStyle {
  //  return UIStatusBarStyle.LightContent
  //}

  var circle: CAShapeLayer!
  var timer: NSTimer!
  var angle: CGFloat!
  var textLabel: UILabel!

  override func viewDidLoad() {
    super.viewDidLoad()

    // 隐藏 Navigation Bar
    //navigationController!.navigationBarHidden = true

    drawCircle(1.0)
  }

  func drawCircle(initAngle: CGFloat = 0.0) {
    let centerPoint = CGPointMake(CGRectGetMidX(self.view.frame), CGRectGetMidY(self.view.frame) - 100)
    let path = UIBezierPath(
      arcCenter: centerPoint,
      radius: 100.0,
      startAngle: CGFloat(-M_PI + M_PI_2), // 12 clock
      endAngle: CGFloat(M_PI + M_PI_2),
      clockwise: true
    ).CGPath
    
    angle = initAngle / 360.0

    circle = CAShapeLayer()
    circle.path = path
    circle.fillColor = UIColor.clearColor().CGColor
    circle.strokeColor = UIColor(hex: "#07c")!.CGColor
    circle.lineWidth = 10.0
    circle.lineCap = "round"
    circle.strokeEnd = angle

    self.view.layer.addSublayer(circle)


    let longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(longPressHandler))
    longPressGesture.minimumPressDuration = 0.2
    self.view.addGestureRecognizer(longPressGesture)


    textLabel = UILabel()
    textLabel.frame.size = CGSizeMake(100, 30)
    textLabel.center = centerPoint
    textLabel.textAlignment = .Center
    textLabel.text = numberToPercent()
    textLabel.textColor = UIColor(hex: "#07c")
    textLabel.font = UIFont.boldSystemFontOfSize(30)
    self.view.addSubview(textLabel)
  }


  func longPressHandler(gestureRecognizer: UILongPressGestureRecognizer) {

    if gestureRecognizer.state == .Began {
      startUpTimer()
    }

    if gestureRecognizer.state == .Ended {
      startDownTimer()
    }

  }

  func startUpTimer() {
    invalidateTimer()
    timer = NSTimer.scheduledTimerWithTimeInterval(0.05, target: self, selector: #selector(upCircle), userInfo: nil, repeats: true)
  }

  func startDownTimer() {
    invalidateTimer()
    timer = NSTimer.scheduledTimerWithTimeInterval(0.05, target: self, selector: #selector(downCircle), userInfo: nil, repeats: true)
  }

  func stopTimer() {
    invalidateTimer()
    timer = nil
  }

  func invalidateTimer() {
    if timer != nil {
      timer.invalidate()
    }
  }

  func upCircle() {
    if circle.strokeEnd > 1.0 {
      stopTimer()
      return
    }

    circle.strokeEnd += 0.01
    angle = circle.strokeEnd

    textLabel.text = numberToPercent()
  }

  func downCircle() {
    if circle.strokeEnd < 0.0 {
      stopTimer()
      return
    }

    circle.strokeEnd -= 0.01
    angle = circle.strokeEnd

    textLabel.text = numberToPercent()
  }
  
  func numberToPercent() -> String {
    return "\(Int(angle * 100))%"
  }

}
