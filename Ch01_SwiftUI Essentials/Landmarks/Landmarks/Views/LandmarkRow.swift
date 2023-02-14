//
//  LandmarkRow.swift
//  Landmarks
//
//  Created by KyungHeon Lee on 2023/02/13.
//

import SwiftUI

struct LandmarkRow: View {
    var landmark: Landmark // 받아온
    
    var body: some View {
        HStack { // 수평으로
            landmark.image
                .resizable() // 사이즈
                .frame(width: 50, height: 50)
            Text(landmark.name)
            
            Spacer() // leading 끝에 가기위해
        }
    }
}

struct LandmarkRow_Previews: PreviewProvider {
    static var previews: some View {
        // 프리뷰 활용
        Group { // 그룹으로 묶음
            LandmarkRow(landmark: landmarks[0])
                .previewLayout(.fixed(width: 300, height: 70))
            LandmarkRow(landmark: landmarks[1])
                .previewLayout(.fixed(width: 300, height: 70))
        }
    }
}
