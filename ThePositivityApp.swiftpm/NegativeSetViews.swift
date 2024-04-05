import SwiftUI
import Foundation
//Main
struct NegativeSet: View{
    @ObservedObject var negativeResponse = NegativeResponse(finished: false, responseString: "")
    @ObservedObject var messageBuilder = MessageBuilder(timeToMove: false, messagePiece1:"", messagePiece2:"")
    var body: some View{
        if negativeResponse.finished == false{
            NegativeSetPartOne().environmentObject(negativeResponse).environmentObject(messageBuilder)
        }
        else{
            if negativeResponse.responseString == "Career"{
                Career().environmentObject(messageBuilder)
            }
            if negativeResponse.responseString == "Social"{
                Social().environmentObject(messageBuilder)
            }
            if negativeResponse.responseString == "Finance"{
                Finance().environmentObject(messageBuilder)
            }
            if negativeResponse.responseString == "Grief"{
                Grief().environmentObject(messageBuilder)
            }
            if negativeResponse.responseString == "N/A"{
                Other().environmentObject(messageBuilder)
            }
            
            
        }
        
    }
}

//Status_Class
class NegativeResponse: ObservableObject{
    @Published var finished = true
    @Published var responseString = ""
    init(finished: Bool, responseString : String){
        self.finished = finished
        self.responseString = responseString
        
    }
}

//FirstView
struct NegativeSetPartOne: View{
    @State var height: CGFloat = UIScreen.main.bounds.height*5
    @EnvironmentObject var negativeResponse : NegativeResponse
    @EnvironmentObject var messageBuilder: MessageBuilder
    var body: some View{
        VStack{
            Text("Would you like to share what troubles you?").foregroundColor(Color.init("LavenderDeep")).font(.system(.largeTitle, design: .serif))
            Button("Career (school/work) struggles."){
                negativeResponse.finished = true
                negativeResponse.responseString = "Career"
            }.buttonStyle(LavenderButton())
            Button("Social or family difficulties."){
                negativeResponse.finished = true
                negativeResponse.responseString = "Social"
            }.buttonStyle(LavenderButton())
            Button("Financial or economic problems."){
                negativeResponse.finished = true
                negativeResponse.responseString = "Finance"
            }.buttonStyle(LavenderButton())
            Button("Loss/grief, or health struggles"){
                negativeResponse.finished = true
                negativeResponse.responseString = "Grief"
            }.buttonStyle(LavenderButton())
            Button("Not listed, or would prefer not to disclose."){
                negativeResponse.finished = true
                negativeResponse.responseString = "N/A"
            }.buttonStyle(LavenderButton())
           

        }.ignoresSafeArea().frame(width: height, height: height).background(Color.init("Lavender"))
    }
}


















//SecondViews

struct Career: View{
    @State var height: CGFloat = UIScreen.main.bounds.height*5
    @EnvironmentObject var messageBuilder : MessageBuilder
    var body: some View{
        if messageBuilder.timeToMove == true{
            MessageBuilderView().environmentObject(messageBuilder)
        }
        else{
            CareerParticle().environmentObject(messageBuilder)
        }
    }
}

struct Social: View{
    @EnvironmentObject var messageBuilder : MessageBuilder
    @State var height: CGFloat = UIScreen.main.bounds.height*5
    var body: some View{
        if messageBuilder.timeToMove == true{
            MessageBuilderView().environmentObject(messageBuilder)
        }
        else{
            SocialParticle().environmentObject(messageBuilder)
        }
    }
}

struct Finance: View{
    @EnvironmentObject var messageBuilder : MessageBuilder
    @State var height: CGFloat = UIScreen.main.bounds.height*5
    var body: some View{
        if messageBuilder.timeToMove == true{
            MessageBuilderView().environmentObject(messageBuilder)
        }
        else{
            SocialParticle().environmentObject(messageBuilder)
        }
    }
}

struct Grief: View{
    @EnvironmentObject var messageBuilder : MessageBuilder
    @State var height: CGFloat = UIScreen.main.bounds.height*5
    var body: some View{
        if messageBuilder.timeToMove == true{
            MessageBuilderView().environmentObject(messageBuilder)
            }
        else{
                GriefParticle().environmentObject(messageBuilder)
        }
    }
}










































