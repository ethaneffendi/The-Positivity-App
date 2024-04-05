import SwiftUI
import Foundation
@main
struct MyApp: App {
    @ObservedObject var appStatus = AppStatus(finishLaunch: false)
    var body: some Scene {
        WindowGroup{
            if appStatus.finishLaunch == true{
                ContentView().environmentObject(appStatus).onAppear{
                    
                }
            }
            else{
                LaunchScreen().environmentObject(appStatus).onAppear{
                }
            }
            
            
        }
        
    }
}
