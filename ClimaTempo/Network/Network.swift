//
//  Network.swift
//  ClimaTempo
//
//  Created by Eduardo Hoffmann on 30/06/23.
//

import Foundation

protocol WeatherNetworkDelegate: AnyObject {
    func didUpdateWeather(weather: WeatherApp)
}

struct Network {
    
    var delegate: WeatherNetworkDelegate?
    
    func performRequest(urlString: String) {
        // 1 - Vamos criar a URL com if let, pois a url pode conter erros
        if let url = URL(string: urlString) {
            // 2 - Criamos nossa URL session object, para navegar igual a web, permite executar a rede
            let session = URLSession(configuration: .default)
            // 3 - Atribuimos uma tarefa a sessao anteior. Recuper o conteudo da URL especificada e em seguida chama o manipulador (handler)
            // utilizando closures (funções anonimas) com os tres valores: data, response, e error
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    print(error!)
                    return
                }
                
                if let safeData = data {
                    /* Convertemos o conteudo de data em String
                    let dataString = String(data: safeData, encoding: .utf8) */
                   // parseJSON(weatherData: safeData)
                    if let weather = WeatherViewModel().parseJSON(weatherData: safeData) {
                        self.delegate?.didUpdateWeather(weather: weather)
                        
                      print("Network ===> \(weather)")
                        
                    }
                    
                }
            }
            task.resume()
        }
    }
    
    
}
