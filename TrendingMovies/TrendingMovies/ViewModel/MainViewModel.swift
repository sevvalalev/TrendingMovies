//
//  MainViewModel.swift
//  TrendingMovies
//
//  Created by Şevval Alev on 7.05.2023.
//

import Foundation

class MainViewModel {
    
    var isLoading: Observable<Bool> = Observable(false)
    var cellDataSource: Observable<[MovieTableCellViewModel]> = Observable(nil)
    var dataSource: TrendingMovieModel?
    
    func numberOfSections() -> Int {
        1
    }
    
    func numberOfRows(in section: Int) -> Int {
        self.dataSource?.results.count ?? 0
    }
    
    func getData() {
        if isLoading.value ?? true {
            return
        }
        isLoading.value = true
        APICaller.getTrendingMovies { [weak self] result in
            self?.isLoading.value = false
            switch result {
            case .success(let data):
                print("Top Trending Counts: \(data.results.count)")
                self?.dataSource = data
                self?.mapCellData()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func mapCellData() {
        self.cellDataSource.value = self.dataSource?.results.compactMap({MovieTableCellViewModel(movie: $0)})
    }
    
    func getMovieTitle(_ movie: Movie) -> String {
        return movie.title ?? movie.name ?? ""
    }
}
