//
//  ViewController.swift
//  Totem
//
//  Created by Juliana Cipa on 30/06/2017.
//  Copyright © 2017 Juliana Cipa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var profileImageView: UIImageView!

    @IBOutlet weak var myCurrentMoodImageView: UIImageView!
    @IBOutlet weak var myCurrentMoodLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        setupMyProfile()
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
        setupMyMood(withProfileStatus: ProfileStatus(rawValue: "HAPPY")!)
    }

    private func setupMyMood(withProfileStatus profileStatus: ProfileStatus) {
        myCurrentMoodImageView.image = profileStatus.statusImage()
        myCurrentMoodLabel.text = profileStatus.rawValue
    }
}

