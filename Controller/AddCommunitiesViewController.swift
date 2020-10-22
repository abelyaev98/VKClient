//
//  AddCommunitiesViewController.swift
//  VKClient
//
//  Created by Alexander Belyaev on 17.10.2020.
//

import UIKit

class AddCommunitiesViewController: UITableViewController {

    let communities: [Community] = Community.randomMany

    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return communities.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CommunityCell", for: indexPath)
        
        let community = communities[indexPath.row]
        cell.textLabel?.text = community.name
        cell.imageView?.image = UIImage(named: "Avatars/\(community.avatar)")
        cell.imageView!.layer.cornerRadius = 21.835
        
        return cell
    }
}
