//
//  DetailVC.swift
//  SectionIndex
//
//  Created by techmaster on 1/19/17.
//  Copyright © 2017 techmaster. All rights reserved.
//

import UIKit

class DetailVC: UIViewController {
    
    var person = Person()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white

        let labelName = UILabel()
        labelName.frame = CGRect(x: 30.0, y: 100.0, width: 300.0, height: 50.0)
        labelName.font = UIFont.boldSystemFont(ofSize: 25.0)
        labelName.text = person.lastName + " " + person.middleName + " " + person.firstName
        self.view.addSubview(labelName)
        
        let labelMobile = UILabel()
        labelMobile.text = "Mobile"
        labelMobile.textColor = UIColor.blue
        labelMobile.font = UIFont.systemFont(ofSize: 20.0)
        labelMobile.frame = CGRect(x: 30.0, y: 220.0, width: 300.0, height: 50.0)
        self.view.addSubview(labelMobile)
        
        let labelMobileNumber = UILabel()
        labelMobileNumber.text = person.mobileNumber
        labelMobileNumber.frame = CGRect(x: 30.0, y: 250.0, width: 300.0, height: 50.0)
        self.view.addSubview(labelMobileNumber)
        
        let buttonTelephone = UIButton()
        buttonTelephone.frame = CGRect(x: 300.0, y: 250.0, width: 32.0, height: 32.0)
        buttonTelephone.setBackgroundImage(UIImage(named: "telephone-handle.png"), for: UIControlState.normal)
        self.view.addSubview(buttonTelephone)
        
        let speech = UIButton()
        speech.frame = CGRect(x: 350.0, y: 250.0, width: 32.0, height: 32.0)
        speech.isEnabled = true
        speech.setBackgroundImage(UIImage(named: "speech-bubble.png"), for: UIControlState.normal)
        self.view.addSubview(speech)
        
    }
}
