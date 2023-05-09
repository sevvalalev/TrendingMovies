//
//  NetworkConstants.swift
//  TrendingMovies
//
//  Created by Şevval Alev on 8.05.2023.
//

import Foundation

class NetworkConstant {
    
    public static var shared: NetworkConstant = NetworkConstant()
    //for singletone pattern
    private init() {
        
    }
    
    public var apiKey: String {
        // just read only
        get{
            return "3ae9bd6ca029482fd304d1b86f467b17"
        }
    }
    
    public var serverAddress: String {
        get{
            return "https://api.themoviedb.org/3/"
        }
    }
    
    public var imageServerAddress: String {
        get{
            return "https://image.tmdb.org/t/p/w500/"
        }
    }
}
