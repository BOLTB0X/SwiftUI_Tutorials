//
//  ProfileSummary.swift
//  Landmarks
//
//  Created by KyungHeon Lee on 2023/02/19.
//

import SwiftUI

struct ProfileSummary: View {
    // Animating Views and Transitions.
    @EnvironmentObject var modelData: ModelData
    var profile: Profile
    // 상위 뷰인 ProfileHost가 이 뷰의 상태를 관리하기 때문에 프로필 요약은 프로필에 대한 바인딩이 아닌 프로필 값을 사
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                Text(profile.username)
                    .bold()
                    .font(.title)

                Text("Notifications: \(profile.prefersNotifications ? "On": "Off" )")
                Text("Seasonal Photos: \(profile.seasonalPhoto.rawValue)")
                Text("Goal Date: ") + Text(profile.goalDate, style: .date)
            }
            

            Divider()
            
            // Animating Views and Transitions에서 HikeView를 포함하여 프로필 요약을 마무
            VStack(alignment: .leading) {
                Text("Completed Badges")
                    .font(.headline)

                ScrollView(.horizontal) {
                    HStack {
                        HikeBadge(name: "First Hike")
                        HikeBadge(name: "Earth Day")
                            .hueRotation(Angle(degrees: 90))
                        HikeBadge(name: "Tenth Hike")
                            .grayscale(0.5)
                            .hueRotation(Angle(degrees: 45))
                    }
                    .padding(.bottom)
                }
            }
            
            Divider()

            VStack(alignment: .leading) {
                Text("Recent Hikes")
                    .font(.headline)

                HikeView(hike: modelData.hikes[0])
            }
        }
    }
}

struct ProfileSummary_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSummary(profile: Profile.default)
            .environmentObject(ModelData())
    }
}