//SecondViewInnerPieces
struct CareerParticle: View{
    @State var height: CGFloat = UIScreen.main.bounds.height*5
    @EnvironmentObject var messageBuilder : MessageBuilder
    var body: some View{
        VStack{
            Text("What issues have you encountered in your career?").foregroundColor(Color.init("LavenderDeep")).font(.system(.largeTitle, design: .serif))
            Button("Study stress?"){
                messageBuilder.timeToMove = true
                messageBuilder.messagePiece1 = "Its understandable that study expectations may be high, and work may oftentimes be tough. But always remember, your work is not for naught; you are building a greater, brighter future not only for yourself, but for generations to come. You are building your foundation now, and when the time comes, you will launch upwards. Your fantastic work will change your community, perhaps societies, and maybe even the world. Don't give up, you've already come so far. Keep on persevering."
                let today = Date()
                let hour = (Calendar.current.component(.hour, from: today))
                if hour>=18 || hour<=3{
                    messageBuilder.messagePiece2 = " The day's coming to an end. Keep on going, and finish strong!"
                }
                if hour>=4 && hour<=11{
                    messageBuilder.messagePiece2 = " Today's a new day. Let's start strong, cast away the troubles of yesterday, begin with a fresh start, and be victorious!"
                }
                if hour>=12 && hour<=17{
                    messageBuilder.messagePiece2 = " Its the middle of the day, almost there! Let's make today productive!"
                }
            }.buttonStyle(LavenderButton())
            Button("Work stress?"){
                messageBuilder.timeToMove = true
                messageBuilder.messagePiece1 = "Its understandable that work expectations may be high, and oftentimes difficult to meet. However, always remind yourself that your work matters to people - to your coworkers, to the household you may support, to your boss. Be the light in your workplace, be the positivity. Your efforts matter, you matter, your work isn't wasted. Persevere, keep on going, you've already come so far. What stresses you right now isn't the end-all-be-all - every moment is a simple speck; look long term, not only in the here and now."
                let today = Date()
                let hour = (Calendar.current.component(.hour, from: today))
                if hour>=18 || hour<=3{
                    messageBuilder.messagePiece2 = " The day's coming to an end. Keep on going, and finish strong!"
                }
                if hour>=4 && hour<=11{
                    messageBuilder.messagePiece2 = " Today's a new day. Let's start strong, cast away the troubles of yesterday, begin with a fresh start, and be victorious!"
                }
                if hour>=12 && hour<=17{
                    messageBuilder.messagePiece2 = " Its the middle of the day, almost there! Let's make today productive!"
                }
            }.buttonStyle(LavenderButton())
            Button("Working long and hard, but still feel unrewarded?"){
                messageBuilder.timeToMove = true
                messageBuilder.messagePiece1 = "Work may be tiring, it may burn you out, and you may not see the purpose of your work. Take heart, however. Your work matters, YOU matter. Don't overlook your greatness - when you think about your work, don't only think about the tiredness you experience, but rather, the people affected by your work. Think about the people who's lives were embettered because of your efforts. If you can't think of any, its time for a change! Be the light, be the positivity to the people you work with, the people you work under, and the people you work for. Make sure that all the work YOU do makes a DIFFERENCE."
                let today = Date()
                let hour = (Calendar.current.component(.hour, from: today))
                if hour>=18 || hour<=3{
                    messageBuilder.messagePiece2 = " The day's coming to an end. Keep on going, and finish strong!"
                }
                if hour>=4 && hour<=11{
                    messageBuilder.messagePiece2 = " Today's a new day. Let's start strong, cast away the troubles of yesterday, begin with a fresh start, and be victorious!"
                }
                if hour>=12 && hour<=17{
                    messageBuilder.messagePiece2 = " Its the middle of the day, almost there! Let's make today productive!"
                }
            }.buttonStyle(LavenderButton())
            Button("Other/not listed"){
                messageBuilder.timeToMove = true
                messageBuilder.messagePiece1 = "Sorry to hear that your day hasn't been the way you would like. Its understandable - tough days happen to us all, that's just the way life works. Continue persevering through your hardship, however. This difficult moment is just a speck in the vast collection of events in your life; persevere through these events, and you are sure to fine better days. If your hardships, struggles, feelings, or situations are not describable by the given options of The Positivity App, please feel free to provide feedback at ThePositivityApp@outlook.com."
                let today = Date()
                let hour = (Calendar.current.component(.hour, from: today))
                if hour>=18 || hour<=3{
                    messageBuilder.messagePiece2 = " The day's coming to an end. Keep on going, and finish strong!"
                }
                if hour>=4 && hour<=11{
                    messageBuilder.messagePiece2 = " Today's a new day. Let's start strong, cast away the troubles of yesterday, begin with a fresh start, and be victorious!"
                }
                if hour>=12 && hour<=17{
                    messageBuilder.messagePiece2 = " Its the middle of the day, almost there! Let's make today productive!"
                }
            }.buttonStyle(LavenderButton())
        }.ignoresSafeArea().frame(width: height, height: height).background(Color.init("Lavender"))
    }
}






