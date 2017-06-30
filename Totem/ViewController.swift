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

    var databaseRef: DatabaseReference!
    var refHandle: UInt = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        setupMyProfile()

        databaseRef = Database.database().reference()

        fetchMyMood()
    }

    private func setupMyProfile() {
        profileImageView.layer.borderWidth = 1
        profileImageView.layer.masksToBounds = false
        profileImageView.layer.borderColor = UIColor.green.cgColor
        profileImageView.layer.cornerRadius = profileImageView.frame.height/2
        profileImageView.clipsToBounds = true
    }

    private func fetchMyMood() {
        refHandle = databaseRef.child("user-status").observe(.value, with: { snapshot in
            print(snapshot)
            if snapshot.exists() {
                print("*********** working ***********")
            }
        })

        setupMyMood(withProfileStatus: ProfileStatus(rawValue: "Conceptual Deep Work")!)
    }

    private func setupMyMood(withProfileStatus profileStatus: ProfileStatus) {
        myCurrentMoodImageView.image = profileStatus.statusImage()
        myCurrentMoodLabel.text = profileStatus.rawValue
    }

}

