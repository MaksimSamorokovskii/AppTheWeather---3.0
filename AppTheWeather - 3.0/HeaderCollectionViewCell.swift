//
//  HeaderCollectionViewCell.swift
//  AppTheWeather - 3.0
//
//  Created by Максим Самороковский on 21.09.2023.
//

import UIKit

class HeaderCollectionViewCell: UICollectionViewCell {

    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    lazy var cityNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 30, weight: .medium)
        return label
    }()

    lazy var temperatureLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 80, weight: .light)
        return label
    }()

    lazy var infoWeatherLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()

    lazy var anyInfoWeatherLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubviews()
    }

    required init?(coder: NSCoder) {
        fatalError()
    }

    func configure(cityName: String?, cityTemperature: String?, infoWeather: String?, anyInfoWeather: String?) {
        cityNameLabel.text = cityName
        temperatureLabel.text = cityTemperature
        infoWeatherLabel.text = infoWeather
        anyInfoWeatherLabel.text = anyInfoWeather
    }

    func setupSubviews() {
        stackView.addArrangedSubview(cityNameLabel)
        stackView.addArrangedSubview(temperatureLabel)
        stackView.addArrangedSubview(infoWeatherLabel)
        stackView.addArrangedSubview(anyInfoWeatherLabel)

        contentView.addSubview(stackView)
        contentView.backgroundColor = .clear

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 80),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
}




