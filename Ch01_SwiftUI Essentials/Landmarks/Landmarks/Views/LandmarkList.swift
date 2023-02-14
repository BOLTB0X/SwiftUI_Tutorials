//
//  LandmarkList.swift
//  Landmarks
//
//  Created by KyungHeon Lee on 2023/02/14.
//

import SwiftUI

struct LandmarkList: View {
    var body: some View {
        // List 스크롤이나 Row 스택처럼 쓰기 가능
        List(landmarks, id: \.id) { landmark in
            LandmarkRow(landmark: landmark)
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
    }
}
