//
//  DiaryViewController.swift
//  ImageDiary
//
//  Created by 芥川浩平 on 2024/01/29.
//

import UIKit
import SwiftUI

final class DiaryViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        let diaryViewController = UIHostingController(rootView: DiaryView())
        addChild(diaryViewController)
        view.addSubview(diaryViewController.view)
        diaryViewController.didMove(toParent: self)

        diaryViewController.view.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            diaryViewController.view.widthAnchor.constraint(equalTo: view.widthAnchor),
            diaryViewController.view.heightAnchor.constraint(equalTo: view.heightAnchor),
            diaryViewController.view.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            diaryViewController.view.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])

    }
}
