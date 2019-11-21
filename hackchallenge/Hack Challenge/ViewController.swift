//
//  ViewController.swift
//  Hack Challenge
//
//  Created by Library User on 11/16/19.
//  Copyright © 2019 Library User. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var label: UILabel!
    var personButton: UIButton!
    var houseButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        label = UILabel()
        label.text = "I am looking for..."
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 25)
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)
        
        personButton = UIButton()
        personButton.translatesAutoresizingMaskIntoConstraints = false
        personButton.setTitle("Someone to sublet my house", for: .normal)
        personButton.setTitleColor(.black, for: .normal)
        personButton.addTarget(self, action: #selector(personButtonPushed), for: .touchUpInside)
        personButton.backgroundColor = .white
        personButton.layer.borderColor = UIColor.black.cgColor
        personButton.layer.borderWidth = 1.0
        personButton.layer.cornerRadius = 25
        view.addSubview(personButton)
        
        houseButton = UIButton()
        houseButton.translatesAutoresizingMaskIntoConstraints = false
        houseButton.setTitle("A house to sublet", for: .normal)
        houseButton.setTitleColor(.black, for: .normal)
        houseButton.addTarget(self, action: #selector(houseButtonPushed), for: .touchUpInside)
        houseButton.backgroundColor = .white
        houseButton.layer.borderColor = UIColor.black.cgColor
        houseButton.layer.borderWidth = 1.0
        houseButton.layer.cornerRadius = 25
        view.addSubview(houseButton)
        
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            personButton.topAnchor.constraint(equalTo: view.centerYAnchor, constant: -50),
            personButton.bottomAnchor.constraint(equalTo: view.centerYAnchor),
            personButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            personButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50)
            ])
        NSLayoutConstraint.activate([
            houseButton.topAnchor.constraint(equalTo: view.centerYAnchor, constant: 20),
            houseButton.bottomAnchor.constraint(equalTo: view.centerYAnchor, constant: 70),
            houseButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            houseButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50)
            ])
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.bottomAnchor.constraint(equalTo: view.centerYAnchor, constant: -100)
            ])
    }
    
    @objc func personButtonPushed() {
        let viewController = HouseHomeView()
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    @objc func houseButtonPushed() {
        let viewController = PersonHomeView()
        navigationController?.pushViewController(viewController, animated: true)
    }
}

