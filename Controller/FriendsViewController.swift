//
//  FriendsViewController.swift
//  VKClient
//
//  Created by Alexander Belyaev on 17.10.2020.
//

import UIKit

class FriendsViewController: UITableViewController {
    
    let users: [User] = User.randomMany

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Segues
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard
            let controller = segue.destination as? PhotosViewController,
            let indexPath = tableView.indexPathForSelectedRow
            else { return }
        
        let user = users[indexPath.row]
        controller.photos = user.photos
        controller.title = user.name
    }
    
    // MARK: - Table View
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendCell", for: indexPath)
        
        let user = users[indexPath.row]
        cell.textLabel?.text = user.name
        cell.imageView?.image = UIImage(named: "Avatars/\(user.avatar)")
        
        return cell
    }
}
