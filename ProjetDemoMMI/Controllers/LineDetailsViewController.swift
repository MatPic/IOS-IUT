//
//  LineDetailsViewController.swift
//  ProjetDemoMMI
//
//  Created by Mateo Piccarreta on 04/03/2020.
//  Copyright © 2020 Julie Saby. All rights reserved.
//

import UIKit

class LineDetailsViewController: UIViewController {

    @IBOutlet weak var lineNameLabel: UILabel!
    @IBOutlet weak var busIcon: UIImageView!
    @IBOutlet weak var header: UIView!
    @IBOutlet weak var directionIcon: UIImageView!
    @IBOutlet weak var directionNameLabel: UILabel!
    
    var lineTime: LineTime?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title =  "Line Details"
        
        setData(pattern: lineTime!.pattern)
        // Do any additional setup after loading the view.
    }
    
    public func setLabelsColor(color: UIColor) {
        lineNameLabel.textColor = color
        busIcon.image = busIcon.image?.withRenderingMode(.alwaysTemplate)
        busIcon.tintColor = color
        busIcon.alpha = CGFloat(0.4)
        directionIcon.tintColor = color
        directionNameLabel.textColor = color
    }
    
    public func setData(pattern: Pattern) {
        busIcon.image = UIImage(named: "\(pattern.mode!.lowercased()).png")
        setLabelsColor(color: (pattern.uiTextColor) ?? .white)
        header.backgroundColor = pattern.uiColor
        lineNameLabel.text = pattern.name
        directionNameLabel.text = pattern.lastStopName?.lowercased().capitalized
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
