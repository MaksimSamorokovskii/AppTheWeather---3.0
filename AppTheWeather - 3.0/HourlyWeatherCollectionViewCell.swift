//
//  HourlyWeatherCollectionViewCell.swift
//  AppTheWeather - 3.0
//
//  Created by Максим Самороковский on 21.09.2023.
//

import UIKit

class HourlyWeatherCollectionViewCell: UICollectionViewCell {
    lazy var timeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()

    lazy var iconImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()

    lazy var temperatureLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()

    lazy var hourlyForecastLabel: UILabel = {
        let label = UILabel()
        label.textColor = #colorLiteral(red: 0.4081510305, green: 0.7174223065, blue: 1, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 13, weight: .medium)
        label.text = "ПОЧАСОВОЙ ПРОГНОЗ"
        return label
    }()

    let horizontalStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.spacing = 10
        return stackView
    }()

    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        return scrollView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        backgroundColor = #colorLiteral(red: 0.1517084837, green: 0.4493589401, blue: 0.7435367703, alpha: 1)

        layer.cornerRadius = 10
        layer.masksToBounds = true
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
        backgroundColor = #colorLiteral(red: 0.1517084837, green: 0.4493589401, blue: 0.7435367703, alpha: 1)

        layer.cornerRadius = 10
        layer.masksToBounds = true
    }

    func configure(hourlyForecastData: [HourlyForecastData]) {
        for data in hourlyForecastData {
            let timeLabel = UILabel()
            timeLabel.text = data.time
            timeLabel.textColor = .white
            let iconImageView = UIImageView(image: data.icon)
            let temperatureLabel = UILabel()
            temperatureLabel.text = data.temperature
            temperatureLabel.textColor = .white

            let verticalStack = UIStackView(arrangedSubviews: [timeLabel, iconImageView, temperatureLabel])
            verticalStack.axis = .vertical
            verticalStack.alignment = .center
            verticalStack.spacing = 10

            horizontalStack.addArrangedSubview(verticalStack)
        }
    }

    private func setupUI() {
        addSubview(hourlyForecastLabel)
        scrollView.addSubview(horizontalStack)
        addSubview(scrollView)

        hourlyForecastLabel.translatesAutoresizingMaskIntoConstraints = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        horizontalStack.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            hourlyForecastLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            hourlyForecastLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            hourlyForecastLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),

            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            scrollView.topAnchor.constraint(equalTo: hourlyForecastLabel.bottomAnchor, constant: 10),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),

            horizontalStack.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            horizontalStack.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            horizontalStack.topAnchor.constraint(equalTo: scrollView.topAnchor),
            horizontalStack.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
        ])
        
        let cellWidthConstraint = widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 30)
        cellWidthConstraint.priority = .defaultHigh
        cellWidthConstraint.isActive = true
    }
}


