import SwiftUI
import Foundation



struct LaunchScreen: View{
    @EnvironmentObject var appStatus: AppStatus
    func setFalse(){
        appStatus.finishLaunch = true
    }
    var body: some View {
        VStack{
            let height: CGFloat = UIScreen.main.bounds.height*20
            Image("LaunchTitlePNG").background(Color.init("Mustard").ignoresSafeArea().frame(minWidth: height, minHeight: height))
        }.onAppear(perform:{
            Timer.scheduledTimer(withTimeInterval: 1.5, repeats: false){timer in
                setFalse()
            }
        })
        

    }
}

