//
//  PersonMatchView.swift
//  Hack Challenge
//
//  Created by Library User on 11/21/19.
//  Copyright © 2019 Library User. All rights reserved.
//

import UIKit

class PersonMatchView: UIViewController {

    var homeButton: UIButton!
    var likeButton: UIButton!
    var profileButton: UIButton!
    
    var collectionView: UICollectionView!
    
    var house1: House!
    var house2: House!
    var house3: House!
    var house4: House!
    var house5: House!
    var house6: House!
    var houses: [House] = []
    
    let cellReuseIdentifier = "reuseIdentifier"
    let padding: CGFloat = 8
    let background = UIColor.init(red: 0.678, green: 0.847, blue: 0.902, alpha: 1.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        title = "Matches"
        self.navigationItem.setHidesBackButton(true, animated: false)
        
        homeButton = UIButton()
        homeButton.translatesAutoresizingMaskIntoConstraints = false
        homeButton.setTitle("home", for: .normal)
        homeButton.setTitleColor(.blue, for: .normal)
        homeButton.addTarget(self, action: #selector(homeButtonPushed), for: .touchUpInside)
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
        profileButton.addTarget(self, action: #selector(profileButtonPushed), for: .touchUpInside)
        profileButton.backgroundColor = .white
        profileButton.layer.borderWidth = 1
        profileButton.layer.borderColor = UIColor.lightGray.cgColor
        view.addSubview(profileButton)
        
        ///Set up collectionview:
        house1 = House(address: "312 College Ave", numPeople: 5, priceMin: 1000, priceMax: 1400, features: [], coverImageURL: "House1", landlord: "")
        house2 = House(address: "200 Eddy St", numPeople: 3, priceMin: 1200, priceMax: 1500, features: [], coverImageURL: "House2", landlord: "")
        house3 = House(address: "94 Cook St", numPeople: 6, priceMin: 1500, priceMax: 1700, features: [], coverImageURL: "House3", landlord: "")
        house4 = House(address: "282 College Ave", numPeople: 4, priceMin: 1100, priceMax: 1300, features: [], coverImageURL: "House4", landlord: "")
        house5 = House(address: "194 Linden Ave", numPeople: 6, priceMin: 1200, priceMax: 1400, features: [], coverImageURL: "House5", landlord: "")
        house6 = House(address: "226 Dryden Rd", numPeople: 3, priceMin: 1450, priceMax: 1600, features: [], coverImageURL: "House6", landlord: "")
        houses = [house1, house2, house3, house4, house5, house6]
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = padding
        layout.minimumInteritemSpacing = padding
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .white
        collectionView.register(HouseCollectionViewCell.self, forCellWithReuseIdentifier: cellReuseIdentifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        view.addSubview(collectionView)
        
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
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: padding),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            collectionView.bottomAnchor.constraint(equalTo: profileButton.topAnchor, constant: -padding+1),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding)
            ])
    }
    
    @objc func homeButtonPushed() {
        let viewController = PersonHomeView()
        navigationController?.pushViewController(viewController, animated: false)
    }
    
    @objc func profileButtonPushed() {
        let viewController = PersonProfileView()
        navigationController?.pushViewController(viewController, animated: false)
    }
}

extension PersonMatchView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return houses.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellReuseIdentifier, for: indexPath) as! HouseCollectionViewCell
        cell.configure(for: houses[indexPath.row])
        cell.backgroundColor = background
        return cell
    }
}

extension PersonMatchView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = (collectionView.frame.width - padding) / 2.0
        let height = (size / 4.0) * 3
        return CGSize(width: size, height: height)
    }
}

extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}
