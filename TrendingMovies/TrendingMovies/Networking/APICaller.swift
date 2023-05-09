//
//  APICaller.swift
//  TrendingMovies
//
//  Created by Şevval Alev on 8.05.2023.
//

import Foundation

enum NetworkError: Error {
    case urlError
    case canNotParseData
}

class APICaller {
    
    static func getTrendingMovies(
        //<Success,Fail>
        completionHandler: @escaping (_ result: Result<TrendingMovieModel,Error>) -> Void) {
        
            let urlString = NetworkConstant.shared.serverAddress + "trending/all/day?api_key=" + NetworkConstant.shared.apiKey
            
            guard let url = URL(string: urlString) else {
                completionHandler(.failure(NetworkError.urlError))
                return
            }
            
            URLSession.shared.dataTask(with: url) { dataResponse , urlResponse, error in
                
                if error == nil,
                   let data = dataResponse,
                   let resultData = try? JSONDecoder().decode(TrendingMovieModel.self, from: data) {
                    completionHandler(.success(resultData))
                } else {
                    completionHandler(.failure(NetworkError.canNotParseData))
                }
                
            }.resume()
    }
}
