//
//  Landmark.swift
//  Landmarks
//
//  Created by KyungHeon Lee on 2023/02/13.
//

import Foundation
import SwiftUI
import CoreLocation

struct Landmark: Hashable, Codable {
    // json 추가 후
    var id: Int
    var name: String
    var park: String
    var state: String
    var description: String
    
    // Landmarks 구조의 사용자는 오로직 이미지만 보므로
    // private
    private var imageName: String
    var image: Image {
        Image(imageName)
    }
    
    private var coordinates: Coordinates
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude)
    }
    
    struct Coordinates: Hashable, Codable {
        var latitude: Double
        var longitude: Double
    }
}
