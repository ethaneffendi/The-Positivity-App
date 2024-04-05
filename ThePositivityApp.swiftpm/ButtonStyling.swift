import SwiftUI

struct RobinEggButton: ButtonStyle{
    let height: CGFloat = UIScreen.main.bounds.height
    let width: CGFloat = UIScreen.main.bounds.width
    func makeBody(configuration: Configuration) -> some View {
        configuration.label.padding().frame(width: width-300, height: height/2-300).background(Color.init("SagePressed")).foregroundColor(Color.white).scaleEffect(configuration.isPressed ? 0.95 : 1).border(configuration.isPressed ? Color.accentColor : Color.init("ButtonBeforePressBorder"), width: 10).cornerRadius(15).font(.system(.largeTitle, design: .serif))
    }
}

struct LavenderButton: ButtonStyle{
    @State var width: CGFloat = UIScreen.main.bounds.width
    @State var height: CGFloat = UIScreen.main.bounds.height
    @State var heightUsable: CGFloat = UIScreen.main.bounds.height/4
    func makeBody(configuration: Configuration) -> some View{
        configuration.label.padding().frame(width:width-300, height:heightUsable-100).background(Color.init("LavenderPressed")).foregroundColor(Color.white).scaleEffect(configuration.isPressed ? 0.95 : 1).border(configuration.isPressed ? Color.accentColor: Color.init("ButtonBeforePressBorder"), width: 10).cornerRadius(15).font(.system(.largeTitle, design: .serif))
    }
}

struct RoseButton: ButtonStyle{
    @State var width: CGFloat = UIScreen.main.bounds.width
    @State var height: CGFloat = UIScreen.main.bounds.height
    @State var heightUsable: CGFloat = UIScreen.main.bounds.height/4
    func makeBody(configuration: Configuration) -> some View{
        configuration.label.padding().frame(width:width-300, height:heightUsable-100).background(Color.init("Rose")).foregroundColor(Color.white).scaleEffect(configuration.isPressed ? 0.95 : 1).border(configuration.isPressed ? Color.accentColor: Color.init("ButtonBeforePressBorder"), width: 10).cornerRadius(15).font(.system(.largeTitle, design: .serif))
    }
}
