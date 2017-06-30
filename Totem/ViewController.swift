//
//  ViewController.swift
//  Totem
//
//  Created by Juliana Cipa on 30/06/2017.
//  Copyright © 2017 Juliana Cipa. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    @IBOutlet weak var profileImageView: UIImageView!

    @IBOutlet weak var myCurrentMoodImageView: UIImageView!
    @IBOutlet weak var myCurrentMoodLabel: UILabel!

    @IBOutlet weak var unfilledFeedback: UILabel!

    @IBOutlet weak var modeImageView: UIImageView!
    @IBOutlet weak var modeLabel: UILabel!
    
    let possibleStatus = ["stop",
                          "pause",
                          "conceptual deep work",
                          "tangible deep work",
                          "getting shit done",
                          "inspiration mode"]

    var databaseRef: DatabaseReference!
    var modeRefHandle: UInt = 0
    var feedbackRefHandle: UInt = 1

    var statusModeIndex = 0
    var unfilledModes = [FeedbackModel]()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupMyProfile()

        databaseRef = Database.database().reference()

        fetchMyWorkMode()
        fetchUnfilledModes()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let feedbackViewController = segue.destination as? FeedbackViewController {
            feedbackViewController.feedbackModel = self.unfilledModes.last

            let totalUnfilledModes = self.unfilledModes.count - 1

            self.unfilledModes.remove(at: totalUnfilledModes)
            self.unfilledFeedback.text = String(totalUnfilledModes)
        }
    }

    private func setupMyProfile() {
        profileImageView.layer.borderWidth = 1
        profileImageView.layer.masksToBounds = false
        profileImageView.layer.borderColor = UIColor.green.cgColor
        profileImageView.layer.cornerRadius = profileImageView.frame.height/2
        profileImageView.clipsToBounds = true
    }

    private func fetchMyWorkMode() {
        modeRefHandle = databaseRef.child("user-status/0").observe(.childAdded, with: { snapshot in
            print(snapshot)
            if snapshot.exists() {
                guard let modeIndex = snapshot.childSnapshot(forPath: "status").value as? Int else {
                    return
                }

                if self.statusModeIndex != modeIndex {
                    self.statusModeIndex = modeIndex

                    DispatchQueue.main.async() { [weak self] in
                        self!.setupMyMood(withProfileStatus: ProfileStatus(rawValue: self!.possibleStatus[modeIndex])!)
                    }
                }
            }
        })
    }

    private func fetchUnfilledModes() {
        modeRefHandle = databaseRef.child("user-tasks/0").observe(.childAdded, with: { snapshot in
            print(snapshot)
            if snapshot.exists() {

                guard let meaningfulness = snapshot.childSnapshot(forPath: "meaningfulness").value as? Int,
                let productivity = snapshot.childSnapshot(forPath: "productivity").value as? Int else {
                    return
                }

                if meaningfulness == 0 && productivity == 0 {
                    let feedbackModel = FeedbackModel(withDataSnapshot: snapshot)

                    self.unfilledModes.append(feedbackModel)

                    self.unfilledFeedback.text = String(self.unfilledModes.count)
                }
            }
        })
    }

    private func setupMyMood(withProfileStatus profileStatus: ProfileStatus) {
        myCurrentMoodImageView.image = profileStatus.statusImage()
        myCurrentMoodLabel.text = profileStatus.rawValue
    }

}

