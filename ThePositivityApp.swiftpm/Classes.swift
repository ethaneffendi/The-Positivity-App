import SwiftUI

class AppStatus: ObservableObject{
    @Published var finishLaunch: Bool
    init(finishLaunch: Bool) {
        self.finishLaunch = finishLaunch
    }
}

class MovePagesI: ObservableObject{
    @Published var moveOn = false
    @Published var status = false
    init(moveOn: Bool, status: Bool){
        self.moveOn = moveOn
        self.status = status
    }
}

