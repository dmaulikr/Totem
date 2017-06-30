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

    case status1 = "pause"
    case status2 = "stop"
    case status3 = "conceptual deep work"
    case status4 = "tangible deep work"
    case status5 = "getting shit done"
    case status6 = "inspiration mode"

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

        let possibleStatus = ["pause",
                              "stop",
                              "conceptual deep work",
                              "tangible deep work",
                              "getting shit done",
                              "inspiration mode"]
        let randomIndex = Int(arc4random_uniform(UInt32(possibleStatus.count)))
        let statusValue = possibleStatus[randomIndex]

        let status = ProfileStatus(rawValue: statusValue)
        
        return status!
    }
}
