//
//  ProfileHost.swift
//  Landmarks
//
//  Created by KyungHeon Lee on 2023/02/19.
//

import SwiftUI

struct ProfileHost: View {
    // @Environment 속성 래퍼. editMode 값에 액세스하여 편집 범위를 읽거나 씀
    @Environment(\.editMode) var editMode
    // ProfileHost 보기는 프로필 정보의 정적 요약 보기와 편집 모드를 모두 호스팅
    // 편집 내용을 확인하기 전에(예: 사용자가 이름을 입력하는 동안) 전역 앱 상태 업데이트를 방지하기 위해 편집 보기는 자신의 복사본에서 작동
    @EnvironmentObject var modelData: ModelData
    @State private var draftProfile = Profile.default

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            ProfileSummary(profile: draftProfile)
            HStack {
                Spacer()
                EditButton()
            }
            if editMode?.wrappedValue == .inactive {
                ProfileSummary(profile: modelData.profile)
            } else {
                ProfileEditor(profile: $draftProfile) // 변경
            }
        }
        .padding()
    }
}

struct ProfileHost_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHost()
            .environmentObject(ModelData())
    }
}
