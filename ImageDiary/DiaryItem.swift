//
//  DiaryItem.swift
//  ImageDiary
//
//  Created by 芥川浩平 on 2024/01/29.
//

import SwiftUI

final class Diary: Identifiable {
    var image: UIImage?
    var date: Date?
    var title: String? = ""
    var description: String? = ""
}
