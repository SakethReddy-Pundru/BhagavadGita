//
//  ChaptersTableViewCell.swift
//  BhagavadGita
//
//  Created by Saketh Reddy on 27/08/24.
//

import UIKit

class ChaptersTableViewCell: UITableViewCell {

    @IBOutlet weak var imageViewIcon: UIImageView!
    @IBOutlet weak var lblChapterName: UILabel!
    @IBOutlet weak var lblVersesCount: UILabel!
    @IBOutlet weak var bgView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
