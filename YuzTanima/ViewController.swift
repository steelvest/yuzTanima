//
//  ViewController.swift
//  YuzTanima
//
//  Created by Oğuz Özgül on 27.04.2020.
//  Copyright © 2020 Oğuz Özgül. All rights reserved.
//

import UIKit
import LocalAuthentication
class ViewController: UIViewController {

    @IBOutlet weak var myLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func signInClick(_ sender: Any) {
        
        let autContext = LAContext()
        var error : NSError?
        if autContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            autContext.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Is It you?") { (success, error) in
                if success == true {
                    DispatchQueue.main.async {
                        self.performSegue(withIdentifier: "toSecondVC", sender: nil)
                    }
                    
                } else {
                    DispatchQueue.main.async {
                        self.myLabel.text = "Hata Mesajı"
                    }
                    
                }
            }
        }
        
    }
    
}

