//
//  CityAssemble.swift
//  AppTheWeather - 3.0
//
//  Created by Максим Самороковский on 20.09.2023.
//

import UIKit

class CityAssemble {
    static func setup() -> UIViewController {
        let cityViewController = CityViewController()
        let cityPresenter = CityPresenter()
        let cityInteractor = CityInteractor()

        cityPresenter.interactor = cityInteractor
        cityViewController.cityPresenter = cityPresenter

        return cityViewController
    }
}



