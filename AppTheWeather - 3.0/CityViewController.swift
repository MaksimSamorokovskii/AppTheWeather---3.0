//
//  CityViewController.swift
//  AppTheWeather - 3.0
//
//  Created by Максим Самороковский on 20.09.2023.
//
//

import UIKit

class CityViewController: UIViewController {
    var cityPresenter: CityPresenter!
    var model: CityModel!

    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.estimatedItemSize = CGSize(width: 380, height: 200)
        layout.minimumLineSpacing = 5
        return UICollectionView(frame: .zero, collectionViewLayout: layout)
    }()

    let bottomBarViewController = BottomBarViewController() 

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()

        cityPresenter = CityPresenter()
        cityPresenter.weatherView = self
        cityPresenter.interactor = CityInteractor()

        collectionView.dataSource = self
        collectionView.delegate = self

        collectionView.register(HeaderCollectionViewCell.self, forCellWithReuseIdentifier: "HeaderCellIdentifier")
        collectionView.register(HourlyWeatherCollectionViewCell.self, forCellWithReuseIdentifier: "HourlyWeatherCellIdentifier")
        collectionView.register(DailyWeatherCollectionViewCell.self, forCellWithReuseIdentifier: "DailyWeatherCellIdentifier")
        collectionView.register(ExtrimWeatherCollectionViewCell.self, forCellWithReuseIdentifier: "ExtrimWeatherCellIdentifier")

        cityPresenter.loadData()

        collectionView.isScrollEnabled = true
        collectionView.backgroundColor = .clear

        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0)
        }
    }

    func setup() {
        view.addSubview(collectionView)

        collectionView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])

        addChild(bottomBarViewController)
        view.addSubview(bottomBarViewController.view)
        bottomBarViewController.didMove(toParent: self)

        bottomBarViewController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            bottomBarViewController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bottomBarViewController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bottomBarViewController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            bottomBarViewController.view.heightAnchor.constraint(equalToConstant: 30)
        ])
    }

    func update(model: CityModel) {
        self.model = model
        collectionView.reloadData()
    }
}

extension CityViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 4
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else if section == 2 {
            return 1
        } else {
            return 1
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HeaderCellIdentifier", for: indexPath) as! HeaderCollectionViewCell
            cell.configure(cityName: model.cityName, cityTemperature: model.cityTemperature, infoWeather: model.infoWeather, anyInfoWeather: model.anyInfoWeather)
            return cell
        } else if indexPath.section == 2 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HourlyWeatherCellIdentifier", for: indexPath) as! HourlyWeatherCollectionViewCell
            let hourlyForecastData = model.hourlyForecast
            cell.configure(hourlyForecastData: hourlyForecastData)
            return cell
        } else if indexPath.section == 3 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DailyWeatherCellIdentifier", for: indexPath) as! DailyWeatherCollectionViewCell
            cell.configure(with: model.dailyForecast)
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ExtrimWeatherCellIdentifier", for: indexPath) as! ExtrimWeatherCollectionViewCell
            let extWeather = cityPresenter.interactor?.extrimeInfoWeather()
            let anyExtWeather = cityPresenter.interactor?.anyInfoExtrimeWeather()
            cell.configure(extWeather: extWeather, anyExtWeather: anyExtWeather)

            if extWeather == nil || extWeather?.isEmpty == true {
                cell.isHidden = true
            }

            return cell
        }
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if section == 2 || section == 3 {
            return UIEdgeInsets(top: 5, left: 15, bottom: 5, right: 15)
        } else if section == 1 {
            if let extWeather = cityPresenter.interactor?.extrimeInfoWeather(), !extWeather.isEmpty {
                return UIEdgeInsets(top: 90, left: 15, bottom: 5, right: 15)
            } else {
                return UIEdgeInsets(top: 50, left: 15, bottom: 5, right: 15)
            }
        }
        return UIEdgeInsets.zero
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 0 {
            return CGSize(width: collectionView.bounds.width, height: 200)
        } else if indexPath.section == 2 {
            return CGSize(width: collectionView.bounds.width - 30, height: 130)
        } else if indexPath.section == 3 {
            return CGSize(width: collectionView.bounds.width - 30, height: 220)
        } else {
            return CGSize(width: 380, height: 160)
        }
    }
}



