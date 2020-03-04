//
//  LineTableViewCell.swift
//  ProjetDemoMMI
//
//  Created by Mateo Piccarreta on 03/03/2020.
//  Copyright © 2020 Julie Saby. All rights reserved.
//

import UIKit

class LineTableViewCell: UITableViewCell {

    @IBOutlet weak var lineName: UILabel!
    @IBOutlet var cellView: UIView!
    @IBOutlet weak var directionNameLabel: UILabel!
    @IBOutlet weak var directionIcon: UIImageView!
    @IBOutlet weak var nextDepartureTimeLabel: UILabel!
    @IBOutlet weak var minutesLabel: UILabel!
    @IBOutlet weak var realTimeIcon: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    public func setLabelsColor(color: UIColor) {
        lineName.textColor = color
        directionNameLabel.textColor = color
        directionIcon.tintColor = color
        nextDepartureTimeLabel.textColor = color
        minutesLabel.textColor = color
        realTimeIcon.tintColor = color
    }
    
    public func setData(pattern: Pattern, times: [Time]?) {
        lineName.text = pattern.name
        setLabelsColor(color: (pattern.uiTextColor) ?? .white)
        cellView.backgroundColor = pattern.uiColor
        directionNameLabel.text = pattern.lastStopName?.lowercased().capitalized
        nextDepartureTimeLabel.text = "\(times?[0].minutesBeforeDeparture ?? 0)"
        
        if ((times?[0].realtime) ?? false) {
            nextDepartureTimeLabel.alpha = CGFloat(1)
            realTimeIcon.alpha = CGFloat(1)
        } else {
            nextDepartureTimeLabel.alpha = CGFloat(0.6)
            realTimeIcon.alpha = CGFloat(0)
        }
    }
}
