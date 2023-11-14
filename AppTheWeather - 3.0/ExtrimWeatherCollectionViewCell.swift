//
//  ExtrimWeatherCollectionViewCell.swift
//  AppTheWeather - 3.0
//
//  Created by Максим Самороковский on 21.09.2023.
//

import UIKit

class ExtrimWeatherCollectionViewCell: UICollectionViewCell {
    
    lazy var extWeatherLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 19)
        return label
    }()

    lazy var anyExtWeatherLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 13)
        label.numberOfLines = 0
        return label
    }()

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func configure(extWeather: String?, anyExtWeather: String?) {
        if let extWeather = extWeather, !extWeather.isEmpty {
            extWeatherLabel.text = extWeather
            anyExtWeatherLabel.text = anyExtWeather
            isHidden = false
        } else {
            isHidden = true
        }
    }
    
    private func setupUI() {
        backgroundColor = #colorLiteral(red: 0.1517084837, green: 0.4493589401, blue: 0.7435367703, alpha: 1)
        layer.cornerRadius = 15
        
        let stackView = UIStackView(arrangedSubviews: [extWeatherLabel, anyExtWeatherLabel])
        stackView.axis = .vertical
        stackView.spacing = 10
        
        addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15),
        ])
        
        NSLayoutConstraint.activate([
            widthAnchor.constraint(equalToConstant: 383) 
        ])
    }
}

