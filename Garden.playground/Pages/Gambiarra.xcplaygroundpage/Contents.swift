//: A UIKit based Playground for presenting user interface

import UIKit
import PlaygroundSupport

class JogoViewController : UIViewController{
    
    var listaPlantas = [UIButton]()
    var numeroDePlantas = 20
    
    override func loadView() {
        let view = UIView()
        
        let fundoMenu = UIImage(named: "backgroundGameImage")
        let fundoMenuView = UIImageView(image: fundoMenu)
        fundoMenuView.frame = CGRect(x: 0, y: 0, width: 1920, height: 1080)
        
        let falaImage = UIImage(named:"falaMariaImage")
        let falaView = UIImageView(image: falaImage)
        falaView.frame = CGRect(x: 1080, y: 110, width: 740, height: 255)
        falaView.layer.zPosition = 1
        
        let xPosition = Int.random(in: 0..<1920)
        let plantaButton = UIButton(frame: CGRect(x: xPosition, y: 158, width: 228, height: 229))
        plantaButton.setImage(UIImage(named: "plantaFlor"), for: .normal)
        plantaButton.imageView?.contentMode = .scaleAspectFit
        
        view.addSubview(fundoMenuView)
        //view.addSubview(plantaButton)
        view.addSubview(falaView)
        self.view = view
        makeAnimation()
        
    }
    
    func makeAnimation(){
        
        var time:Double = 0
        
        for _ in 0...100 {
            
            /*DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + time, execute: {
                let xPosition = Int.random(in: 0..<1920)
                let plantaButton = UIButton(frame: CGRect(x: xPosition, y: 158, width: 228, height: 229))
                plantaButton.setImage(UIImage(named: "plantaFlor"), for: .normal)
                plantaButton.imageView?.contentMode = .scaleAspectFit
                self.view.addSubview(plantaButton)
                UIView.animate(withDuration: 0.5, delay: 0, options: [], animations: {
                    
                    plantaButton.alpha = 0
                }, completion: nil)
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1.0, execute: {plantaButton.removeFromSuperview()})
            })*/
            
            DispatchQueue.main.schedule(after: .init(DispatchTime.now() + time), tolerance: .zero, options: .none, {
          
                for _ in 0...5  {       //se quiser mais de uma planta coloca mais de um laco aqui
            
                    
                let xPosition = Int.random(in: 200..<(1920))
                let yPosition = Int.random(in: 200..<(1080))
                    
                    
                let plantaButton = UIButton(frame: CGRect(x: xPosition, y: yPosition, width: 228, height: 229))
                plantaButton.setImage(UIImage(named: "plantaFlor"), for: .normal)
                plantaButton.imageView?.contentMode = .scaleAspectFit
               // plantaButton.addTarget...
                    
                self.view.addSubview(plantaButton)
                    UIView.animate(withDuration: 5.5, delay: 0, options: [], animations: {
                    plantaButton.alpha = 0
                }, completion: nil)
                    DispatchQueue.main.schedule(after: .init(DispatchTime.now() + 2.5), tolerance: .zero, options: .none, {plantaButton.removeFromSuperview()})
                }
            })
            time = time + 2.5
        }
    }
    // faz plantas aparecerem na tela e sumirem, ou seja, o jogo acontecer
    func fazAcontecer() {
        // adicionar e apos 3 segundos some planta
        adicionaPlanta()
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0, execute: {
            self.somePlanta()
        })
    }
    
    @objc func somePlantaQuandoClica(_ sender: UIButton) {
        sender.alpha = 0
    }
    
    // adiciona planta a cada 1 segundo
    
    func adicionaPlanta() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0, execute: {
            
            let xPosition = Int.random(in: 0..<1920)
            let plantaButton = UIButton(frame: CGRect(x: xPosition, y: 158, width: 228, height: 229))
            plantaButton.setImage(UIImage(named: "plantaFlor"), for: .normal)
            plantaButton.imageView?.contentMode = .scaleAspectFit
            
            plantaButton.addTarget(self, action: #selector(self.somePlantaQuandoClica(_:)), for: .touchUpInside)
            
            self.view.addSubview(plantaButton)
            
            self.listaPlantas.append(plantaButton)
        } )
    }
    
    // planta desaparecer
    
    func somePlanta() {
        let plantaSelecionada = self.listaPlantas[0]
        listaPlantas.remove(at: 0)
        UIView.animate(withDuration: 0.3, animations: {
            plantaSelecionada.alpha = 0
        }, completion: { _ in
            // tira elemento da view, para nao sobrecarregar
            plantaSelecionada.removeFromSuperview()
        })
    }
    
}

/// variaveis das paginas
let jogoViewController = JogoViewController()

/// navegacao principal

let navigation = UINavigationController(screenType: .mac, isPortrait: true)
navigation.pushViewController(jogoViewController, animated: true)
navigation.navigationBar.isHidden = true

// configuracao de tamanho de tela
PlaygroundPage.current.liveView = navigation.scale(to: 0.3)
