//
//  WeatherViewModel.swift
//  ClimaTempo
//
//  Created by Eduardo Hoffmann on 30/06/23.
//

import Foundation
import UIKit

struct WeatherViewModel {
    
    private var chosenCity = ""
    
    
    mutating func formatWord(city: String) -> String {
        var cityFormated = city.replacingOccurrences(of: " ", with: "+")
        chosenCity = cityFormated
        return chosenCity
    }
   
    
    //Analisamos os dados de um formato JSON
    func parseJSON(weatherData: Data) -> WeatherApp? { //se torna optional para podermos retornal valor como NIL
        // 1 - Vamos para o Model criar a estrutura
        
        let decoder = JSONDecoder()
        do {
           let decodeData = try decoder.decode(WeatherModel.self, from: weatherData)
            let id = decodeData.weather[0].id
            let temp = decodeData.main.temp
            let name = decodeData.name
            
            let weatherApp = WeatherApp(conditionId: id, cityName: name, temperature: temp)
                print("ViewModel ==> \(weatherApp)")
                return weatherApp
            
        } catch {
            print(error)
            return nil
        }
       
    }
      
}
