//
//  OTPViewController.swift
//  testProject
//
//  Created by Ash on 21.05.2021.
//

import UIKit
import FirebaseCore
import FirebaseAuth

class OTPViewController: UIViewController {
var phNo = "+79652100422"
    var codeString = "123123"
    var errorMsg = ""
    var error = false
    var cd = ""
    var gotoVarigy = false
    
    @IBOutlet var no1: UITextField!
    @IBOutlet var no2: UITextField!
    @IBOutlet var no3: UITextField!
    @IBOutlet var no4: UITextField!
    @IBOutlet var no5: UITextField!
    @IBOutlet var no6: UITextField!
    @IBOutlet var code: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        no1.becomeFirstResponder()
    }
    
    func sendCode(){
        Auth.auth().settings?.isAppVerificationDisabledForTesting = true
        let number = phNo
        PhoneAuthProvider.provider().verifyPhoneNumber(number, uiDelegate: nil) {(cd,err) in
            if let error = err{
                self.errorMsg = error.localizedDescription
            }
            self.cd = cd ?? ""
            self.gotoVarigy = true
            
        }
    }

    func verifyCode(){
        let credential = PhoneAuthProvider.provider().credential(withVerificationID: self.cd, verificationCode: codeString)
        Auth.auth().signIn(with: credential) { Result, error in
            if let error = error{
                self.errorMsg = error.localizedDescription
            }
        }
    }
    
    func requestCode(){
        sendCode()
    }
    @IBAction func get(_ sender: Any) {
        print(phNo)
//        sendCode()
        requestCode()
        
    }
   
    @IBAction func verify(_ sender: Any) {
        verifyCode()
    }
    
}
