//
//  FavoriteButton.swift
//  Landmarks
//
//  Created by KyungHeon Lee on 2023/02/18.
//

import SwiftUI

struct FavoriteButton: View {
    // 바인딩 변수
    @Binding var isSet: Bool
    
    var body: some View {
        // 북마크 같은 것
        // 버튼 추가
        Button {
            isSet.toggle()
        } label: {
            // 이미지가 변수에 따라 달라지게
            Label("좋아요", systemImage: isSet ? "star.fill" : "star")
                .foregroundColor(.yellow)
        }
    }
}

struct FavoriteButton_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteButton(isSet: .constant(true))
    }
}
