//
//  NewsTableViewCell.swift
//  NewsApp
//
//  Created by Lucas Nahuel Guerra on 07/07/2024.
//

import UIKit

class NewsTableViewCell: UITableViewCell {

    static let identifier = "NewsTableViewCell"
    
    private let newsTitleLable: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 22, weight: .semibold)
        label.numberOfLines = 0
        return label
    }()
    
    private let newsSubTitleLable: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .light)
        label.numberOfLines = 0
        return label
    }()
    
    private let newsImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 6
        imageView.layer.masksToBounds = true
        imageView.backgroundColor = .secondarySystemBackground
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(newsTitleLable)
        contentView.addSubview(newsSubTitleLable)
        contentView.addSubview(newsImageView)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        newsTitleLable.frame = CGRect(
            x: 10,
            y: 0,
            width: contentView.frame.size.width - 170,
            height: 70
        )
        
        newsSubTitleLable.frame = CGRect(
            x: 10,
            y: 70,
            width: contentView.frame.size.width - 170,
            height: contentView.frame.size.height/2
        )
        
        newsImageView.frame = CGRect(
            x: contentView.frame.size.width - 150,
            y: 5,
            width: 140,
            height: contentView.frame.size.height - 10
        )
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        newsTitleLable.text = nil
        newsSubTitleLable.text = nil
        newsImageView.image = nil
    }
    
    func configure(with viewModel: NewsTableViewCellViewModel){
        
        newsTitleLable.text = viewModel.title
        newsSubTitleLable.text = viewModel.subtitle
        
        //Image
        
        if let data = viewModel.imageData {
            newsImageView.image = UIImage(data: data)
        } else if let url = viewModel.imageURL {
            
            //fetch
            URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
                guard let data = data, error == nil else {
                    return
                }
                viewModel.imageData = data
                DispatchQueue.main.async {
                    self?.newsImageView.image = UIImage(data: data)
                }
            }.resume()
        }
    }
}
