//
//  HouseHomeView.swift
//  Hack Challenge
//
//  Created by Library User on 11/17/19.
//  Copyright © 2019 Library User. All rights reserved.
//

import UIKit

class HouseHomeView: UIViewController {
    
    var homeButton: UIButton!
    var likeButton: UIButton!
    var profileButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        self.navigationItem.setHidesBackButton(true, animated: false)
        
        homeButton = UIButton()
        homeButton.translatesAutoresizingMaskIntoConstraints = false
        homeButton.setTitle("home", for: .normal)
        homeButton.setTitleColor(.blue, for: .normal)
        //homeButton.addTarget(self, action: #selector(homeButtonPushed), for: .touchUpInside)
        homeButton.backgroundColor = .white
        homeButton.layer.borderWidth = 1
        homeButton.layer.borderColor = UIColor.lightGray.cgColor
        view.addSubview(homeButton)
        
        likeButton = UIButton()
        likeButton.translatesAutoresizingMaskIntoConstraints = false
        likeButton.setTitle("liked", for: .normal)
        likeButton.setTitleColor(.blue, for: .normal)
        //likeButton.addTarget(self, action: #selector(likeButtonPushed), for: .touchUpInside)
        likeButton.backgroundColor = .white
        likeButton.layer.borderWidth = 1
        likeButton.layer.borderColor = UIColor.lightGray.cgColor
        view.addSubview(likeButton)
        
        profileButton = UIButton()
        profileButton.translatesAutoresizingMaskIntoConstraints = false
        profileButton.setTitle("profile", for: .normal)
        profileButton.setTitleColor(.blue, for: .normal)
        //profileButton.addTarget(self, action: #selector(profileButtonPushed), for: .touchUpInside)
        profileButton.backgroundColor = .white
        profileButton.layer.borderWidth = 1
        profileButton.layer.borderColor = UIColor.lightGray.cgColor
        
        view.addSubview(profileButton)
        
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            homeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            homeButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            homeButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            homeButton.trailingAnchor.constraint(equalTo: view.leadingAnchor, constant: view.frame.size.width/3)
            ])
        NSLayoutConstraint.activate([
            likeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            likeButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            likeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -view.frame.size.width/3+1),
            likeButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: view.frame.size.width/3-1)
            ])
        NSLayoutConstraint.activate([
            profileButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            profileButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            profileButton.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            profileButton.leadingAnchor.constraint(equalTo: view.trailingAnchor, constant: -view.frame.size.width/3)
            ])
    }
    
}
