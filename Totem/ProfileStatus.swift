//
//  ProfileStatus.swift
//  Totem
//
//  Created by Juliana Cipa on 30/06/2017.
//  Copyright © 2017 Juliana Cipa. All rights reserved.
//

import Foundation
import UIKit

class ProfileStatus: NSObject {

    let possibleStatus = ["stop",
                          "pause",
                          "conceptual deep work",
                          "tangible deep work",
                          "getting shit done",
                          "inspiration mode"]

    var statusCode: Int

    required init(withStatusCode statusCode: Int) {
        self.statusCode = statusCode
    }

    func statusImage() -> UIImage {
        return UIImage(named: "status\(statusCode).png")!
    }

    func statusText() -> String {
        return possibleStatus[statusCode]
    }
}
