//
//  PageViewController.swift
//  Landmarks
//
//  Created by KyungHeon Lee on 2023/02/19.
//  Copyright © 2023 Apple. All rights reserved.
//

import SwiftUI
import UIKit

struct PageViewController<Page: View>: UIViewControllerRepresentable {
    var pages: [Page] // 페이지 뷰 컨트롤러는 View 유형이어야 하는 Page 인스턴스의 배열을 저장 -> 랜드마크 사이를 스크롤하는 데 사용하는 페이지
    
    // 원하는 구성으로 UIPageViewController를 생성하는 makeUIViewController(context:) 메서드를 추가
    func makeUIViewController(context: Context) -> UIPageViewController {
        let pageViewController = UIPageViewController(
            transitionStyle: .scroll,
            navigationOrientation: .horizontal)
        // SwiftUI는 뷰를 표시할 준비가 되었을 때 이 메서드를 한 번 호출한 다음 뷰 컨트롤러의 수명 주기를 관리
        return pageViewController
    }
    
    // 표시할 보기 컨트롤러를 제공하기 위해 setViewControllers(_:direction:animated:)를 호출하는 updateUIViewController(_:context:) 메서드를 추가
    func updateUIViewController(_ pageViewController: UIPageViewController, context: Context) {
        // 지금은 모든 업데이트에서 페이지 SwiftUI 보기를 호스팅하는 UIHostingController를 생성, 후에 페이지 보기 컨트롤러의 수명 동안 컨트롤러를 한 번만 초기화하여 이를 보다 효율적으로 만들 것
        pageViewController.setViewControllers(
            [UIHostingController(rootView: pages[0])], direction: .forward, animated: true)
    }

}
