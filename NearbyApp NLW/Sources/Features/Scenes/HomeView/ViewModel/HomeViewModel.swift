//
//  HomeViewModel.swift
//  NearbyApp NLW
//
//  Created by Edgar Mesquita on 14/12/24.
//

import Foundation
import MapKit

class HomeViewModel {
    private let baseURL = "http://192.168.10.29:3333"
    var userLatidude = -23.561187293883442
    var userLongitude = -46.656451388116494
    
    var didUpdateCategories: (() -> Void)?
    var didUpdatePlaces: (() -> Void)?
    
    var places: [Place] = []
    var filteredPlaces: [Place] = []
    var categories: [Category] = []
    
    func fetchInitialData(completeion: @escaping ([Category])->Void){
        fetchCategories { categories in
            completeion(categories)
            if let foodCategory = categories.first(where: {$0.name=="Alimentação"}){
                self.fetchPlaces(for: foodCategory.id, userLocation: CLLocationCoordinate2D(latitude: self.userLatidude, longitude: self.userLongitude))
            }
        }
    }
    
    private func fetchCategories(completion: @escaping ([Category]) -> Void) {
        guard let url = URL(string: "\(baseURL)/categories") else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if error != nil {
                print("Deu erro =/")
                return
            }
            
            
            guard let data = data else {
                completion([])
                return
            }
            
            do {
                let categories = try JSONDecoder().decode([Category].self, from: data)
                
                DispatchQueue.main.async {
                    completion(categories)
                }
            } catch {
                completion([])
                print("Deu erro ao pegar categories de data")
            }
        }.resume()
    }
    
    func fetchPlaces(for categoryId: String, userLocation: CLLocationCoordinate2D) {
        guard let url = URL(string: "\(baseURL)/markets/category/\(categoryId)") else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                print("Deu erro =/")
                return
            }
            
            
            guard let data = data else {
                return
            }
            
            do {
                self.places = try JSONDecoder().decode([Place].self, from: data)
                
                DispatchQueue.main.async {
                    self.didUpdatePlaces?()
                }
            } catch  {
                print("Deu erro ao pegar categories de data")
            }
        }.resume()
    }
    
    
}
