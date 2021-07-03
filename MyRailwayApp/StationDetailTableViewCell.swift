//
//  StationDetailTableViewCell.swift
//  MyRailwayApp
//
//  Created by 粘辰晧 on 2021/5/4.
//

import UIKit

class StationDetailTableViewCell: UITableViewCell {
    
    @IBOutlet weak var trainType_N: UILabel!
    @IBOutlet weak var endStation_N: UILabel!
    @IBOutlet weak var delay_N: UILabel!
    
    @IBOutlet weak var trainType_S: UILabel!
    @IBOutlet weak var endStation_S: UILabel!
    @IBOutlet weak var delay_S: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
