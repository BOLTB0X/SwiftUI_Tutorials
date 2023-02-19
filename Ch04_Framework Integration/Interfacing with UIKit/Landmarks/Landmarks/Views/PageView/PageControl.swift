//
//  PageControl.swift
//  Landmarks
//
//  Created by KyungHeon Lee on 2023/02/19.
//  Copyright © 2023 Apple. All rights reserved.
//

import SwiftUI
import UIKit

// UIViewRepresentable 및 UIViewControllerRepresentable 유형은 기본 UIKit 유형에 해당하는 메서드와 함께 동일한 수명 주기를 갖음
struct PageControl: UIViewRepresentable {
    var numberOfPages: Int
    @Binding var currentPage: Int
    
    // makeCoordinator() 메서드를 추가하여 새로운 코디네이터를 생성하고 반환
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    func makeUIView(context: Context) -> UIPageControl {
        let control = UIPageControl()
        control.numberOfPages = numberOfPages
        // updateCurrentPage(sender:) 메서드를 지정하여 valueChanged 이벤트의 대상으로 코디네이터를 추가
        control.addTarget(
            context.coordinator,
            action: #selector(Coordinator.updateCurrentPage(sender:)),
            for: .valueChanged)

        return control
    }

    func updateUIView(_ uiView: UIPageControl, context: Context) {
        uiView.currentPage = currentPage
    }
    
    // UIPageControl과 같은 UIControl 하위 클래스는 위임 대신 대상 작업 패턴을 사용합니다. 이 코디네이터는 @objc 메서드를 구현하여 현재 페이지 바인딩을 업데이트
    class Coordinator: NSObject {
        var control: PageControl

        init(_ control: PageControl) {
            self.control = control
        }

        @objc
        func updateCurrentPage(sender: UIPageControl) {
            control.currentPage = sender.currentPage
        }
    }
}
