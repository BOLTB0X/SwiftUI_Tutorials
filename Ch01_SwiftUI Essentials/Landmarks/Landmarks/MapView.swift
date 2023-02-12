//
//  MapView.swift
//  Landmarks
//
//  Created by KyungHeon Lee on 2023/02/12.
//

import SwiftUI
import MapKit // 맵 뷰를 만들기 위해 추가해줌

struct MapView: View {
    // 상태 프로퍼티 private로 선언
    // 이래야 실시간으로 뷰에 업데이트가 됨
    @State private var region = MKCoordinateRegion( // Mapkit에서 지원해주는
        // 중앙 위치 설정
           center:  CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868),
           span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
       )
    
    var body: some View {
        // $ -> 바인딩
        Map(coordinateRegion: $region)
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
