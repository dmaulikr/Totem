//
//  FeedbackModel.swift
//  Totem
//
//  Created by Juliana Cipa on 30/06/2017.
//  Copyright © 2017 Juliana Cipa. All rights reserved.
//

import Foundation
import Firebase

//duration = 2;
//endTime = "12:00";
//meaningfulness = 0;
//productivity = 0;
//startTime = "10:00";
//status = 0;

class FeedbackModel: NSObject {
    var startTime: String!
    var endTime: String!

    init(withDataSnapshot dataSnapshot: DataSnapshot) {
        self.startTime = dataSnapshot.childSnapshot(forPath: "startTime").value as! String
        self.endTime = dataSnapshot.childSnapshot(forPath: "endTime").value as! String
    }
}
