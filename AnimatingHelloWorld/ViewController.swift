//
//  ViewController.swift
//  AnimatingHelloWorld
//
//  Created by Mikael Teklehaimanot on 10/18/16.
//  Copyright © 2016 Mikael Teklehaimanot. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var helloWorldLabel: UILabel!
    @IBOutlet weak var animationLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        helloWorldLabel.center.y -= view.bounds.height
        animationLabel.center.y += view.bounds.height
        nameLabel.alpha = 0.0
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 1.0, animations: { 
            self.helloWorldLabel.center.y += self.view.bounds.height
            }, completion: nil)
        
        UIView.animate(withDuration: 1.0, delay: 0.5, options: [], animations: { 
            self.animationLabel.center.y -= self.view.bounds.height
            }, completion: { finished -> Void in
                UIView.animate(withDuration: 1.0, animations: { 
                    self.nameLabel.alpha = 1.0
                    }, completion: nil)
        })
        
    }
    
    func backgroundColor() {
        
        UIView.animate(withDuration: 1.0, animations: { 
            
            }, completion: nil)
        
    }

}

