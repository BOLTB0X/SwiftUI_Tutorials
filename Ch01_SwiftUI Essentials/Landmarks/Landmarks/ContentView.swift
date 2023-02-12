//
//  ContentView.swift
//  Landmarks
//
//  Created by KyungHeon Lee on 2023/02/11.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack { //스택 뷰로 수직으로 쌓임
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
        }
        .padding() // 간격
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
