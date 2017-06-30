//
//  ProfileStatus.swift
//  Totem
//
//  Created by Juliana Cipa on 30/06/2017.
//  Copyright © 2017 Juliana Cipa. All rights reserved.
//

import Foundation
import UIKit

enum ProfileStatus: String {

    case status1 = "Conceptual Deep Work"
    case status2 = "Work Through Others"
    case status3 = "Tangible Deep Work"
    case status4 = "Getting Stuff Done"
    case status5 = "PAUSE"
    case status6 = "START"

    func statusImage() -> UIImage {

        switch self {
        case .status1:
            return UIImage(named: "status1.png")!
        case .status2:
            return UIImage(named: "status2.png")!
        case .status3:
            return UIImage(named: "status3.png")!
        case .status4:
            return UIImage(named: "status4.png")!
        case .status5:
            return UIImage(named: "status5.png")!
        case .status6:
            return UIImage(named: "status6.png")!
        default:
            return UIImage(named: "status1.png")!
        }
    }

    static func randomStatusImage() -> ProfileStatus {

        let possibleStatus = ["Conceptual Deep Work", "Work Through Others", "Tangible Deep Work", "Getting Stuff Done", "PAUSE", "START"]
        let randomIndex = Int(arc4random_uniform(UInt32(possibleStatus.count)))
        let statusValue = possibleStatus[randomIndex]

        let status = ProfileStatus(rawValue: statusValue)
        
        return status!
    }
}
