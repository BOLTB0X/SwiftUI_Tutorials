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
                .resizable()
                .frame(width: 50, height: 50)
            Text(landmark.name)
            
            Spacer()
        }
    }
}

struct LandmarkRow_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkRow(landmark: landmarks[0])
    }
}
