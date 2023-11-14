//
//  DailyWeatherCollectionViewCell.swift
//  AppTheWeather - 3.0
//
//  Created by Максим Самороковский on 21.09.2023.
//


import UIKit

class DailyWeatherCollectionViewCell: UICollectionViewCell {
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 7
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }
    
    func configure(with dailyForecastData: [DailyForecastData]) {
        stackView.subviews.forEach { $0.removeFromSuperview() }
        
        // Добавляем "ПРОГНОЗ НА 10 ДНЕЙ"
        let titleLabel = UILabel()
        titleLabel.text = "ПРОГНОЗ НА 10 ДНЕЙ"
        titleLabel.textColor = #colorLiteral(red: 0.4081510305, green: 0.7174223065, blue: 1, alpha: 1)
        titleLabel.font = UIFont.systemFont(ofSize: 13)
        stackView.addArrangedSubview(titleLabel)
    
        addSeparatorLine(to: stackView)
        
        var maxLength = 0
        
        for data in dailyForecastData {
            if let day = data.day, day.count > maxLength {
                maxLength = day.count
            }
        }
    
        let dayLabelWidth: CGFloat = CGFloat(maxLength) * 10
        
        let horizontalStackViewHeight: CGFloat = 25
        
        for (index, data) in dailyForecastData.enumerated() {
            if let day = data.day {
                let dayLabel = UILabel()
                dayLabel.text = day
                dayLabel.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                dayLabel.font = UIFont.systemFont(ofSize: 16)
                dayLabel.widthAnchor.constraint(equalToConstant: dayLabelWidth).isActive = true
                
                let icon1ImageView = UIImageView(image: data.icon1)
                
                let minTempLabel = UILabel()
                minTempLabel.text = data.minTemp
                minTempLabel.textColor = #colorLiteral(red: 0.4081510305, green: 0.7174223065, blue: 1, alpha: 1)
                minTempLabel.font = UIFont.systemFont(ofSize: 16)
                
                let icon2ImageView = UIImageView(image: data.icon2)
                
                let maxTempLabel = UILabel()
                maxTempLabel.text = data.maxTemp
                maxTempLabel.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                maxTempLabel.font = UIFont.systemFont(ofSize: 16)
                
                let horizontalStackView = UIStackView(arrangedSubviews: [dayLabel, icon1ImageView, minTempLabel, icon2ImageView, maxTempLabel])
                horizontalStackView.axis = .horizontal
                horizontalStackView.alignment = .center
                horizontalStackView.distribution = .fill
                horizontalStackView.spacing = 28
            
                horizontalStackView.heightAnchor.constraint(equalToConstant: horizontalStackViewHeight).isActive = true
                
                stackView.addArrangedSubview(horizontalStackView)
                
                if index < dailyForecastData.count - 1 {
                    addSeparatorLine(to: stackView)
                }
            }
        }
    }
    
    private func setupUI() {
        backgroundColor = #colorLiteral(red: 0.1517084837, green: 0.4493589401, blue: 0.7435367703, alpha: 1)
        layer.cornerRadius = 10
        layer.masksToBounds = true
    
        addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15)
        ])
    }
    
    private func addSeparatorLine(to stackView: UIStackView) {
        let separatorView = UIView()
        separatorView.backgroundColor = #colorLiteral(red: 0.2535440922, green: 0.5439165831, blue: 0.8427428603, alpha: 1)
        separatorView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        stackView.addArrangedSubview(separatorView)
    }
}

