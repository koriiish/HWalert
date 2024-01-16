//
//  ViewController.swift
//  HWAlert
//
//  Created by Карина Дьячина on 16.01.24.
//

import UIKit

class ViewController: UIViewController {

    let myButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 10
        button.backgroundColor = .systemBlue
        button.setTitle("Show Alert", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let customAlert = MyAlert()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setConstraints()
        
        myButton.addTarget(self, action: #selector(myButtonTapped), for: .touchUpInside)
        
        
    }

    @objc func myButtonTapped() {
      // классический ios алерт
        
//        let alert = UIAlertController(title: "Would you like to eat pizza for dinner?", message: "Pepperoni with extra cheese.", preferredStyle: .alert)
//         
//        alert.addAction(UIAlertAction(title: "Yes, got it", style: .default, handler: nil))
//        alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
//         
//        self.present(alert, animated: true)
        
        //кастомный алерт
        customAlert.showAlert(title: "Would you like to eat pizza?", message: "Pepperoni.", viewController: self)
        
    }
}

extension ViewController {
    
    func setConstraints() {
        view.addSubview(myButton)
        NSLayoutConstraint.activate([
            myButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            myButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            myButton.heightAnchor.constraint(equalToConstant: 70),
            myButton.widthAnchor.constraint(equalToConstant: 300)
        ])
    }
}
