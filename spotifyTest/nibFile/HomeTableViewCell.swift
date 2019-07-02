//
//  HomeTableViewCell.swift
//  spotifyTest
//
//  Created by macbook on 4/10/1398 AP.
//  Copyright © 1398 Yahya. All rights reserved.
//

import UIKit
import Kingfisher
class HomeTableViewCell: UITableViewCell {
    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    var result :SearchResult.Result? {
        didSet{
            self.nameLabel.text = result?.name
            if result?.type == SearchType.artist.rawValue {
                 self.coverImageView.setImageWithKingFisher(url: result?.images?.first?.url)
            }else{
                self.coverImageView.setImageWithKingFisher(url: result?.album?.images?.first?.url)
            }
           
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
