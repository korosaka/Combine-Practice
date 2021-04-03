//
//  WeatherInfoView.swift
//  CombinePractice
//
//  Created by Koro Saka on 2021-04-03.
//

import SwiftUI

struct WeatherInfoView: View {
    @ObservedObject var viewModel: WeatherInfoViewModel
    var body: some View {
        VStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            Text("Combine Test")
        }
        .onAppear {
            print("onAppear")
            viewModel.fetchWeatherInfo()
        }
    }
}

struct WeatherInfoView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherInfoView(viewModel: .init())
    }
}
