//
//  PersonHomeView.swift
//  Hack Challenge
//
//  Created by Library User on 11/17/19.
//  Copyright © 2019 Library User. All rights reserved.
//

import UIKit

class PersonHomeView: UIViewController {
    
    var homeButton: UIButton!
    var likeButton: UIButton!
    var profileButton: UIButton!
    
    var cellView: UICollectionView!
    
    var house1: House!
    var house2: House!
    var house3: House!
    var house4: House!
    var house5: House!
    var house6: House!
    var houses: [House] = []
    
    var address: UILabel!
    var numPeople: UILabel!
    var priceRange: UILabel!
    var coverImage: UIImageView!
    var traitsLabel: UILabel!
    
    let padding: CGFloat = 8
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        title = "Home"
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
        likeButton.addTarget(self, action: #selector(likeButtonPushed), for: .touchUpInside)
        likeButton.backgroundColor = .white
        likeButton.layer.borderWidth = 1
        likeButton.layer.borderColor = UIColor.lightGray.cgColor
        view.addSubview(likeButton)
        
        profileButton = UIButton()
        profileButton.translatesAutoresizingMaskIntoConstraints = false
        profileButton.setTitle("profile", for: .normal)
        profileButton.setTitleColor(.blue, for: .normal)
        profileButton.addTarget(self, action: #selector(profileButtonPushed), for: .touchUpInside)
        profileButton.backgroundColor = .white
        profileButton.layer.borderWidth = 1
        profileButton.layer.borderColor = UIColor.lightGray.cgColor
        view.addSubview(profileButton)
        
        house1 = House(address: "312 College Ave", numPeople: 5, priceMin: 1000, priceMax: 1400, features: [], coverImageURL: "House1", landlord: "")
        house2 = House(address: "200 Eddy St", numPeople: 3, priceMin: 1200, priceMax: 1500, features: [], coverImageURL: "House2", landlord: "")
        house3 = House(address: "94 Cook St", numPeople: 6, priceMin: 1500, priceMax: 1700, features: [], coverImageURL: "House3", landlord: "")
        house4 = House(address: "282 College Ave", numPeople: 4, priceMin: 1100, priceMax: 1300, features: [], coverImageURL: "House4", landlord: "")
        house5 = House(address: "194 Linden Ave", numPeople: 6, priceMin: 1200, priceMax: 1400, features: [], coverImageURL: "House5", landlord: "")
        house6 = House(address: "226 Dryden Rd", numPeople: 3, priceMin: 1450, priceMax: 1600, features: [], coverImageURL: "House6", landlord: "")
        var currentHouse = house1
        houses = [house1, house2, house3, house4, house5, house6]
        
        //house view:
        
        address = UILabel()
        address.textAlignment = .left
        address.font = UIFont.systemFont(ofSize: 30)
        address.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(address)
        
        numPeople = UILabel()
        numPeople.textAlignment = .left
        numPeople.font = UIFont.systemFont(ofSize: 17)
        numPeople.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(numPeople)
        
        priceRange = UILabel()
        priceRange.textAlignment = .right
        priceRange.font = UIFont.systemFont(ofSize: 17)
        priceRange.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(priceRange)
        
        coverImage = UIImageView()
        coverImage.contentMode = .scaleAspectFill
        coverImage.layer.masksToBounds = true
        coverImage.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(coverImage)
        
        traitsLabel = UILabel()
        traitsLabel.textAlignment = .left
        traitsLabel.font = UIFont.systemFont(ofSize: 17)
        traitsLabel.translatesAutoresizingMaskIntoConstraints = false
        traitsLabel.text = "Your future roommates are..."
        view.addSubview(traitsLabel)
        
        if let house = currentHouse {
            coverImage.image = UIImage(named: house.coverImageURL)
            address.text = house.address
            numPeople.text = String(house.numPeople) + " people"
            priceRange.text = "$" + String(house.priceMin) + "-" + String(house.priceMax) + "/mo"
        }
        
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
        NSLayoutConstraint.activate([
            coverImage.topAnchor.constraint(equalTo: view.topAnchor),
            coverImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            coverImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            coverImage.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -view.frame.size.height/2)
            ])
        NSLayoutConstraint.activate([
            address.topAnchor.constraint(equalTo: coverImage.bottomAnchor, constant: padding),
            address.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding)
            ])
        NSLayoutConstraint.activate([
            numPeople.topAnchor.constraint(equalTo: address.bottomAnchor, constant: padding),
            numPeople.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding)
            ])
        NSLayoutConstraint.activate([
            priceRange.topAnchor.constraint(equalTo: address.bottomAnchor, constant: padding),
            priceRange.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding)
            ])
        NSLayoutConstraint.activate([
            traitsLabel.topAnchor.constraint(equalTo: numPeople.bottomAnchor, constant: 3*padding),
            traitsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding)
            ])
    }
    
    @objc func likeButtonPushed() {
        let viewController = PersonMatchView()
        navigationController?.pushViewController(viewController, animated: false)
    }
    
    @objc func profileButtonPushed() {
        let viewController = PersonProfileView()
        navigationController?.pushViewController(viewController, animated: false)
    }
    
}
