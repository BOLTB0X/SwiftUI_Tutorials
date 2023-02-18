//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by KyungHeon Lee on 2023/02/11.
//

import SwiftUI

@main
struct LandmarksApp: App {
    // update
    // @StateObject 속성은 앱의 수명 동안 한 번만 지정된 속성에 대한 모델 객체를 초기화
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
