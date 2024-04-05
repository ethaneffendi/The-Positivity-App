import SwiftUI
import Foundation


class PositiveResponse: ObservableObject{
    @Published var finished = true
    @Published var responseString = ""
    init(finished: Bool, responseString : String){
        self.finished = finished
        self.responseString = responseString
        
    }
}



struct PositiveSet: View{
    @ObservedObject var positiveResponse =  PositiveResponse(finished: false, responseString: "")
    @State var height: CGFloat = UIScreen.main.bounds.height*5
    @ObservedObject var messageBuilder = MessageBuilder(timeToMove: false, messagePiece1: "", messagePiece2: "")
    var body: some View{
        if positiveResponse.finished == false{
            PositiveSetPartOne().environmentObject(positiveResponse)
        }
        else{
            if positiveResponse.responseString == "Career"{
                PositiveCareer()
            }
            if positiveResponse.responseString == "Healing"{
               PositiveSocial()
            }
            if positiveResponse.responseString == "Finance"{
                PositiveFinance()
            }
            if positiveResponse.responseString == "N/A"{
                PositiveOther().environmentObject(messageBuilder)
            }
    }
}


struct PositiveSetPartOne: View{
    @State var height: CGFloat = UIScreen.main.bounds.height*5
    @State var width = UIScreen.main.bounds.width
    @EnvironmentObject var positiveResponse: PositiveResponse
    var body: some View{
        VStack{
            Text("Would you like to share your triumph?").foregroundColor(Color.init("RoseDeep")).font(.system(.largeTitle, design: .serif))
            Button("Career (school/work) success"){
                positiveResponse.finished = true
                positiveResponse.responseString = "Career"
            }.buttonStyle(RoseButton())
            Button("Financial breakthrough"){
                positiveResponse.finished = true
                positiveResponse.responseString = "Finance"
            }.buttonStyle(RoseButton())
            Button("Personal healing, or loved one/friend's healing"){
                positiveResponse.finished = true
                positiveResponse.responseString = "Healing"
            }.buttonStyle(RoseButton())
            Button("Not listed, or would prefer not to disclose."){
                positiveResponse.finished = true
                positiveResponse.responseString = "N/A"
            }.buttonStyle(RoseButton())
            Image("RoseImage").resizable().frame(width: width, height: 250)
        }.ignoresSafeArea().frame(width: height, height: height).background(Color.init("Rose"))
    }
}
}

struct PositiveOther: View{
    @State var height: CGFloat = UIScreen.main.bounds.height*5
    @State var infoPiece = "It's awesome to hear that you are doing well! Whoever you may be, wherever you may be, here's to many more great days ahead, and greater success in the future! If your current and awesome circumstance did not fit any of the categories suggested earlier, feel free to provide feedback at ThePositivityApp@outlook.com. Be thankful, be grateful, and most of all, reach out and support those who may not be in as such a great state as you. Good days are wonderful, but wouldn't they be greater if it wasn't only ourselves that we made content, but many others also?"
    var body: some View{
        VStack{
            Text(infoPiece).font(.system(.largeTitle, design: .serif)).frame(width:600, height:1200).foregroundColor(Color.init("TaigaAlpineFont"))
        }.ignoresSafeArea().frame(width: height, height: height).background(Color.init("TaigaAlpineBackground"))
    }
}

struct PositiveCareer: View{
    @State var height: CGFloat = UIScreen.main.bounds.height*5
    @State var infoPiece = "It's awesome to hear that you are excelling in your career, whether you may be working, or still pursuing your studies. If you have successfully finished a project, studying for an exam, or working on any other great accomplishment, pat yourself on the back - congratulations. If you have reached a promotion of any sort, pat yourself on the back also! However, in being promoted, remember that you are becomming a larger role model and leader. Leadership comes with responsibility; a good leader is one that is willing to serve, not one who is asking to be served. If you are currently working, and have recieved extra compensation, congratulations! Take care of your new monetary resources responsibly, and use it to help make this planet a better place. Good job, be grateful that you have been able to come this far, and you should be proud of yourself."
    var body: some View{
        VStack{
            Text(infoPiece).font(.system(.largeTitle, design: .serif)).frame(width:600, height:1200).foregroundColor(Color.init("TaigaAlpineFont"))
        }.ignoresSafeArea().frame(width: height, height: height).background(Color.init("TaigaAlpineBackground"))
    }
}

struct PositiveFinance: View{
    
    @State var height: CGFloat = UIScreen.main.bounds.height*5
    @State var infoPiece = "It's awesome to hear that you are excelling in your finances! Whether you have recovered from debt and losses, or have just gained greater monetary resources and surplus, congratulations! With your resources expanding, however, comes greater responsibility. Be wise with your resource allocation, save for the rainy days, and also, form a foundation for the future. Whether it be for your personal future, or the future of your offspring, ensure that your resources move a long way, and don't end shortly. Once again, be proud of yourself, be grateful, and try to use all the resources you can for the embetterment of others' lives. Living in abundance is excellent, but wouldn't it be even greater if it wasn't only ourselves that we made content, but many others also?"
    var body: some View{
    
        VStack{
            Text(infoPiece).font(.system(.largeTitle, design: .serif)).frame(width:600, height:1200).foregroundColor(Color.init("TaigaAlpineFont"))
        }.ignoresSafeArea().frame(width: height, height: height).background(Color.init("TaigaAlpineBackground"))
    }
}

struct PositiveSocial: View{
    @State var height: CGFloat = UIScreen.main.bounds.height*5
    @State var infoPiece = "It's awesome to hear that your social life is in good health! Whether you have recovered broken relationships, made a new friend, recovered from loneliness, or reconciled with another individual, congratulations! Stay humble, and be someone dependable. Be someone that others can rely on, and be someone willing to understand others' perspectives, also willing to lower yourself when you know what you did was wrong. Nourish your relationships, as they will take you far. Ensure that you are a great contributor to your connections with others, allowing them to enjoy your presence, just as you cherish their own. Be a blessing to the people around you, and be thankful that these people have been put in your life; quality time with others is priceless, special, limited, and not to be taken for granted."
    var body: some View{
        
        VStack{
            Text(infoPiece).font(.system(.largeTitle, design: .serif)).frame(width:600, height:1200).foregroundColor(Color.init("TaigaAlpineFont"))
        }.ignoresSafeArea().frame(width: height, height: height).background(Color.init("TaigaAlpineBackground"))
    }
}


