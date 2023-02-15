//
//  CircleImage.swift
//  Landmarks
//
//  Created by KyungHeon Lee on 2023/02/12.
//

import SwiftUI

// 이미지 사용전 Asset에서 넣어야함
struct CircleImage: View {
    var image: Image // 함수를 변수로 사용
    
    var body: some View {
        // 변수이므로 꾸며줌
        image
            .clipShape(Circle())
            .overlay {
                Circle().stroke(.white, lineWidth: 4)
            }
            .shadow(radius: 7)
//        Image("turtlerock") // 이미지
//            .clipShape(Circle()) // 원형으로~
//            .overlay { // overlay = 안쪽으로 겹차게 한다는 느낌으로
//                Circle().stroke(.white) // 원형 겉으로 초록색 넣어줌
//            }
//            .shadow(radius: 7) // 그림자 넣어줌
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        // 파라미터를 맞춰줌
        CircleImage(image: Image("turtlerock"))
    }
}
