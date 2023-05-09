//
//  DetailsMovieViewModel.swift
//  TrendingMovies
//
//  Created by Şevval Alev on 9.05.2023.
//

import Foundation

class DetailsMovieViewModel {
    
    var movie: Movie
    
    var movieImage: URL?
    var movieTitle: String?
    var movieDescription: String?
    var movieID: Int
    var rate: Double?
    
    init(movie: Movie) {
        self.movie = movie
        
        self.movieTitle = movie.name ?? movie.title ?? ""
        self.movieID = movie.id
        self.movieDescription = movie.overview ?? ""
        self.movieImage = makeImageURL(movie.backdropPath ?? "")
        self.rate = movie.voteAverage ?? 0.0
    }
    
    private func makeImageURL( _ imageCode: String) -> URL? {
        URL(string: "\(NetworkConstant.shared.imageServerAddress)\(imageCode)")
    }
}
