//
//  WeatherInfoCell.swift
//  OpenWeather
//
//  Created by Kishor Pahalwani on 21/09/19.
//  Copyright © 2019 Kishor Pahalwani. All rights reserved.
//

import UIKit

class WeatherInfoCell: UITableViewCell {

    @IBOutlet weak var labelDescription: UILabel!
    @IBOutlet weak var labelTemp: UILabel!
    @IBOutlet weak var labelHumidity: UILabel!
    @IBOutlet weak var labelSeaLevel: UILabel!
    @IBOutlet weak var labelCity: UILabel!
    @IBOutlet weak var labelWindSpeed: UILabel!
    @IBOutlet weak var labelPressure: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
