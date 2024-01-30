//
//  DiaryView.swift
//  ImageDiary
//
//  Created by 芥川浩平 on 2024/01/29.
//

import SwiftUI
import PhotosUI

protocol DiaryDelegate {
    func transition(diary: Diary)
}

final class DiaryDidTap {
    var delegate: DiaryDelegate?
    func didTapDiary(diary: Diary) {
        guard let delegate = delegate else {
            return
        }
        delegate.transition(diary: diary)
    }
}

struct DiaryView: View {
    @State private var selectedItem: PhotosPickerItem?
    @State private var selectedImage: [UIImage] = []
    @State private var diaries: [Diary] = []
    var diaryDidTap = DiaryDidTap()

    var body: some View {
        ScrollView() {
            VStack {
                ForEach(diaries, id: \.id) { diary in
                    Button {
                        diaryDidTap.didTapDiary(diary: diary)
                    } label: {
                        VStack {
                            Image(diary.image)
                                .resizable()
                                .scaledToFit()
                                .frame(maxWidth: 500, maxHeight: 500)
                            Text(diary.title)
                            Text(diary.date)
                        }
                    }
                }
                Spacer()
                PhotosPicker("写真を選ぶ", selection: $selectedItem)
                    .onChange(of: selectedItem) { _, item in
                        Task {
                            guard let data = try? await item?.loadTransferable(type: Data.self) else { return }
                            guard let uiImage = UIImage(data: data) else { return }
                            diaries.image.append(uiImage)
                        }
                    }
            }
        }
    }
}

#Preview {
    DiaryView()
}
