//
//  ViewController.swift
//  AnimatingHelloWorld
//
//  Created by Mikael Teklehaimanot on 10/18/16.
//  Copyright © 2016 Mikael Teklehaimanot. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    
    @IBOutlet weak var helloWorldLabel: UILabel!
    @IBOutlet weak var animationLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var backgroundImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundImageView.alpha = 0.0
        
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
                    }, completion: { finished -> Void in
                        self.backgroundImage()
                        self.setNeedsStatusBarAppearanceUpdate()
                })
        })
        
    }
    
    func backgroundImage() {
        
        UIView.animate(withDuration: 1.5, animations: {
            self.backgroundImageView.alpha = 1
            }, completion: { finished -> Void in
                let whiteColor = UIColor.white
                self.helloWorldLabel.textColor = whiteColor
                self.animationLabel.textColor = whiteColor
                self.nameLabel.textColor = whiteColor
                //TODO: Play with UIView#transtion to get nice transition of text color
        })
        
    }

}

