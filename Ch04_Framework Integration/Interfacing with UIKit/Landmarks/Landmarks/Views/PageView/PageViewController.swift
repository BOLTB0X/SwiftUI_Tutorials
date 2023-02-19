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
    @Binding var currentPage: Int // @Binding 속성에서 setViewControllers(_:direction:animated:) 호출을 업데이트하여 currentPage 바인딩 값을 전달
    
    // SwiftUI는 makeUIViewController(context:) 전에 이 makeCoordinator() 메서드를 호출하므로 뷰 컨트롤러를 구성할 때 coordinator 개체에 액세스할 수 있음
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    // 원하는 구성으로 UIPageViewController를 생성하는 makeUIViewController(context:) 메서드를 추가
    func makeUIViewController(context: Context) -> UIPageViewController {
        let pageViewController = UIPageViewController(
            transitionStyle: .scroll,
            navigationOrientation: .horizontal)
        pageViewController.dataSource = context.coordinator
        pageViewController.delegate = context.coordinator
        // SwiftUI는 뷰를 표시할 준비가 되었을 때 이 메서드를 한 번 호출한 다음 뷰 컨트롤러의 수명 주기를 관리
        return pageViewController
    }
    
    // 표시할 보기 컨트롤러를 제공하기 위해 setViewControllers(_:direction:animated:)를 호출하는 updateUIViewController(_:context:) 메서드를 추가
    func updateUIViewController(_ pageViewController: UIPageViewController, context: Context) {
        // 지금은 모든 업데이트에서 페이지 SwiftUI 보기를 호스팅하는 UIHostingController를 생성, 후에 페이지 보기 컨트롤러의 수명 동안 컨트롤러를 한 번만 초기화하여 이를 보다 효율적으로 만들 것
        pageViewController.setViewControllers(
            // 코디네이터는 이러한 컨트롤러를 저장, 시스템은 컨트롤러를 한 번만 초기화하고 보기 컨트롤러를 업데이트하기 전에 필요하기 전에 초기화하기 때문
            // PageView에서 @State 변수를 선언하고 자식 PageViewController를 생성할 때 속성에 대한 바인딩을 전달
            [context.coordinator.controllers[currentPage]], direction: .forward, animated: true)
    }
    
    // UIViewControllerRepresentable 유형의 코디네이터를 관리하고 위에서 만든 메서드를 호출할 때 컨텍스트의 일부로 제공
    class Coordinator: NSObject, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
        var parent: PageViewController
        var controllers = [UIViewController]()
        
        init(_ pageViewController: PageViewController) {
            parent = pageViewController
            controllers = parent.pages.map { UIHostingController(rootView: $0) }
        }
        
        func pageViewController(
            _ pageViewController: UIPageViewController,
            viewControllerBefore viewController: UIViewController) -> UIViewController?
        {
            guard let index = controllers.firstIndex(of: viewController) else {
                return nil
            }
            if index == 0 {
                return controllers.last
            }
            return controllers[index - 1]
        }
        
        func pageViewController(
            _ pageViewController: UIPageViewController,
            viewControllerAfter viewController: UIViewController) -> UIViewController?
        {
            guard let index = controllers.firstIndex(of: viewController) else {
                return nil
            }
            if index + 1 == controllers.count {
                return controllers.first
            }
            return controllers[index + 1]
        }
        
        // PageViewController.swift에서 코디네이터를 UIPageViewControllerDelegate에 따르고 pageViewController(_:didFinishAnimating:previousViewControllers:transitionCompleted completed: Bool) 메서드를 추가
        // 페이지 전환 애니메이션이 완료될 때마다 SwiftUI가 이 메서드를 호출하기 때문에 현재 뷰 컨트롤러의 인덱스를 찾고 바인딩을 업데이트할 수가 있음
        func pageViewController(
            _ pageViewController: UIPageViewController,
            didFinishAnimating finished: Bool,
            previousViewControllers: [UIViewController],
            transitionCompleted completed: Bool) {
            if completed,
               let visibleViewController = pageViewController.viewControllers?.first,
               let index = controllers.firstIndex(of: visibleViewController) {
                parent.currentPage = index
            }
        }
    }
}
