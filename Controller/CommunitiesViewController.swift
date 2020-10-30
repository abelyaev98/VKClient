//
//  CommunitiesViewController.swift
//  VKClient
//
//  Created by Alexander Belyaev on 17.10.2020.
//

import UIKit

class CommunitiesViewController: UITableViewController {
    
    var communities: [Community] = Community.randomMany
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Table View
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return communities.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CommunityCell", for: indexPath) as! CommunityCell
        
        let community = communities[indexPath.row]
        
        cell.communityNameLabel.text = community.name
        cell.avatarView.imageView.image = UIImage(named: "Avatars/\(community.avatar)")
        
//        cell.communityPhotoImage.layer.cornerRadius = cell.communityPhotoImage.frame.width / 2

        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            communities.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    // MARK: - Segues
    
    @IBAction func unwindFromAddCommunities(_ sender: UIStoryboardSegue) {
        guard
            let controller = sender.source as? AddCommunitiesViewController,
            let indexPath = controller.tableView.indexPathForSelectedRow
        else { return }
        
        let community = controller.communities[indexPath.row]
    
        communities.append(community)
        tableView.reloadData()
    }
}
