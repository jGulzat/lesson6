//
//  ViewController.swift
//  lesson6
//
//  Created by Gulzat Zheenbek kyzy on 23/5/24.
//

import UIKit

class ViewController: UIViewController {

    private let createPasswordTF: UITextField = {
       let tf = UITextField()
        tf.isSecureTextEntry = true
        tf.placeholder = "Enter a password"
        tf.translatesAutoresizingMaskIntoConstraints = false
        let rigthView = UIButton(frame: CGRect(x: 0, y: 0, width: 24, height: 20))
        rigthView.setBackgroundImage(UIImage(systemName: "eye"), for: .normal)
        rigthView.tag = 0
        rigthView.addTarget(self, action: #selector(hideOrShowPassword), for: .touchUpInside)
        
        tf.rightView = rigthView
        tf.rightViewMode = .always
        return tf
    }()
    
    private let confirmPasswordTF: UITextField = {
       let tf = UITextField()
        tf.isSecureTextEntry = true
        tf.placeholder = "Confirm the password"
        tf.translatesAutoresizingMaskIntoConstraints = false
        let rigthView = UIButton(frame: CGRect(x: 0, y: 0, width: 24, height: 20))
        rigthView.setBackgroundImage(UIImage(systemName: "eye"), for: .normal)
        rigthView.tag = 1
        rigthView.addTarget(self, action: #selector(hideOrShowPassword), for: .touchUpInside)
        
        tf.rightView = rigthView
        tf.rightViewMode = .always
        return tf
    }()
    
    private let nextBtn: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 16
        button.backgroundColor = .gray
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Go next view", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.isEnabled = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        print("new changes")
        
        print("new branch Aijan")
        
        view.addSubview(createPasswordTF)
        
        NSLayoutConstraint.activate([
            createPasswordTF.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -60),
            createPasswordTF.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            createPasswordTF.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            createPasswordTF.heightAnchor.constraint(equalToConstant: 44)
        ])
        
        view.addSubview(confirmPasswordTF)
        NSLayoutConstraint.activate([
            confirmPasswordTF.topAnchor.constraint(equalTo: createPasswordTF.bottomAnchor, constant: 24),
            confirmPasswordTF.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            confirmPasswordTF.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            confirmPasswordTF.heightAnchor.constraint(equalToConstant: 44)
        ])
        
        view.addSubview(nextBtn)
        
        NSLayoutConstraint.activate([
            nextBtn.topAnchor.constraint(equalTo: confirmPasswordTF.bottomAnchor, constant: 24),
            nextBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            nextBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            nextBtn.heightAnchor.constraint(equalToConstant: 44)
        ])
        
        createPasswordTF.addTarget(self, action: #selector(validatePassword), for: .editingChanged)
        
        confirmPasswordTF.addTarget(self, action: #selector(validatePassword), for: .editingChanged)
        
        nextBtn.addTarget(self, action: #selector(goToNextView), for: .touchUpInside)
    }
    
    @objc func validatePassword(_ sender: UITextField) {
        guard let password = createPasswordTF.text,
              let confirmPassword = confirmPasswordTF.text
        else { return }
        
        print("text: \(password)")
        if password.count >= 8 &&  password == confirmPassword {
            nextBtn.isEnabled = true
            nextBtn.backgroundColor = .cyan
        } else {
            nextBtn.isEnabled = true
            nextBtn.backgroundColor = .gray
        }
    }
    
    @objc func hideOrShowPassword(_ sender: UIButton) {
        print("hideOrShowPassword")
        if sender.tag == 0 {
            createPasswordTF.isSecureTextEntry = !createPasswordTF.isSecureTextEntry
        } else if sender.tag == 1 {
            confirmPasswordTF.isSecureTextEntry = !confirmPasswordTF.isSecureTextEntry
        }
        
    }
    
    @objc func goToNextView(_ sender: UIButton) {
        print("goToNextView")
    }
}

