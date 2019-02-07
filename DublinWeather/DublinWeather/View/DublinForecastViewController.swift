//
//  DublinForecastViewController.swift
//  DublinWeather
//
//  Created by Daniel Colnaghi on 07/02/2019.
//  Copyright © 2019 Daniel Colnaghi. All rights reserved.
//

import UIKit

class DublinForecastViewController: UIViewController {

    var dublinForecastVM = DublinForecastViewModel()
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dublinForecastVM.loadDublinForecast({
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }) { (errorMessage) in
            let alert = AlertHandler.alertError(message: errorMessage)
            self.present(alert, animated: true, completion: nil)
        }
    }
}

extension DublinForecastViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dublinForecastVM.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "forecastCell") as? ForecastCell else {
            return UITableViewCell()
        }
        
        cell.model = dublinForecastVM.forecast(atIndex: indexPath.row)
        return cell
    }
}
