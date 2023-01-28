//
//  ViewController.swift
//  AnimationApp
//
//  Created by g.semshchikov on 28.01.2023.
//

import Spring

class ViewController: UIViewController {

    @IBOutlet var coreAnimationView: UIView!
    @IBOutlet var springAnimationView: SpringView!
    
    private var originCoordinate: CGFloat?
        
        override func viewWillLayoutSubviews() {
            super.viewWillLayoutSubviews()
            originCoordinate = coreAnimationView.frame.origin.x
        }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func coreAnimationButtonPressed(_ sender: UIButton) {
        sender.pulsate()
        
        UIView.animate(withDuration: 0.5,
                       delay: 0,
                       options: [.autoreverse, .repeat]) { [weak self] in
            guard let self = self else { return }
            
            if self.coreAnimationView.frame.origin.x == self.originCoordinate {
                self.coreAnimationView.frame.origin.x -= 20
            }
        }
    }
    
    
    @IBAction func springAnimationButtonPressed(_ sender: SpringButton) {
        springAnimationView.animation = "slideLeft"
        springAnimationView.curve = "easeIn"
        springAnimationView.duration = 1
        springAnimationView.animate()
        
        sender.animation = "shake"
        sender.animate()
    }
}

