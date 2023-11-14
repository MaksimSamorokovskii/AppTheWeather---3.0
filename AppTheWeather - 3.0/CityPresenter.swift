//
//  CityPresenter.swift
//  AppTheWeather - 3.0
//
//  Created by Максим Самороковский on 20.09.2023.
//

import UIKit

class CityPresenter {
    weak var weatherView: CityViewController?
    var interactor: CityInteractor?

    func viewDidLoad() {
        loadData()
    }

    func loadData() {
        guard let interactor = interactor else {
            return
        }

        let cityName = interactor.loadCityName()
        let cityTemperature = interactor.loadCityTemperature()
        let infoWeather = interactor.loadInfoWeather()
        let anyInfoWeather = interactor.loadAnyInfoWeather()
        let extWeather = interactor.extrimeInfoWeather()
        let anyExtWeather = interactor.anyInfoExtrimeWeather()
        let hourlyForecast = interactor.loadHourlyForecast()
        let dailyForecast = interactor.loadDailyForecast()
        let cityTemperatureAndInfoWeather = interactor.loadCityTemperatureAndInfoWeather()

        let cityModel = CityModel(cityName: cityName,
                                  cityTemperature: cityTemperature,
                                  infoWeather: infoWeather,
                                  anyInfoWeather: anyInfoWeather,
                                  extWeather: extWeather,
                                  anyExtWeather: anyExtWeather,
                                  hourlyForecast: hourlyForecast,
                                  dailyForecast: dailyForecast,
                                  cityTemperatureAndInfoWeather: cityTemperatureAndInfoWeather,
                                  cities: [])

        updateView(with: cityModel)
    }

    func updateView(with model: CityModel) {
        weatherView?.update(model: model)
    }
}





