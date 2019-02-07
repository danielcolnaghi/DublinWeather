//
//  ForecastCell.swift
//  DublinWeather
//
//  Created by Daniel Colnaghi on 07/02/2019.
//  Copyright © 2019 Daniel Colnaghi. All rights reserved.
//

import UIKit

class ForecastCell: UITableViewCell {

    var model: Forecast! {
        didSet {
            DispatchQueue.main.async {
                self.updateUI()
            }
        }
    }
    
    @IBOutlet weak var lblTemp: UILabel!
    @IBOutlet weak var lblHour: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var lblHumidity: UILabel!
    @IBOutlet weak var lblMinMax: UILabel!
    @IBOutlet weak var imgWeather: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    private func updateUI() {
        lblTemp.text = "\(Int(model.mainForecast.temp))º"
        lblHour.text = "\(model.dateText)"
        lblDescription.text = "\(model.weather.first?.mainDescription ?? "")"
        lblHumidity.text = "Humidity   \(model.mainForecast.humidity)%"
        lblMinMax.text = "Min/Max   \(Int(model.mainForecast.tempMin))º   \(Int(model.mainForecast.tempMax))º"
        imgWeather.image = UIImage(named:model.weather.first?.icon ?? "")
    }
}