struct SocialParticle: View{
    @State var height: CGFloat = UIScreen.main.bounds.height*5
    @EnvironmentObject var messageBuilder : MessageBuilder
    var body: some View{
        VStack{
            Text("What has troubled you in the social aspect of life?").foregroundColor(Color.init("LavenderDeep")).font(.system(.largeTitle, design: .serif))
            Button("Arguement, hurt feelings, offense?"){
                messageBuilder.timeToMove = true
                messageBuilder.messagePiece1 = "Humans are social beings, in other words, meant to live in community. Unfortunately, however, part of living in a community is disagreement, arguement, and sometimes insult. Its not always fun, but when we rise and overcome it, we build stronger bonds which allow us to build a greater future together. First, understand that friction is caused by two rubbing sides. What was your part in this issue? You cannot force others to move towards goodness, but you can take the first step into reconcile."
                let today = Date()
                let hour = (Calendar.current.component(.hour, from: today))
                if hour>=18 || hour<=3{
                    messageBuilder.messagePiece2 = " The day's coming to an end. Keep on going, and finish strong!"
                }
                if hour>=4 && hour<=11{
                    messageBuilder.messagePiece2 = " Today's a new day. Let's start strong, cast away the troubles of yesterday, begin with a fresh start, and be victorious!"
                }
                if hour>=12 && hour<=17{
                    messageBuilder.messagePiece2 = " Its the middle of the day, almost there! Let's make today productive!"
                }
            }.buttonStyle(LavenderButton())
            Button("Loneliness; unable to fit in?"){
                messageBuilder.timeToMove = true
                messageBuilder.messagePiece1 = "Humans are social beings - in other words, we are built to live in community. Loneliness is not part of our design, but sometimes, it is a sensation which is part of life. When we move to new environments, or don't find people with common ground, we feel lonely. If you feel as if you haven't yet fit in, think of it like fitting wooden shapes into slits cut out for them. You, the shape, may feel like you fit in not cut-out. Sometimes it begins with us cutting out the slot which others and ourselves can both fit into. Sometimes, loneliness begins with you helping others fit in, not with them forcing you into their cut-out."
                let today = Date()
                let hour = (Calendar.current.component(.hour, from: today))
                if hour>=18 || hour<=3{
                    messageBuilder.messagePiece2 = " The day's coming to an end. Keep on going, and finish strong!"
                }
                if hour>=4 || hour<=11{
                    messageBuilder.messagePiece2 = " Today's a new day. Let's start strong, cast away the troubles of yesterday, begin with a fresh start, and be victorious!"
                }
                if hour>=12 || hour<=17{
                    messageBuilder.messagePiece2 = " Its the middle of the day, almost there! Let's make today productive!"
                }
            }.buttonStyle(LavenderButton())
            Button("Other/not listed"){
                messageBuilder.timeToMove = true
                messageBuilder.messagePiece1 = "Sorry to hear that your day hasn't been the way you would like. Its understandable - tough days happen to us all, that's just the way life works. Continue persevering through your hardship, however. This difficult moment is just a speck in the vast collection of events in your life; persevere through these events, and you are sure to fine better days. If your hardships, struggles, feelings, or situations are not describable by the given options of The Positivity App, please feel free to provide feedback at ThePositivityApp@outlook.com."
                let today = Date()
                let hour = (Calendar.current.component(.hour, from: today))
                if hour>=18 || hour<=3{
                    messageBuilder.messagePiece2 = " The day's coming to an end. Keep on going, and finish strong!"
                }
                if hour>=4 && hour<=11{
                    messageBuilder.messagePiece2 = " Today's a new day. Let's start strong, cast away the troubles of yesterday, begin with a fresh start, and be victorious!"
                }
                if hour>=12 && hour<=17{
                    messageBuilder.messagePiece2 = " Its the middle of the day, almost there! Let's make today productive!"
                }
        }.buttonStyle(LavenderButton())
                
        }.ignoresSafeArea().frame(width: height, height: height).background(Color.init("Lavender"))
    }
}

