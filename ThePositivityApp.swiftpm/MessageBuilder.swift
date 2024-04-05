import SwiftUI
class MessageBuilder: ObservableObject{
    @Published var timeToMove = false
    @Published var messagePiece1 = ""
    @Published var messagePiece2 = ""
    init(timeToMove:Bool, messagePiece1:String, messagePiece2: String){
        self.timeToMove = timeToMove
        self.messagePiece1 = messagePiece1
        self.messagePiece2 = messagePiece2
    }
}

struct MessageBuilderView: View{
    @EnvironmentObject var messageBuilder: MessageBuilder
    @State var height: CGFloat = UIScreen.main.bounds.height*5
    var body: some View{
        let message = messageBuilder.messagePiece1 + messageBuilder.messagePiece2
        VStack{
            Text(message).font(.system(.largeTitle, design: .serif)).frame(width:600, height:1200).foregroundColor(Color.init("TaigaAlpineFont"))
        }.ignoresSafeArea().frame(width: height, height: height).background(Color.init("TaigaAlpineBackground"))
    }
}
