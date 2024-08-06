//
//  UsersTableViewController.swift
//  NewsApp
//
//  Created by Lucas Nahuel Guerra on 08/07/2024.
//

import UIKit

class UsersTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    private var users = [Users]()
    private var usersModel = [UsersTableViewModel]()
    
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "UsersTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "UsersTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
        fetchUsers()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let mapsViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MapsViewController") as! MapsViewController
        
        let latitude = Double(users[indexPath.row].location.coordinates?.latitude ?? "")
        let longitude = Double(users[indexPath.row].location.coordinates?.latitude ?? "")
        
        mapsViewController.userLatitude = latitude
        mapsViewController.userLongitude = longitude
        
        mapsViewController.navigationItem.largeTitleDisplayMode = .never
        self.navigationController?.pushViewController(mapsViewController, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier:
                                                        "UsersTableViewCell",
                                                       for: indexPath) as? UsersTableViewCell else {
            fatalError()
        }
        cell.configure(with: usersModel[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    
    private func fetchUsers() {
        ApiCaller.shared.getUsers() { [weak self] result in
            
            switch result {
            case .success(let users):
                self?.users = users
                self?.usersModel = users.compactMap({
                    UsersTableViewModel(
                        name:  "\($0.name.first) \($0.name.last)",
                        phone: $0.phone ?? "No phone added",
                        location: $0.location.street.name,
                        imageURL: URL(string: $0.picture.large ?? ""),
                        latitude: $0.location.coordinates?.latitude ?? "",
                        longitude: $0.location.coordinates?.longitude ?? ""
                    )
                })
                
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
}
