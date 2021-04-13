//
//  HearderViewModel.swift
//  UI-160
//
//  Created by にゃんにゃん丸 on 2021/04/12.
//

import SwiftUI

class HearderViewModel: ObservableObject {
    @Published var startMinY : CGFloat = 0
    @Published var offset : CGFloat = 0
    
    @Published var topScrolloffset : CGFloat = 0
    @Published var hederOffset : CGFloat = 0
    @Published var bottomScrolloffset : CGFloat = 0
}

