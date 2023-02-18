//
//  LandmarkDetail.swift
//  Landmarks
//
//  Created by KyungHeon Lee on 2023/02/14.
//

import SwiftUI

struct LandmarkDetail: View {
    var landmark: Landmark
    
    var body: some View {
        ScrollView { // 변경
//        VStack { // Vstack으로 감싸줌
            // 맵뷰 추가
            // 수정
            MapView(coordinate: landmark.locationCoordinate)                .frame(height: 300) // framedmf 통해 높이 조정
            
            // 아까만든 원이미지
            CircleImage(image: landmark.image)

            // 스택들이 자동 비율 계산으로의 위치보단 원하는 위치로 옮기고 싣다면
                .offset(y: -130)
                .padding(.bottom, -130)
            
            // 하단 text뷰들
            VStack(alignment: .leading) { //스택 뷰로 수직으로 쌓임 정렬 기준을 왼쪽으로
                Text(landmark.name) // 수정
                    .font(.title) // 제목
                
                HStack { // 수평으로 쌓임
                    Text(landmark.park)
                    Spacer()
                    Text(landmark.state)
//                    Text("Joshua Tree Nation")
//                        .font(.subheadline)
//
//                    Spacer() // 공백처리
//                    // 기존 쌓인 인스턴스들의 간격을 자동으로 계산해줌
//
//                    Text("California")
//                        .font(.subheadline)
                }
                .font(.subheadline)
                .foregroundColor(.secondary)
                
                Divider() // 구분선 추가
                
                Text("About \(landmark.name)")
                    .font(.title2)
                Text(landmark.description)
//                Text("About Turtle Rock")
//                    .font(.title2)
//                Text("Descriptive text goes here.")
            }
            .padding() // 간격
            
//            Spacer()
        }
        .navigationTitle(landmark.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct LandmarkDetail_Previews: PreviewProvider {
    static var previews: some View {
        // Model data로 combine 씌어줌
        LandmarkDetail(landmark: ModelData().landmarks[0])
        //LandmarkDetail(landmark: landmarks[0])
    }
}
