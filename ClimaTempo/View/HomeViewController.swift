//
//  HomeViewController.swift
//  ClimaTempo
//
//  Created by Eduardo Hoffmann on 30/06/23.
//

import UIKit

//Acrescentamos UITextFieldDelegate para nosso textfiel se comunicar com nossa view controller

class HomeViewController: UIViewController, UITextFieldDelegate, WeatherNetworkDelegate {
    
    private var weatherAPI = WeatherAPI()
    private var weatherViewModel = WeatherViewModel()
    private var weatherNetwork = Network()
    
    //MARK:- Outlets
    
    @IBOutlet var currentLocalizationButton: UIButton!
    @IBOutlet var weatherImage: UIImageView!
    @IBOutlet var temperatureLabel: UILabel!
    @IBOutlet var countryLabel: UILabel!
    @IBOutlet weak var searchTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        weatherNetwork.delegate = self
        searchTextField.delegate = self
       
    }
    
    //MARK:-- Actions
    
    @IBAction func searchButton(_ sender: UIButton) {
    
        if let city = searchTextField.text {
          var cityModify = weatherViewModel.formatWord(city: city)
            weatherAPI.fetchWeather(cityName: cityModify)
            
        }
        
        // Informe que a pesquisa acabou e pode fechar o teclado
        searchTextField.endEditing(true)
    }
    
    
    //MARK:-- Méthods
    
    //Permite que a classe atual possa interagir com o botão RETURN do teclado, retornando true ou false
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print(searchTextField.text!)
        
        searchTextField.endEditing(true)
        return true
    }
    
    // Método que verifica se o textField está vazio
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            return true
        } else {
            textField.placeholder = "Digite uma cidade"
            return false
        }
    }
    
    //Limpa o campo TextField assim que o usuário pressiona qualquer um dos botões de pesquisar
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        //Utiliza o valor digitado em TextField para procurar o clima da cidade digitada.
        
        searchTextField.text = ""
        searchTextField.placeholder = "Pesquisar"
        
    }
    
    func didUpdateWeather(weather: WeatherApp) {
        print("Este \(weather)")
        print("ola \(weather.conditionId)")
    }
}
