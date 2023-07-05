//
//  WeatherAPI.swift
//  ClimaTempo
//
//  Created by Eduardo Hoffmann on 30/06/23.
//

import Foundation

struct WeatherAPI {
    //1 - Crio a propriedade weatherURL - Lembrando de retirar o parametro q=London pq vamos usar o que o user digitar no textField
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=cb57c1c488f7a935c994b98edab4b37b&units=metric"
 
    //2 - Crio um método BUSCAR temperatura, onde recebo uma string como parametro, q vai ser o nome da cidade
    
    func fetchWeather(cityName: String) {
        
        // 3 - Dentro do metodo, crio uma constante onde eu vou fazer a combinação da string base e a cidade desejada, com a inerpolação de string \(q=cityName)
        let urlString = "\(weatherURL)&q=\(cityName)"

        Network().performRequest(urlString: urlString)
        // 4 - Volto para o ViewController e crio a variavel q ira enxergar o arquivo API
        
    }
    
    
}



