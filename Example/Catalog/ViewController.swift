//
//  ViewController.swift
//  Catalog
//
//  Created by wenzhaot on 30/06/2017.
//  Copyright © 2017 yueke. All rights reserved.
//

import UIKit
import RxSwift
import AstraeaSwift

class ViewController: UITableViewController {

    @IBOutlet weak var numLabel: UILabel!
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            let anchorsVc = AnchorsViewController()
            navigationController?.pushViewController(anchorsVc, animated: true)
        case 1:
            let momentsVc = MomentsViewController()
            navigationController?.pushViewController(momentsVc, animated: true)
        case 2:
            numLabel.text = "正在获取..."
            AppConfig.fetchUserCount(completion: { (count, error) in
                if let er = error {
                    self.numLabel.text = er.userInfo[NSLocalizedDescriptionKey] as? String
                } else {
                    self.numLabel.text = "\(count)"
                }
            })
        default:
            break
        }
        
        AppConfig.fetchMoments(pageSize: 1) { (moments, error) in
            
        }
    }

    @IBAction func nightModeSwitchValueChanged(_ sender: UISwitch) {
        AppConfig.setNightMode(isNight: sender.isOn)
    }

}

