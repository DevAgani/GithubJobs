//
//  GithubJobTableViewCell.swift
//  GithubJobs
//
//  Created by George Nyakundi on 23/03/2021.
//

import UIKit

class GithubJobTableViewCell: UITableViewCell {
    
    static let cellIdentifier = String(describing: GithubJobTableViewCell.self)
    
//    var jobOpening = GithubJob?
    @IBOutlet weak var companyLogo: UIImageView!
    @IBOutlet weak var openingName: UILabel!
    @IBOutlet weak var companyName: UILabel!
    @IBOutlet weak var timeSinceLastPostingLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(usingModel model:GithubJob) {
        self.companyName.text = model.company
        self.openingName.text = model.title
        self.companyLogo.image = UIImage(systemName: "folder.fill")
        self.timeSinceLastPostingLabel.text = model.created_at
    }
    
    

    
}
