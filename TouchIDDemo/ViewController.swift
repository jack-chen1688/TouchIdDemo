//
//  ViewController.swift
//  TouchIDDemo
//
//  Created by Xuehua Chen on 12/5/16.
//  Copyright © 2016 Xuehua Chen. All rights reserved.
//

import UIKit
import LocalAuthentication

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var error: NSError?
        
        // Do any additional setup after loading the view, typically from a nib.
        let authenticationContext = LAContext()
        
        if authenticationContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
        
            authenticationContext.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Authenticate with Touch ID") { (success, error) in
            
                if success {
                        print ("User has authenticated")
                } else {
                    if let error = error {
                        print (error)
                    } else {
                        print ("Did not authenticate")
                    }
                }
            }
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

