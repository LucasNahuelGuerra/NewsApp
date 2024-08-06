//
//  UsersTableViewCell.swift
//  NewsApp
//
//  Created by Lucas Nahuel Guerra on 08/07/2024.
//

import UIKit

class UsersTableViewCell: UITableViewCell {
    
    @IBOutlet var name: UILabel!
    @IBOutlet var phone: UILabel!
    @IBOutlet var location: UILabel!
    @IBOutlet var userImage: UIImageView!
    
    
    
    static let identifier = "userCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    func configure(with usersModel: UsersTableViewModel){
        
        name.text = usersModel.name
        phone.text = usersModel.phone
        location.text = usersModel.location
        
        //Image
        
        if let data = usersModel.imageData {
            userImage.image = UIImage(data: data)
        } else if let url = usersModel.imageURL {
            
            //fetch
            URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
                guard let data = data, error == nil else {
                    return
                }
                usersModel.imageData = data
                DispatchQueue.main.async {
                    self?.userImage.image = UIImage(data: data)
                }
            }.resume()
        }
    }
    
}
