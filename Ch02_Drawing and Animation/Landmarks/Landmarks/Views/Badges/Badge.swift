//
//  Badge.swift
//  Landmarks
//
//  Created by KyungHeon Lee on 2023/02/18.
//

import SwiftUI

struct Badge: View {
    // 삼각형 불러줌
    var badgeSymbols: some View {
        // ForEach로 그라데이션 표현
        ForEach(0..<8) { index in
            RotatedBadgeSymbol(
                angle: .degrees(Double(index) / Double(8)) * 360.0
            )
        }
        .opacity(0.5)
    }
    
    var body: some View {
        ZStack {
            BadgeBackground()
            
            // 직접 조작
            GeometryReader { geometry in
                badgeSymbols
                    .scaleEffect(1.0 / 4.0, anchor: .top)
                    .position(x: geometry.size.width / 2.0, y: (3.0 / 4.0) * geometry.size.height)
            }
        }
        .scaledToFit()
    }
}

struct Badge_Previews: PreviewProvider {
    static var previews: some View {
        Badge()
    }
}
