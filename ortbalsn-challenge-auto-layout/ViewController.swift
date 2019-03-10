//
//  ViewController.swift
//  ortbalsn-challenge-auto-layout
//
//  Created by Nathan Ortbals on 2/13/19.
//  Copyright © 2019 Nathan Ortbals. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var buttonOnTop: Bool = true
    var topAnchor: NSLayoutConstraint? = nil
    var bottomAnchor: NSLayoutConstraint? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Add button to view
        let button  = UIButton()
        button.backgroundColor = .green
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        self.view.addSubview(button)
        
        // Add left and right constraints
        let margins = self.view.layoutMarginsGuide
        button.translatesAutoresizingMaskIntoConstraints = false
        button.leadingAnchor.constraint(equalTo: margins.leadingAnchor).isActive = true
        button.trailingAnchor.constraint(equalTo: margins.trailingAnchor).isActive = true
        
        // Initialize and store constraints that will be added and deactivated
        topAnchor = button.topAnchor.constraint(equalTo: margins.topAnchor)
        bottomAnchor = button.topAnchor.constraint(equalTo: margins.bottomAnchor)
        setButtonPosition(button: button)
    }

    @objc func buttonAction(sender: UIButton!) {
        buttonOnTop = !buttonOnTop
        setButtonPosition(button: sender)
    }
    
    func setButtonPosition(button: UIButton){
        topAnchor?.isActive = self.buttonOnTop
        bottomAnchor?.isActive = !self.buttonOnTop
        
        if(buttonOnTop) {
            button.setTitle("Click me to move to the bottom", for: .normal)
        }
        else {
            button.setTitle("Click me to move to the top", for: .normal)
        }
    }
}

