import UIKit
import PlaygroundSupport

class ViewController:UIViewController{

    var q1 = Quadrado()
    var q2 = Quadrado()
    var q3 = Quadrado()
    var q4 = Quadrado()
    
    let ADA = UILabel()
   
    override func loadView() {
        let view = UIView()
        
        view.backgroundColor = .white
        
        q1.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        q2.frame = CGRect(x: 393, y: 880, width: 20, height: 20)
        q3.frame = CGRect(x: 393, y: 0, width: 20, height: 20)
        q4.frame = CGRect(x: 0, y: 880, width: 20, height: 20)
        ADA.text = "ADA"
       
        ADA.textColor = .white
        ADA.font = UIFont.boldSystemFont(ofSize: 25.0)
        ADA.frame = CGRect(x: 200, y: 353, width: 100, height: 100)
        
        view.addSubview(q1)
        view.addSubview(q2)
        view.addSubview(q3)
        view.addSubview(q4)
        view.addSubview(ADA)
      

        self.view = view
    }
    
}


let vc = ViewController(screenType: .iphone11ProMax, isPortrait: true)
PlaygroundPage.current.liveView = vc.scale(to: 0.5)

PlaygroundPage.current.needsIndefiniteExecution = true

//isso aqui abaixo deve ser chamado dentro de uma funcao dentro da classe.... #gambiarra

UIView.animate(withDuration: 3.0,
               delay: 0.0,
               options: [.curveLinear, .repeat, .autoreverse],
                animations: { () -> Void in
                    vc.q1.frame = CGRect(x: 179, y: 353, width: 100, height: 100)
                    vc.q2.frame = CGRect(x: 179, y: 353, width: 100, height: 100)
                    vc.q3.frame = CGRect(x: 179, y: 353, width: 100, height: 100)
                    vc.q4.frame = CGRect(x: 179, y: 353, width: 100, height: 100)
                    
},
                completion: {
                    (finished: Bool) -> Void in
                    
})


//https://developer.apple.com/documentation/uikit/uiview/animationoptions
