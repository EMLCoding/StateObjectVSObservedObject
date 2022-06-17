//
//  VideoVM.swift
//  StateObjectVsObservedObject
//
//  Created by Eduardo Martin Lorenzo on 17/6/22.
//

import SwiftUI

final class VideoVM: ObservableObject {
    @Published var videosModel: [String] = []
        
        init() {
            videosModel = ["Aprende SwiftUI",
                           "Aprende Xcode",
                           "Aprende Swift"]
        }
        
        func addMoreTopics() {
            videosModel.append("Aprende CI/CD")
            videosModel.append("Aprende Git")
            videosModel.append("Aprende sobre Testing")
            videosModel.append("Aprende APIs de Apple")
        }
}
