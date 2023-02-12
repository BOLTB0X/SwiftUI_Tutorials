//
//  CircleImage.swift
//  Landmarks
//
//  Created by KyungHeon Lee on 2023/02/12.
//

import SwiftUI

// 이미지 사용전 Asset에서 넣어야함
struct CircleImage: View {
    var body: some View {
        Image("turtlerock") // 이미지
            .clipShape(Circle()) // 원형으로~
            .overlay { // overlay = 안쪽으로 겹차게 한다는 느낌으로
                Circle().stroke(.green) // 원형 겉으로 초록색 넣어줌
            }
            .shadow(radius: 7) // 그림자 넣어줌
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage()
    }
}
