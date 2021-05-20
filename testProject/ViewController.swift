//
//  ViewController.swift
//  testProject
//
//  Created by Ash on 20.05.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var phoneNumberTexField: UITextField!
    @IBOutlet var chekButton: UIButton!
    @IBOutlet var getCodeButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Регистрация \nили Вход"
            setupNavigationMultilineTitle()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        phoneNumberTexField.layer.cornerRadius = 14
        getCodeButton.layer.cornerRadius = 14
      
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setupNavigationMultilineTitle()
    }
    

}

extension UIViewController {

func setupNavigationMultilineTitle() {
    guard let navigationBar = self.navigationController?.navigationBar else { return }
    for sview in navigationBar.subviews {
        for ssview in sview.subviews {
            guard let label = ssview as? UILabel else { break }
            if label.text == self.title {
                label.numberOfLines = 2
                label.lineBreakMode = .byWordWrapping
                label.sizeToFit()
                UIView.animate(withDuration: 0.3, animations: {
                    navigationBar.frame.size.height = 57 + label.frame.height
                })
            }
        }
    }
}
}
