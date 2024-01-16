//
//  MyAlert.swift
//  HWAlert
//
//  Created by Карина Дьячина on 16.01.24.
//

import UIKit

class MyAlert {
    
    struct Constants {
        static let backgroundAlpha: CGFloat = 0.8
    }
    
    private let backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.alpha = 0
        return view
    }()
    
    private let alertView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray5
        return view
    }()
    
    private var myTargetView:  UIView?
    

    func showAlert(title: String, message: String, viewController: UIViewController) {
        
        guard let targetView = viewController.view else { return }
        myTargetView = targetView
        
        backgroundView.frame = targetView.bounds
        targetView.addSubview(backgroundView)
        
        alertView.frame = CGRect(x: 40, y: 300, width: targetView.frame.width - 80 , height: 300)
        targetView.addSubview(alertView)
        
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 80, width: alertView.frame.width, height: 80))
        titleLabel.text = title
        titleLabel.font = UIFont.boldSystemFont(ofSize: 20)
        titleLabel.textColor = .systemPink
        titleLabel.textAlignment = .center
        alertView.addSubview(titleLabel)
        
        let messageLabel = UILabel(frame: CGRect(x: 70, y: 80, width: alertView.frame.width - 140, height: 180))
        messageLabel.text = message
        messageLabel.textAlignment = .center
        alertView.addSubview(messageLabel)
        
        let buttonAlert = UIButton(frame: CGRect(x: 200, y: 300, width: 80, height: 40))
        buttonAlert.setTitle("GOT IT", for: .normal)
        buttonAlert.backgroundColor = .systemBlue
        buttonAlert.translatesAutoresizingMaskIntoConstraints = false
        alertView.addSubview(buttonAlert)
        buttonAlert.addTarget(self, action: #selector(dismissAlert), for: .touchUpInside)
    }
    
    @objc func dismissAlert() {
        backgroundView.removeFromSuperview()
        alertView.removeFromSuperview()
        
    }
}
