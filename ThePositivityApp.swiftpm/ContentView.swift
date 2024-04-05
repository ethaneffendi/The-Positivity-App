import SwiftUI

//Main
struct ContentView: View{
    @EnvironmentObject var appStatus: AppStatus
    @ObservedObject var movePage1 = MovePagesI(moveOn: false, status: false)
    var body: some View {
        
        if self.movePage1.moveOn == false{
            HowAreYou().environmentObject(movePage1)
        }
        else{
            if self.movePage1.status == false{
                NegativeSet()
                
                }
            if self.movePage1.status == true{
                PositiveSet()
        }
            
        }
    }
    
}

//FirstQuestion
struct HowAreYou: View{
    @EnvironmentObject var movePage1: MovePagesI
    @State var width = UIScreen.main.bounds.width
    var body: some View{
        let height: CGFloat = UIScreen.main.bounds.height*5
        VStack{
            Text("How are you doing?").foregroundColor(Color.init("SageDeep")).frame(alignment: .topLeading).font(.system(.largeTitle, design: .serif))
            Button("I'm doing A-OK!"){
                movePage1.moveOn = true
                movePage1.status = true
            }.buttonStyle(RobinEggButton())
            Button("Life's been giving me lemons."){
                movePage1.moveOn = true
                movePage1.status = false
            }.buttonStyle(RobinEggButton())
            Image("SageImage").resizable().frame(width: width, height: 200)
        }.ignoresSafeArea().frame(width: height, height: height).background(Color.init("Sage"))
        }
    }