struct FinanceParticle: View{
    @State var height: CGFloat = UIScreen.main.bounds.height*5
    @EnvironmentObject var messageBuilder : MessageBuilder
        var body: some View{
            VStack{
                Text("What hardships have you encountered in your finance?").foregroundColor(Color.init("LavenderDeep")).font(.system(.largeTitle, design: .serif))
                Button("Weighed down by debt?"){
                    messageBuilder.timeToMove = true
                    messageBuilder.messagePiece1 = "Handling finances may indeed be difficult, especially when you are in the negatives. Its understandable that these times may be difficult for you, but remember, continue persevering. Everything is possible if you try, and overcoming your debt is absolutely not an impossibility. Despite tough circumstances, continue working to break the chains of your money. Work hard to ensure that you aren't enslaved by money, but rather, money work for you. Continue pushing to break the chains of financial bondage. Fight to recover, and when you do, ensure you do not use more than you can pay - instead, save for rainy days."
                    let today = Date()
                    let hour = (Calendar.current.component(.hour, from: today))
                    if hour>=18 || hour<=3{
                        messageBuilder.messagePiece2 = " The day's coming to an end. Keep on going, and finish strong!"
                    }
                    if hour>=4 && hour<=11{
                        messageBuilder.messagePiece2 = " Today's a new day. Let's start strong, cast away the troubles of yesterday, begin with a fresh start, and be victorious!"
                    }
                    if hour>=12 && hour<=17{
                        messageBuilder.messagePiece2 = " Its the middle of the day, almost there! Let's make today productive!"
                    }
                }.buttonStyle(LavenderButton())
                Button("Having difficulty keeping a roof over your head and struggling to put food on the table?"){
                    messageBuilder.timeToMove = true
                    messageBuilder.messagePiece1 = "Struggling to provide for yourself is difficult; struggling to provide for a family feels even worse. You may feel hopeless, futureless, without any options or desirable ways out. Remember, however, these tough times are not the end of the world. If you have a family, remember that your children need you - you can't give up now. Continue persevering; your efforts are not for naught. The difficulty of these times will strengthen you, allowing you to return stronger after your financial recovery. If you need support, remember, there are 7.9 billion others living on this planet - all your brothers and sisters. Reach out if you need help; the world has its unpleasant people, but there are also the longsuffering and caring. Persevere, better days are ahead."
                    let today = Date()
                    let hour = (Calendar.current.component(.hour, from: today))
                    if hour>=18 || hour<=3{
                        messageBuilder.messagePiece2 = " The day's coming to an end. Keep on going, and finish strong!"
                    }
                    if hour>=4 && hour<=11{
                        messageBuilder.messagePiece2 = " Today's a new day. Let's start strong, cast away the troubles of yesterday, begin with a fresh start, and be victorious!"
                    }
                    if hour>=12 && hour<=17{
                        messageBuilder.messagePiece2 = " Its the middle of the day, almost there! Let's make today productive!"
                    }
                }.buttonStyle(LavenderButton())
                Button("Financial health is not expanding?"){
                    messageBuilder.timeToMove = true
                    messageBuilder.messagePiece1 = "Without a doubt, working hard without noticable financial growth is a large issue. Its recommended that one takes steps to improve their economic state. Ensure that you don't work for money, but rather that money works for you. Begin planning for growth. Does it require you to smartly utilize your money, or possibly due more monetarily effective work. Plan, execute, and watch yourself grow."
                    let today = Date()
                    let hour = (Calendar.current.component(.hour, from: today))
                    if hour>=18 || hour<=3{
                        messageBuilder.messagePiece2 = " The day's coming to an end. Keep on going, and finish strong!"
                    }
                    if hour>=4 && hour<=11{
                        messageBuilder.messagePiece2 = " Today's a new day. Let's start strong, cast away the troubles of yesterday, begin with a fresh start, and be victorious!"
                    }
                    if hour>=12 && hour<=17{
                        messageBuilder.messagePiece2 = " Its the middle of the day, almost there! Let's make today productive!"
                    }
                }.buttonStyle(LavenderButton())
                Button("Other/not listed"){
                    messageBuilder.timeToMove = true
                    messageBuilder.messagePiece1 = "Sorry to hear that your day hasn't been the way you would like. Its understandable - tough days happen to us all, that's just the way life works. Continue persevering through your hardship, however. This difficult moment is just a speck in the vast collection of events in your life; persevere through these events, and you are sure to fine better days. If your hardships, struggles, feelings, or situations are not describable by the given options of The Positivity App, please feel free to provide feedback at ThePositivityApp@outlook.com."
                    let today = Date()
                    let hour = (Calendar.current.component(.hour, from: today))
                    if hour>=18 || hour<=3{
                        messageBuilder.messagePiece2 = " The day's coming to an end. Keep on going, and finish strong!"
                    }
                    if hour>=4 && hour<=11{
                        messageBuilder.messagePiece2 = " Today's a new day. Let's start strong, cast away the troubles of yesterday, begin with a fresh start, and be victorious!"
                    }
                    if hour>=12 && hour<=17{
                        messageBuilder.messagePiece2 = " Its the middle of the day, almost there! Let's make today productive!"
                    }
                }.buttonStyle(LavenderButton())
    }.ignoresSafeArea().frame(width: height, height: height).background(Color.init("Lavender"))
        }
}


