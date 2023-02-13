//
//  ContentView.swift
//  Landmarks
//
//  Created by KyungHeon Lee on 2023/02/11.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack { // Vstack으로 감싸줌
            // 맵뷰 추가
            MapView()
                .frame(height: 300) // framedmf 통해 높이 조정
            
            // 아까만든 원이미지
            CircleImage()
            // 스택들이 자동 비율 계산으로의 위치보단 원하는 위치로 옮기고 싣다면
                .offset(y: -130)
                .padding(.bottom, -130)

            // 하단 text뷰들
            VStack(alignment: .leading) { //스택 뷰로 수직으로 쌓임 정렬 기준을 왼쪽으로
                Text("Turtle Rock")
                    .font(.title) // 제목
                
                HStack { // 수평으로 쌓임
                    Text("Joshua Tree Nation")
                        .font(.subheadline)
                    
                    Spacer() // 공백처리
                    // 기존 쌓인 인스턴스들의 간격을 자동으로 계산해줌
                    
                    Text("California")
                        .font(.subheadline)
                }
                Divider() // 구분선 추가

                Text("About Turtle Rock")
                    .font(.title2)
                Text("Descriptive text goes here.")
            }
            .padding() // 간격
            
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
