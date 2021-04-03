//
//  WeatherInfo.swift
//  CombinePractice
//
//  Created by Koro Saka on 2021-04-03.
//

import Foundation

struct WeatherInfo: Codable {
    let title: String
    let description: Description
}

struct Description: Codable {
    let text: String
    let publicTime: Date
}
