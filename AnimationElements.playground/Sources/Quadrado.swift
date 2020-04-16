
import UIKit
import PlaygroundSupport


public class Quadrado: UIView {
 
    var x:CGFloat
    var y:CGFloat

    
   public override init(frame: CGRect){
        self.x=0
        self.y=0
        super.init(frame: frame)
    }
 
  public override func draw(_ rect: CGRect) {
        self.backgroundColor = .random()
    }

    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
