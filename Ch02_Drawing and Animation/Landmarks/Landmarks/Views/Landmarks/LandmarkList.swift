//
//  LandmarkList.swift
//  Landmarks
//
//  Created by KyungHeon Lee on 2023/02/14.
//

import SwiftUI
import Combine

struct LandmarkList: View {
    // @EnvironmentObject 속성 선언을 추가
    @EnvironmentObject var modelData: ModelData
    @State private var showFavoritesOnly = false

    var filteredLandmarks: [Landmark] {
        // ModelData Object
        modelData.landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)
        }
    }

    var body: some View {
        NavigationView {
            List {
                // 도글 스위치
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites only")
                }
                // 각 랜드마크
                ForEach(filteredLandmarks) { landmark in
                    NavigationLink {
                        LandmarkDetail(landmark: landmark)
                    } label: {
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
            .navigationTitle("Landmarks")
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
            .environmentObject(ModelData())
        // environmentObject(_:) 수정자를 추가
    }
}