struct Other: View{
    @State var height: CGFloat = UIScreen.main.bounds.height*5
    var body: some View{
        VStack{
            Text("Sorry to hear that your day hasn't been the way you would like. Its understandable - tough days happen to us all, that's just the way life works. Continue persevering through your hardship, however. This difficult moment is just a speck in the vast collection of events in your life; persevere through these events, and you are sure to fine better days. If your hardships, struggles, feelings, or situations are not describable by the given options of The Positivity App, please feel free to provide feedback at ThePositivityApp@outlook.com." ).font(.system(.largeTitle, design: .serif)).frame(width:600, height:1200).foregroundColor(Color.init("TaigaAlpineFont"))
        }.ignoresSafeArea().frame(width: height, height: height).background(Color.init("TaigaAlpineBackground"))
    }
}

struct GriefParticle: View{
    @State var height: CGFloat = UIScreen.main.bounds.height*5
    @EnvironmentObject var messageBuilder : MessageBuilder
    var body: some View{
        VStack{
            Text("Oh no! What happened?").foregroundColor(Color.init("LavenderDeep")).font(.system(.largeTitle, design: .serif))
            Button("Loss of a loved one?"){
                messageBuilder.timeToMove = true
                messageBuilder.messagePiece1 = "Deepest condolences; it's well known that losing a loved one isn't easy to overcome. Many are acquainted with the grief, sorrow, and sadness you must feel right now. But do not lose heart! Your loved one has departed from the Earth, having already fulfilled their purpose on the planet - you must still fulfill your own. Remember that your loved one wouldn't want the grief that currently overcomes you to prevent you from reaching your personal destiny. There is a time for mourning, but there is also a time for the sun the shine once again, and for you to do your part to make others, including your loved ones alive today, feel the way that the loved one you just lost made you feel."
                let today = Date()
                let hour = (Calendar.current.component(.hour, from: today))
                if hour>=18 || hour<=3{
                    messageBuilder.messagePiece2 = " The day's coming to an end. Keep on going, and finish strong!"
                }
                if hour>=4 && hour<=11{
                    messageBuilder.messagePiece2 = " Today's a new day. Let's start strong, cast away the troubles of yesterday, begin with a fresh start, and be victorious!"
                }
                if hour>=12 && hour<=17{
                    messageBuilder.messagePiece2 = " Its the middle of the day, almost there! Let's make today productive!"
                }
            }.buttonStyle(LavenderButton())
            Button("Loss of an inspiring public figure?"){
                messageBuilder.timeToMove = true
                messageBuilder.messagePiece1 = "Deepest condolences; it's well known that losing an inspiring figure in your life isn't easy to overcome. Many are acquainted with the grief, sorrow, and sadness you must feel right now. There must be many others who are sharing your mournful feelings, and it's completely understandable for you to experience sadness. However, just as there is a time for mourning, there is a time for the sun to rise again. The inspiring leader in your life inspired you so that you could do the same onto others. Soon, you will have to take on the work which they have already put in, and empower others, allowing them to feel the inspiration which the figure you recently lost made you feel."
                let today = Date()
                let hour = (Calendar.current.component(.hour, from: today))
                if hour>=18 || hour<=3{
                    messageBuilder.messagePiece2 = " The day's coming to an end. Keep on going, and finish strong!"
                }
                if hour>=4 && hour<=11{
                    messageBuilder.messagePiece2 = " Today's a new day. Let's start strong, cast away the troubles of yesterday, begin with a fresh start, and be victorious!"
                }
                if hour>=12 && hour<=17{
                    messageBuilder.messagePiece2 = " Its the middle of the day, almost there! Let's make today productive!"
                }
            }.buttonStyle(LavenderButton())
            Button("Diagnosed with an undesirable condition?"){
                messageBuilder.timeToMove = true
                messageBuilder.messagePiece1 = "Undergoing a diagnosis is most definately not an easy time. You must feel, perhaps, worried, anxious, and possibly hopeless. Take heart, however - you are stronger than the conditions which are against you. It isn't the strong illnesses that are victorious, but rather, the strong people who are determined to overcome these illnesses. Stay strong, persevere, know that your community stands with and for you, and you will soon be whole again. Persevere, do it for your loved ones, do it for the people who you still need to reach out to, do it for those it is your destiny to impact."
                let today = Date()
                let hour = (Calendar.current.component(.hour, from: today))
                if hour>=18 || hour<=3{
                    messageBuilder.messagePiece2 = " The day's coming to an end. Keep on going, and finish strong!"
                }
                if hour>=4 && hour<=11{
                    messageBuilder.messagePiece2 = " Today's a new day. Let's start strong, cast away the troubles of yesterday, begin with a fresh start, and be victorious!"
                }
                if hour>=12 && hour<=17{
                    messageBuilder.messagePiece2 = " Its the middle of the day, almost there! Let's make today productive!"
                }
            }.buttonStyle(LavenderButton())
            Button("Loved one diagnosed with an undesirable condition?"){
                messageBuilder.timeToMove = true
                messageBuilder.messagePiece1 = "The diagnosis of a loved one is never an easy issue to accept. You may feel worried, anxious, and perhaps, hopeless. You may feel afraid of losing someone you love, and frustrated that much of this issue is out of your hands - you feel that you would do anything for your loved one's condition to improve, but in reality, there isn't much you can do. Be encouranged however, as it isn't the strong ailments which previal, but rather the strong people who overtake them. Stay strong, persevere, be a pillar of support for your loved one from the sidelines, and make them know that you are there for them. Sometimes, when there are no more ways in our current capabilities to help improve a poor situation of another individual, the best we can do is help keep them positive, strong, hopeful, and comfortable, knowing someone stands beside them."
                let today = Date()
                let hour = (Calendar.current.component(.hour, from: today))
                if hour>=18 || hour<=3{
                    messageBuilder.messagePiece2 = " The day's coming to an end. Keep on going, and finish strong!"
                }
                if hour>=4 && hour<=11{
                    messageBuilder.messagePiece2 = " Today's a new day. Let's start strong, cast away the troubles of yesterday, begin with a fresh start, and be victorious!"
                }
                if hour>=12 && hour<=17{
                    messageBuilder.messagePiece2 = " Its the middle of the day, almost there! Let's make today productive!"
                }
            }.buttonStyle(LavenderButton())
            Button("Other/not listed"){
                messageBuilder.timeToMove = true
                messageBuilder.messagePiece1 = "Sorry to hear that your day hasn't been the way you would like. Its understandable - tough days happen to us all, that's just the way life works. Continue persevering through your hardship, however. This difficult moment is just a speck in the vast collection of events in your life; persevere through these events, and you are sure to fine better days. If your hardships, struggles, feelings, or situations are not describable by the given options of The Positivity App, please feel free to provide feedback at ThePositivityApp@outlook.com."
                let today = Date()
                let hour = (Calendar.current.component(.hour, from: today))
                if hour>=18 || hour<=3{
                    messageBuilder.messagePiece2 = " The day's coming to an end. Keep on going, and finish strong!"
                }
                if hour>=4 && hour<=11{
                    messageBuilder.messagePiece2 = " Today's a new day. Let's start strong, cast away the troubles of yesterday, begin with a fresh start, and be victorious!"
                }
                if hour>=12 && hour<=17{
                    messageBuilder.messagePiece2 = " Its the middle of the day, almost there! Let's make today productive!"
                }
            }.buttonStyle(LavenderButton())
        }.ignoresSafeArea().frame(width: height, height: height).background(Color.init("Lavender"))
    }
}
