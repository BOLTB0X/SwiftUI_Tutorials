//
//  ProfileEditor.swift
//  Landmarks
//
//  Created by KyungHeon Lee on 2023/02/19.
//

import SwiftUI

struct ProfileEditor: View {
    @Binding var profile: Profile // 편집 받기위해 바인딩 처리
    
    var dateRange: ClosedRange<Date> {
        let min = Calendar.current.date(byAdding: .year, value: -1, to: profile.goalDate)!
        let max = Calendar.current.date(byAdding: .year, value: 1, to: profile.goalDate)!
        return min...max
    }
    
    var body: some View {
        List {
            HStack {
                Text("Username").bold()
                Divider()
                TextField("Username", text: $profile.username)
            }
            
            // 드마크 관련 이벤트에 대한 알림 수신에 대한 사용자 기본 설정에 해당하는 토글을 추가
            Toggle(isOn: $profile.prefersNotifications) {
                Text("Enable Notifications").bold()
            }
            
            // Picker 컨트롤과 해당 레이블을 VStack에 배치하여 랜드마크 사진에 선택 가능한 선호 시즌을 지정
            VStack(alignment: .leading, spacing: 20) {
                Text("Seasonal Photo").bold()
                
                Picker("Seasonal Photo", selection: $profile.seasonalPhoto) {
                    ForEach(Profile.Season.allCases) { season in
                        Text(season.rawValue).tag(season)
                    }
                }
                .pickerStyle(.segmented)
            }
        }
    }
}

struct ProfileEditor_Previews: PreviewProvider {
    static var previews: some View {
        ProfileEditor(profile: .constant(.default))
    }
}
