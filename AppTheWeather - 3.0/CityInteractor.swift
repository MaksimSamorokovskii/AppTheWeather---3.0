//
//  CityInteractor.swift
//  AppTheWeather - 3.0
//
//  Created by Максим Самороковский on 20.09.2023.
//

import UIKit

struct HourlyForecastData {
    let time: String?
    let icon: UIImage?
    let temperature: String
}

struct DailyForecastData {
    let day: String?
    let icon1: UIImage?
    let minTemp: String?
    let icon2: UIImage?
    let maxTemp: String?
}

class CityInteractor {
    
    
    func loadCityName() -> String {
        return "Самара"
    }
    
    func loadCityTemperature() -> String {
        return "30"//"30°"
    }
    
    func loadInfoWeather() -> String {
        return "Преимущественно солнечно"
    }
    
    func loadCityTemperatureAndInfoWeather() -> String {
        let cityTemperature = loadCityTemperature()
        let infoWeather = loadInfoWeather()
        
        let shortInfo = ("\(cityTemperature) | \(infoWeather)")
        
        return shortInfo
    }
    
    func loadAnyInfoWeather() -> String {
        return "Макс.: 31° ,мин.:26°"
    }
    
    func extrimeInfoWeather() -> String {
        return "Экстремальная погода"
    }
    
    func anyInfoExtrimeWeather() -> String {
        return "Предупреждение об очень сильном дожде действует до 18:08 (субблота, 29 июля). Дополнительное напоминание: Предупреждение о сильном дожде."
    }
    
    func loadHourlyForecast() -> [HourlyForecastData] {
        let hourlyForecast = [
            HourlyForecastData(time: "Сейчас", icon: UIImage(named: "sunny") ?? UIImage(), temperature: "30°"),
            HourlyForecastData(time: "12", icon: UIImage(named: "sunny") ?? UIImage(), temperature: "30°"),
            HourlyForecastData(time: "13", icon: UIImage(named: "cloudy") ?? UIImage(), temperature: "32°"),
            HourlyForecastData(time: "14", icon: UIImage(named: "cloudy") ?? UIImage(), temperature: "33°"),
            HourlyForecastData(time: "15", icon: UIImage(named: "cloudy") ?? UIImage(), temperature: "34°"),
            HourlyForecastData(time: "16", icon: UIImage(named: "sunny") ?? UIImage(), temperature: "34°"),
            HourlyForecastData(time: "17", icon: UIImage(named: "sunny") ?? UIImage(), temperature: "28°"),
            HourlyForecastData(time: "18", icon: UIImage(named: "sunny") ?? UIImage(), temperature: "26°"),
            HourlyForecastData(time: "19", icon: UIImage(named: "sunny") ?? UIImage(), temperature: "25°"),
            HourlyForecastData(time: "20", icon: UIImage(named: "cloudy") ?? UIImage(), temperature: "22°"),
            HourlyForecastData(time: "21", icon: UIImage(named: "cloudy") ?? UIImage(), temperature: "20°"),
            HourlyForecastData(time: "22", icon: UIImage(named: "cloudy") ?? UIImage(), temperature: "19°"),
            HourlyForecastData(time: "23", icon: UIImage(named: "cloudy") ?? UIImage(), temperature: "18°"),
            HourlyForecastData(time: "00", icon: UIImage(named: "cloudy") ?? UIImage(), temperature: "16°"),
            HourlyForecastData(time: "01", icon: UIImage(named: "cloudy") ?? UIImage(), temperature: "16°"),
            HourlyForecastData(time: "02", icon: UIImage(named: "cloudy") ?? UIImage(), temperature: "16°"),
            HourlyForecastData(time: "03", icon: UIImage(named: "cloudy") ?? UIImage(), temperature: "15°"),
            HourlyForecastData(time: "04", icon: UIImage(named: "cloudy") ?? UIImage(), temperature: "15°"),
            HourlyForecastData(time: "05", icon: UIImage(named: "sunny") ?? UIImage(), temperature: "15°"),
            HourlyForecastData(time: "06", icon: UIImage(named: "sunny") ?? UIImage(), temperature: "18°"),
            HourlyForecastData(time: "07", icon: UIImage(named: "sunny") ?? UIImage(), temperature: "20°"),
            HourlyForecastData(time: "08", icon: UIImage(named: "sunny") ?? UIImage(), temperature: "24°"),
            HourlyForecastData(time: "09", icon: UIImage(named: "sunny") ?? UIImage(), temperature: "25°"),
            HourlyForecastData(time: "10", icon: UIImage(named: "sunny") ?? UIImage(), temperature: "28°"),
            HourlyForecastData(time: "11", icon: UIImage(named: "sunny") ?? UIImage(), temperature: "31°"),
            HourlyForecastData(time: "12", icon: UIImage(named: "sunny") ?? UIImage(), temperature: "33°"),
            HourlyForecastData(time: "13", icon: UIImage(named: "sunny") ?? UIImage(), temperature: "33°"),
        ]
        return hourlyForecast
    }
    
    func loadDailyForecast() -> [DailyForecastData] {
        
        let dailyForecast = [
            DailyForecastData(day: "Сегодня", icon1: UIImage(named: "sunny") ?? UIImage(), minTemp: "20°", icon2: UIImage(named: "line") ?? UIImage(), maxTemp: "28°"),
            DailyForecastData(day: "Вт", icon1: UIImage(named: "sunny") ?? UIImage(), minTemp: "18°", icon2: UIImage(named: "line") ?? UIImage(), maxTemp: "26°"),
            DailyForecastData(day: "Ср", icon1: UIImage(named: "cloudy") ?? UIImage(), minTemp: "15°", icon2: UIImage(named: "line") ?? UIImage(), maxTemp: "23°"),
            DailyForecastData(day: "Чт", icon1: UIImage(named: "cloudy") ?? UIImage(), minTemp: "20°", icon2: UIImage(named: "line") ?? UIImage(), maxTemp: "29°"),
            DailyForecastData(day: "Пт", icon1: UIImage(named: "cloudy") ?? UIImage(), minTemp: "21°", icon2: UIImage(named: "line") ?? UIImage(), maxTemp: "32°"),
            DailyForecastData(day: "Сб", icon1: UIImage(named: "sunny") ?? UIImage(), minTemp: "25°", icon2: UIImage(named: "line") ?? UIImage(), maxTemp: "33°"),
            DailyForecastData(day: "Вс", icon1: UIImage(named: "sunny") ?? UIImage(), minTemp: "22°", icon2: UIImage(named: "line") ?? UIImage(), maxTemp: "30°"),
            DailyForecastData(day: "Пн", icon1: UIImage(named: "sunny") ?? UIImage(), minTemp: "24°", icon2: UIImage(named: "line") ?? UIImage(), maxTemp: "31°"),
            DailyForecastData(day: "Вт", icon1: UIImage(named: "sunny") ?? UIImage(), minTemp: "21°", icon2: UIImage(named: "line") ?? UIImage(), maxTemp: "32°"),
            DailyForecastData(day: "Ср", icon1: UIImage(named: "cloudy") ?? UIImage(), minTemp: "20°", icon2: UIImage(named: "line") ?? UIImage(), maxTemp: "28°"),
        ]
        return dailyForecast
    }
}


