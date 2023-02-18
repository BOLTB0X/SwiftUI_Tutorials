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
}

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
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
