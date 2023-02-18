//
//  ContentView.swift
//  Landmarks
//
//  Created by KyungHeon Lee on 2023/02/11.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        LandmarkList() // 간결하게
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
