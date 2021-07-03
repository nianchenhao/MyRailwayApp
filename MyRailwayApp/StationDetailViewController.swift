//
//  StationDetailViewController.swift
//  MyRailwayApp
//
//  Created by 粘辰晧 on 2021/5/4.
//

import UIKit

class StationDetailViewController: UIViewController {

    var station: Station?
    var stationID = ""
    var stationName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let station = station {
            stationName = station.StationName.Zh_tw
            stationID = station.StationID
            navigationItem.title = stationName + "車站"
        }

    }
    
    @IBAction func reloadData(_ sender: UIBarButtonItem) {
        let reloadNorth = NorthTrainViewController()
        let reloadSouth = SouthTrainViewController()
        reloadNorth.stationID = stationID
        reloadSouth.stationID = stationID
    }
    
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // 取消cell的選取狀態
        tableView.deselectRow(at: indexPath, animated: true)
    }
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let north = segue.destination as? NorthTrainViewController, let stationData = station {
            north.station = stationData
        }
        if let south = segue.destination as? SouthTrainViewController, let stationData = station {
            south.station = stationData
        }
    }
    
    func showAlert(title: String) {
        let alert = UIAlertController(title: title, message: "請稍後再試！", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }

}
