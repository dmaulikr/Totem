//
//  FeedbackViewController.swift
//  Totem
//
//  Created by Juliana Cipa on 30/06/2017.
//  Copyright © 2017 Juliana Cipa. All rights reserved.
//

import Foundation
import UIKit
import Firebase

class FeedbackViewController: UIViewController {

    var databaseRef: DatabaseReference!
    var feedbackModel: FeedbackModel?

    @IBOutlet weak var productivityLabel: UILabel!
    @IBOutlet weak var meaningfulnessLabel: UILabel!

    @IBOutlet weak var startTimeLabel: UILabel!
    @IBOutlet weak var endTimeLabel: UILabel!
    
    @IBOutlet weak var myCurrentMoodImageView: UIImageView!
    @IBOutlet weak var myCurrentMoodLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupFeedbackTime()

        databaseRef = Database.database().reference()

        DispatchQueue.main.async() { [weak self] in
            let feedbackStatus = self?.feedbackModel!.feedbackStatus

            self!.setupMyMood(withStatusCode: feedbackStatus!)
        }
    }

    private func setupFeedbackTime() {
        startTimeLabel.text = feedbackModel?.startTime
        endTimeLabel.text = feedbackModel?.endTime
    }

    private func setupMyMood(withStatusCode statusCode: Int) {
        let profileStatus = ProfileStatus(withStatusCode: statusCode)

        myCurrentMoodImageView.image = profileStatus.statusImage()
        myCurrentMoodLabel.text = profileStatus.statusText()
    }


    @IBAction func productivity1Pressed() {
        productivityLabel.text = "1"
    }

    @IBAction func productivity2Pressed() {
        productivityLabel.text = "2"
    }

    @IBAction func productivity3Pressed() {
        productivityLabel.text = "3"
    }

    @IBAction func productivity4Pressed() {
        productivityLabel.text = "4"
    }

    @IBAction func productivity5Pressed() {
        productivityLabel.text = "5"
    }

    @IBAction func meaningfulness1Pressed() {
        meaningfulnessLabel.text = "1"
    }

    @IBAction func meaningfulness2Pressed() {
        meaningfulnessLabel.text = "2"
    }

    @IBAction func meaningfulness3Pressed() {
        meaningfulnessLabel.text = "3"
    }

    @IBAction func meaningfulness4Pressed() {
        meaningfulnessLabel.text = "4"
    }

    @IBAction func meaningfulness5Pressed() {
        meaningfulnessLabel.text = "5"
    }

    @IBAction func sendData() {
        let feedbackId = feedbackModel!.feedbackId!

        databaseRef.child("user-tasks/0/\(feedbackId)/meaningfulness").setValue(Int(meaningfulnessLabel.text!))
        databaseRef.child("user-tasks/0/\(feedbackId)/productivity").setValue(Int(productivityLabel.text!))

        self.navigationController?.popViewController(animated: true)
    }
}
