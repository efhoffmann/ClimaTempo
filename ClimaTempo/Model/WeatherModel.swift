//
//  WeatherModel.swift
//  ClimaTempo
//
//  Created by Eduardo Hoffmann on 30/06/23.
//

import Foundation

// Falams que nossa struct esta em conformidade com o protocolo DECODABLE, decodifica o JSON
struct WeatherModel: Codable {
    let name: String
    //vamos no nivel superior do JSON verificar o nome da propriedade que é MAIN que é um objec=to com cinco itens
    let main: Main
    let weather: [Weather]
}

struct Main: Codable {
    let temp: Double
}

struct Weather: Codable { // Typealias CODABLE Combina Decodable e Encodable, permite decodificar e codificar os objetos em JSON
    let id: Int
}

struct WeatherApp {
    let conditionId: Int
    let cityName: String
    let temperature: Double
    
    var temperatureString: String {
        return String(format: "%.1f", temperature)
    }
    
    
    var conditionName: String {
        switch conditionId {
        case 200...232:
            return "cloud.bolt"
        case 300...321:
            return "cloud.drizzle"
        case 500...531:
            return "cloud.rain"
        case 600...622:
            return "cloud.snow"
        case 701...781:
            return "cloud.fog"
        case 800:
            return "sun.max"
        case 801...804:
            return "cloud.bolt"
        default:
            return "cloud"
        }
    }
}
