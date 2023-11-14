//
//  CityModel.swift
//  AppTheWeather - 3.0
//
//  Created by Максим Самороковский on 20.09.2023.
//

import UIKit

struct CityModel {
    var cityName: String?
    var cityTemperature: String?
    var infoWeather: String?
    var anyInfoWeather: String?
    var extWeather: String?
    var anyExtWeather: String?
    var hourlyForecast: [HourlyForecastData]
    var dailyForecast: [DailyForecastData]
    var cityTemperatureAndInfoWeather: String?
    var cities: [String] = []

    func copyWith(cityName: String? = nil, cityTemperature: String? = nil, infoWeather: String? = nil, anyInfoWeather: String? = nil) -> CityModel {
        return CityModel(
            cityName: cityName ?? self.cityName,
            cityTemperature: cityTemperature ?? self.cityTemperature,
            infoWeather: infoWeather ?? self.infoWeather,
            anyInfoWeather: anyInfoWeather ?? self.anyInfoWeather,
            extWeather: self.extWeather,
            anyExtWeather: self.anyExtWeather,
            hourlyForecast: self.hourlyForecast,
            dailyForecast: self.dailyForecast,
            cityTemperatureAndInfoWeather: self.cityTemperatureAndInfoWeather,
            cities: self.cities
        )
    }
}
