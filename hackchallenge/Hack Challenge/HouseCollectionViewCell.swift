//
//  HouseCollectionViewCell.swift
//  Hack Challenge
//
//  Created by Library User on 11/21/19.
//  Copyright © 2019 Library User. All rights reserved.
//

import UIKit

class HouseCollectionViewCell: UICollectionViewCell {
    
    var address: UILabel!
    var numPeople: UILabel!
    var priceRange: UILabel!
    var coverImage: UIImageView!
    
    let padding: CGFloat = 8
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        address = UILabel()
        address.textAlignment = .left
        address.font = UIFont.systemFont(ofSize: 14)
        address.translatesAutoresizingMaskIntoConstraints = false
        //address.backgroundColor = .white
        contentView.addSubview(address)
        
        numPeople = UILabel()
        numPeople.textAlignment = .left
        numPeople.font = UIFont.systemFont(ofSize: 11)
        numPeople.translatesAutoresizingMaskIntoConstraints = false
        //numPeople.backgroundColor = .white
        contentView.addSubview(numPeople)
        
        priceRange = UILabel()
        priceRange.textAlignment = .right
        priceRange.font = UIFont.systemFont(ofSize: 11)
        priceRange.translatesAutoresizingMaskIntoConstraints = false
        //priceRange.backgroundColor = .white
        contentView.addSubview(priceRange)
        
        coverImage = UIImageView()
        coverImage.contentMode = .scaleAspectFill
        coverImage.layer.masksToBounds = true
        coverImage.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(coverImage)
        
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            coverImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            coverImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            coverImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            coverImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -50)
            ])
        NSLayoutConstraint.activate([
            address.topAnchor.constraint(equalTo: coverImage.bottomAnchor, constant: padding),
            address.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding)
            ])
        NSLayoutConstraint.activate([
            numPeople.topAnchor.constraint(equalTo: address.bottomAnchor, constant: 4),
            numPeople.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding)
            ])
        NSLayoutConstraint.activate([
            priceRange.topAnchor.constraint(equalTo: address.bottomAnchor, constant: 4),
            priceRange.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding)
            ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(for house: House) {
        coverImage.image = UIImage(named: house.coverImageURL)
        address.text = house.address
        numPeople.text = String(house.numPeople) + " people"
        priceRange.text = "$" + String(house.priceMin) + "-" + String(house.priceMax)
    }
}
