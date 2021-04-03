//
//  WeatherInfoViewModel.swift
//  CombinePractice
//
//  Created by Koro Saka on 2021-04-03.
//

import Foundation
import Combine
class WeatherInfoViewModel: ObservableObject {
    
    //MARK: this property must be kept to do async task with Combine
    var cancelable: AnyCancellable?
    
    func fetchWeatherInfo() {
        let url = URL(string: "https://weather.tsukumijima.net/api/forecast?city=400040")
        let request = URLRequest(url: url!)
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        
        cancelable = URLSession.shared.dataTaskPublisher(for: request)
            .map({ (data, response) in
                return data
            })
            .decode(type: WeatherInfo.self, decoder: decoder)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    print(error.localizedDescription)
                case .finished:
                    print("Finish!")
                }
            }, receiveValue: { weatherInfo in
                print(weatherInfo.title)
                print(weatherInfo.description.text)
            })
    }
    
}
