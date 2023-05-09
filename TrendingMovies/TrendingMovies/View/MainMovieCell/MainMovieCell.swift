//
//  MainMovieCell.swift
//  TrendingMovies
//
//  Created by Şevval Alev on 8.05.2023.
//

import UIKit
import SDWebImage

class MainMovieCell: UITableViewCell {

    public static var identifier: String {
        get {
            return "MainMovieCell"
        }
    }
    
    public static func register() -> UINib {
        UINib(nibName: "MainMovieCell", bundle: nil)
    }
    
    // MARK: IBOutlets
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var rateLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
            
        backView.addBorder(color: .label, width: 1)
        backView.round()
        movieImageView.round(5)
    }
    

    func setupCell(viewModel: MovieTableCellViewModel) {
        self.nameLabel.text = viewModel.title
        self.dateLabel.text = viewModel.date
        self.rateLabel.text = viewModel.rating
        self.movieImageView.sd_setImage(with: viewModel.imageUrl)
    }
    
}
