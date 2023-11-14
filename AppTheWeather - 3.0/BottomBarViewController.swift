//
//  BottomBarViewController.swift
//  AppTheWeather - 3.0
//
//  Created by Максим Самороковский on 22.09.2023.
//

import UIKit

class BottomBarViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    func setupUI() {
    
        let backgroundView = UIView()
        backgroundView.backgroundColor = #colorLiteral(red: 0.1517084837, green: 0.4493589401, blue: 0.7435367703, alpha: 1)
        
        let separatorView = UIView()
        separatorView.backgroundColor = #colorLiteral(red: 0.2535440922, green: 0.5439165831, blue: 0.8427428603, alpha: 1)
        
        let mapButton = UIButton(type: .system)
        mapButton.setImage(UIImage(named: "map"), for: .normal)
        mapButton.tintColor = UIColor.white
        
        let cursorButton = UIButton(type: .system)
        cursorButton.setImage(UIImage(named: "cursor"), for: .normal)
        cursorButton.tintColor = UIColor.white
        
        let pointButton = UIButton(type: .system)
        pointButton.setImage(UIImage(named: "point"), for: .normal)
        pointButton.tintColor = UIColor.white
        
        let menuButton = UIButton(type: .system)
        menuButton.setImage(UIImage(named: "menu"), for: .normal)
        menuButton.tintColor = UIColor.white
        
        view.addSubview(backgroundView)
        view.addSubview(separatorView)
        view.addSubview(mapButton)
        view.addSubview(cursorButton)
        view.addSubview(pointButton)
        view.addSubview(menuButton)
        
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        separatorView.translatesAutoresizingMaskIntoConstraints = false
        mapButton.translatesAutoresizingMaskIntoConstraints = false
        cursorButton.translatesAutoresizingMaskIntoConstraints = false
        pointButton.translatesAutoresizingMaskIntoConstraints = false
        menuButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundView.heightAnchor.constraint(equalToConstant: 70),
            
            separatorView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            separatorView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            separatorView.topAnchor.constraint(equalTo: backgroundView.topAnchor),
            separatorView.heightAnchor.constraint(equalToConstant: 1),
            
            mapButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            mapButton.topAnchor.constraint(equalTo: view.topAnchor, constant: -30),
            mapButton.widthAnchor.constraint(equalToConstant: 30),
            mapButton.heightAnchor.constraint(equalToConstant: 30),
            
            cursorButton.leadingAnchor.constraint(equalTo: mapButton.trailingAnchor, constant: 140),
            cursorButton.topAnchor.constraint(equalTo: view.topAnchor, constant: -23),
            cursorButton.widthAnchor.constraint(equalToConstant: 15),
            cursorButton.heightAnchor.constraint(equalToConstant: 15),
            
            pointButton.leadingAnchor.constraint(equalTo: cursorButton.trailingAnchor, constant: 4),
            pointButton.topAnchor.constraint(equalTo: view.topAnchor, constant: -23),
            pointButton.widthAnchor.constraint(equalToConstant: 15),
            pointButton.heightAnchor.constraint(equalToConstant: 15),
            
            menuButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            menuButton.topAnchor.constraint(equalTo: view.topAnchor, constant: -28),
            menuButton.widthAnchor.constraint(equalToConstant: 30),
            menuButton.heightAnchor.constraint(equalToConstant: 30),
        ])
    }
}
