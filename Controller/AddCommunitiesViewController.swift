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
        let cell = tableView.dequeueReusableCell(withIdentifier: "AddCommunityCell", for: indexPath) as! AddCommunityCell
        
        let community = communities[indexPath.row]
        
        cell.communityNameLabel.text = community.name
        cell.avatarView.imageView.image = UIImage(named: "Avatars/\(community.avatar)")
        
//        cell.communityPhotoImage.layer.cornerRadius = cell.communityPhotoImage.frame.width / 2
        
        
        return cell
    }
}
