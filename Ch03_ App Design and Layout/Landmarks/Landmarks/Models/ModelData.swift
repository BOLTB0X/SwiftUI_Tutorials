//
//  ModelData.swift
//  Landmarks
//
//  Created by KyungHeon Lee on 2023/02/13.
//

import Foundation
import Combine

// Observable 객체는 sub이 변경 사항을 선택할 수 있도록 데이터 변경 사항을 pub
final class ModelData: ObservableObject {
    @Published var landmarks: [Landmark] = load("landmarkData.json")
    // Resource에 hikeData json파일 추가
    // Object 선언
    var hikes: [Hike] = load("hikeData.json")
    
    // features 추가
    var features: [Landmark] {
        landmarks.filter { $0.isFeatured }
    }
    
    // 카데고리의 편의를 위해 딕셔너리로 추가
    var categories: [String: [Landmark]] {
        Dictionary(
            grouping: landmarks,
            by: { $0.category.rawValue }
        )
    }
}

// load
func load<T: Decodable>(_ filename: String) -> T {
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else { // 에러
            fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
