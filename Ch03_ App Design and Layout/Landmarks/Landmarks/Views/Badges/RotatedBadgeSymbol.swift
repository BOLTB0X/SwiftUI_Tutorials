//
//  RotatedBadgeSymbol.swift
//  Landmarks
//
//  Created by KyungHeon Lee on 2023/02/18.
//

import SwiftUI
// 회전된 기호의 개념 -> RotatedBadgeSymbol
struct RotatedBadgeSymbol: View {
    let angle: Angle
    
    var body: some View {
        BadgeSymbol()
            .padding(-60)
            .rotationEffect(angle, anchor: .bottom)
    }
}

struct RotatedBadgeSymbol_Previews: PreviewProvider {
    static var previews: some View {
        RotatedBadgeSymbol(angle: Angle(degrees: 5))
        
    }
}
