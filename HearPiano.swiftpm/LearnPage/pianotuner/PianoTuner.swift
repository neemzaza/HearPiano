import SwiftUI
import Subsonic

struct DialogTemplate: Hashable, Identifiable {
    let id = UUID()
    let text: [String]
    let useButton: Bool
    let buttonDialog: String
    let buttonIcon: String
}

struct PianoTuner: View {
    
    @Environment(\.dismiss) private var dismiss
    
    let allDialog: [DialogTemplate] = [
        DialogTemplate(text: ["Check up piano first by pressing on key", "It so weired right?"],useButton: true, buttonDialog: "Yes, I see", buttonIcon: "eyes"),
        DialogTemplate(text: ["Let's open piano cover!", "Drag the black object above the keyboard to out of position."],useButton: false , buttonDialog: "Ok!, and then?", buttonIcon: "arrow.right"),
        DialogTemplate(text: ["You can see a system inside of upright piano!", "You can press any key to see an action!"],useButton: true , buttonDialog: "Next", buttonIcon: "arrow.right"),
        DialogTemplate(text: ["Now, You can see your bag", "Grab your tool to start tuning a piano!"],useButton: false, buttonDialog: "Next", buttonIcon: "arrow.right"),
        DialogTemplate(text: ["Tap on the first white circle in system it called \"Pin\""],useButton: false, buttonDialog: "Next", buttonIcon: "arrow.right"),
        
        DialogTemplate(text: ["Try pressing \"C\" key on Piano..."], useButton: false, buttonDialog: "Next", buttonIcon: "arrow.right"),
        
        DialogTemplate(text: ["Use hint button above a piano to listen what that sound actually."], useButton: false, buttonDialog: "Next", buttonIcon: "arrow.right"),
        
        DialogTemplate(text: ["It's seem higher than actually right?"], useButton: true, buttonDialog: "Oh, Yes!", buttonIcon: "eyes"),
        
        DialogTemplate(text: ["Try to tuning down (Press <- left arrows button) to decrease pitch sound. (-1 semitone)"], useButton: false, buttonDialog: "Oh, Yes!", buttonIcon: "eyes"),
        
        DialogTemplate(text: ["Now, let's press that key again."], useButton: false, buttonDialog: "Oh, Yes!", buttonIcon: "eyes"),
        
        DialogTemplate(text: ["It's still higher than actually right?"], useButton: true, buttonDialog: "Oh, Yes!", buttonIcon: "eyes"),
        
        DialogTemplate(text: ["Try to tuning down (Press <- left arrows button) again to decrease pitch sound. (-1 semitone)"], useButton: false, buttonDialog: "Oh, Yes!", buttonIcon: "eyes"),
        
        DialogTemplate(text: ["Now, let's press that key again."], useButton: false, buttonDialog: "Oh, Yes!", buttonIcon: "eyes"),
        
        DialogTemplate(text: ["Use hint button above a piano to listen to check up sound that corrected."], useButton: false, buttonDialog: "Next", buttonIcon: "arrow.right"),
        
        
        DialogTemplate(text: ["That correct! you can tune other keys by taping on \"X\" and select another pin or taping another pin.", "Enjoy!"], useButton: false, buttonDialog: "OK, I'll try that", buttonIcon: "tuningfork")
    ]
    
    @Binding var pageIndex: Int;
    
    @State private var pianoIndex: Int = 0
    
    @State private var eachKey: [Int] = [0,1,2,3,4,5,6,7,8,9,10,11]
    @State private var keyBroken: Int = -1
    @State private var tunerPut: Int = -1
    
    @State private var coverFrontState: Bool = true
    @State private var tunerStickHas: Bool = false
    
    @State private var backpackPut: Bool = false
    @State private var grabToolAmount: Int = 0
    
    @State private var failedMission: Bool = false
    @State private var tuningSuccess: Bool = false
    
    @State private var skipTutorial: Bool = true
    @State private var sheetPresented: Bool = true
    @State private var skipPopUp: Bool = true;
    
    @State private var animationEnable: Bool = false
    
    @State private var wrongAnimation: Bool = false
    
    @State private var octaveRandomBool: Bool = true
    
    // Orientation detection
//    @State private var isPortraitDetect: Bool = UIDevice.current.orientation.isPortrait
    
    // Device detection
    @State private var isPhone: Bool = UIDevice.current.userInterfaceIdiom == .phone ? true : false
    
    let layout = UIDevice.current.userInterfaceIdiom == .phone ? AnyLayout(VStackLayout()) : AnyLayout(HStackLayout())
    
    func nameOfNote(number: Int) -> String {
        if number == 0 {
            return "C" 
        } else if number == 1 {
            return "C#" 
        } else if number == 2 {
            return "D" 
        } else if number == 3 {
            return "D#" 
        } else if number == 4 {
            return "E" 
        } else if number == 5 {
            return "F" 
        } else if number == 6 {
            return "F#" 
        } else if number == 7 {
            return "G" 
        } else if number == 8 {
            return "G#" 
        } else if number == 9 {
            return "A" 
        } else if number == 10 {
            return "A#" 
        } else if number == 11 {
            return "B" 
        } else {
            return "."
        }
    }
    
    func soundOfNote(number: Int) {
        
        let octave = octaveRandomBool ? 3 : 4
        
        if number == 0 {
            (octave == 3) ? play(sound: "cnote.wav") : play(sound:"c5.wav")
        } else if number == 1 {
            (octave == 3) ? play(sound: "cs.wav") :
            play(sound: "cs5.wav")
        } else if number == 2 {
            (octave == 3) ? play(sound: "d.wav") :
            play(sound: "d5.wav")
        } else if number == 3 {
            (octave == 3) ?
            play(sound: "ds.wav")
            :
            play(sound: "ds5.wav")
        } else if number == 4 {
            (octave == 3) ?
            play(sound: "e.wav")
            :
            play(sound: "e5.wav")
        } else if number == 5 {
            (octave == 3) ?
            play(sound: "f.wav")
            :
            play(sound: "f5.wav")
        } else if number == 6 {
            (octave == 3) ?
            play(sound: "fs.wav")
            :
            play(sound: "fs5.wav")
        } else if number == 7 {
            (octave == 3 ) ?
            play(sound: "g.wav")
            :
            play(sound: "g5.mp3")
        } else if number == 8 {
            (octave == 3) ?
            play(sound: "gs.wav")
            :
            play(sound: "gs5.wav")
        } else if number == 9 {
            (octave == 3) ?
            play(sound: "a.wav")
            :
            play(sound: "a5.wav")
        } else if number == 10 {
            (octave == 3) ?
            play(sound: "as.wav")
            :
            play(sound: "as5.wav")
        } else if number == 11 {
            (octave == 3) ?
            play(sound: "b.wav")
            :
            play(sound: "b5.wav")
        }
    }
    
    func checkingFinish() {
        for i in 0...11 {
            if (i != eachKey[i]) {
                wrongAnimation = true
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    wrongAnimation = false
                }
                return
            }
            print("Passed \(eachKey[i])")
        }
        withAnimation(.spring()) {
            pageIndex += 1
        }
    }
    
    var body: some View {
        
        //if (tunerPut != -1) {
        ZStack {
            
            VStack(spacing: 0) {
                //Sky
                Rectangle()
                    .foregroundStyle(Color.brown)
                // Ground
                ZStack {
                    Rectangle()
                        .foregroundStyle(Color.red.opacity(0.5))
                        
                    HStack {
                        // Backpack
                        Spacer()
                        Image("Image Asset 4")
                            .resizable()
                            .scaledToFit()
                        
                            .frame(width: 200)
                            .shadow(radius: 10)
                            .overlay {
                                if (pianoIndex == 3 && !coverFrontState) {
                                    Text("Tap me to grab tuning tool")
                                    //.frame(maxWidth: pageIndex == 0 ? 500 : 10)
                                        .foregroundStyle(Color.black)                    .multilineTextAlignment(.leading)
                                        .padding()
                                        .background(Color.white)
                                        .clipShape(.rect(cornerRadius: 20))
                                }
                            }
                            .onTapGesture {
                                if (pianoIndex == 3 && !coverFrontState) {
                                    play(sound: "Soundfxgrab.m4a")
                                    tunerStickHas = true;
                                    withAnimation(.spring()) {
                                        pianoIndex = 4
                                    }
                                }
                            }
                            .transition(.slide)
                        
                    }
                }
                    
            }
            VStack {
                
                HStack {
                    
                    //if (!isPhone) {
                        Spacer()
                            .frame(width: 45)
                        Spacer()
                    //}
                    
                    // Restart BTN
                    Button {
                        withAnimation(.spring()) {
                            pageIndex -= 1
                        }
                    } label: {
                        if (!isPhone) {
                            Label("Restart", systemImage: "arrow.trianglehead.counterclockwise.rotate.90")
                        } else {
                            Image(systemName: "arrow.trianglehead.counterclockwise.rotate.90")
                        }
                    }
                    //.offset(y: 10)
                    .animation(.spring(), value: tunerStickHas)
                    .buttonStyle(.borderedProminent)
                    .tint(Color.orange)
                    Spacer()
                    
                    // ?
                    Button {
                        sheetPresented = true
                        
                    } label: {
                        Image(systemName: "questionmark.app")
                            .font(.title)

                    }.tint(Color.white)
                    .disabled((pianoIndex < 14 && !skipTutorial) || (skipTutorial && pianoIndex < 4))
                    
                    // HINT
                    Button {
                        soundOfNote(number: tunerPut)
                        
                        if (!skipTutorial && (pianoIndex == 6 || pianoIndex == 13)) {
                            withAnimation(.spring()) {
                                pianoIndex += 1
                            }
                        }
                    } label: {
                        if (!isPhone) {
                            Label(tunerPut != -1 ? "Hint: What is '\(nameOfNote(number: tunerPut))' sound actually like?" : "Hint: You need to insert the tuner stick into the pin.", systemImage: "lightbulb.fill")
                        } else {
                            Label(tunerPut != -1 ? "Listen '\(nameOfNote(number: tunerPut))'" : " ", systemImage: "lightbulb.fill")
                        }
                    }
                    //.offset(y: 10)
                    .disabled(tunerPut == -1)
                    .animation(.spring(), value: tunerPut)
                    .buttonStyle(.borderedProminent)
                    Spacer()
                    Button {
                        checkingFinish()
                    } label: {
                        if (!isPhone) {
                            Label("I have finished tuning this piano!", systemImage: "checkmark.circle.fill")
                        } else {
                            Label(tunerPut != -1 ? " " : "Finish!", systemImage: "checkmark.circle.fill")
                        }
                    }
                    //.offset(y: 10)
                    .disabled(!tunerStickHas)
                    .animation(.spring(), value: tunerStickHas)
                    .buttonStyle(.borderedProminent)
                    .tint(Color.green)
                    .animation(.spring(), value: tunerPut)
                    
                    if (!isPhone) {
                        Spacer()
                    }
                    
                }.padding()
                //}
                Spacer()
                PianoUpright(returnKey: .constant([]), showSymbol: .constant(true), stringBreak: $keyBroken, tunerStickHas: $tunerStickHas, coverFrontState: $coverFrontState, eachKey: $eachKey, tunerPutOn: $tunerPut, skipTutorial: $skipTutorial, pianoIndex: $pianoIndex, octaveRandomBool: $octaveRandomBool)
                    .shadow(radius: 10)
                    .offset(x: isPhone ? pianoIndex == 3 ? -300 : 0 : 0,y: -10)
                    .overlay {
                        if (pianoIndex == 4 && !skipTutorial) {
                            Image(systemName: "hand.point.down.fill")
                                .font(.system(size: 50))
                                .foregroundStyle(Color.white)
                                .offset(x: -170, y: -280)
                                .shadow(radius: 10)
                                
                        } else if (pianoIndex == 1 && !skipTutorial) {
                            Image(systemName: "arrow.right")
                                .font(.system(size: 50))
                                .foregroundStyle(Color.white)
                                .offset(x: animationEnable ? !isPhone ? 220 : 200 : !isPhone ? 280 : 120, y: -150)
                                .shadow(radius: 10)
                                .animation(.spring(duration: 0.5, bounce: 0.25).repeatForever(), value: animationEnable)
                                .onAppear() {
                                    animationEnable = true
                                }
                        } else if ((pianoIndex == 5 || pianoIndex == 9 || pianoIndex == 12) && !skipTutorial) {
                            Image(systemName: "hand.point.up.fill")
                                .font(.system(size: 50))
                                .foregroundStyle(Color.white)
                                .offset(x: -170, y: 120)
                                .shadow(radius: 10)
                        } 
                        else if ((pianoIndex == 6 || pianoIndex == 13) && !skipTutorial) {
                            Image(systemName: "hand.point.up.fill")
                                .font(.system(size: 50))
                                .foregroundStyle(Color.white)
                                .offset(x: !isPhone ? -170 : 0, y: -400)
                                .shadow(radius: 10)
                        }
                    }
                    .onChange(of: coverFrontState) {
                        value in
                        if (!skipTutorial) {
                            withAnimation(.spring()) {
                                pianoIndex = 2
                            }
                        } else {
                            withAnimation(.spring()) {
                                pianoIndex = 3
                            }
                        }
                    }
                    .onChange(of: keyBroken) { 
                        value in
                        failedMission = true
                    }
                    .onChange(of: tunerPut) {
                        value in
                        withAnimation(.spring()) {
                            if value != -1 {
                                // Tutorial Popup
                                if !skipPopUp && !skipTutorial {
                                    pianoIndex = 5
                                    sheetPresented = true
                                }
                            }
                        }
                    }
                    .sheet(isPresented: $failedMission, content: {
                        VStack {
                            Image("Image Asset 10")
                                .resizable()
                                .scaledToFit()
                            Text("Oh no! You made Piano owner ANGRYY! 😡 because you brake very expensive piano string! 😭")
                                .font(.title)
                                .bold()
                            Button {
                                withAnimation(.spring()) {
                                    failedMission = false
                                    pageIndex -= 1
                                }
                            } label: {
                                Label("Try again!", systemImage: "arrow.trianglehead.counterclockwise.rotate.90")
                            }
                            //.offset(y: 10)
                            .animation(.spring(), value: failedMission)
                            .buttonStyle(.borderedProminent)
                            .tint(Color.orange)
                        }.padding()
                            .interactiveDismissDisabled()
                    })
            }
            
            
            if (!skipTutorial)  {
                if (isPhone) {
                    Spacer()
                }
                layout {
                    VStack(alignment: .leading) {
                        if (!(isPhone && pianoIndex == 14)) {
                            ForEach (allDialog[pianoIndex].text, id: \.self) {
                                textDialog in
                                
                                Text(textDialog)
                                //.frame(maxWidth: pageIndex == 0 ? 500 : 10)
                                    .foregroundStyle(Color.black)                    .multilineTextAlignment(.leading)
                                    .padding()
                                    .background(Color.white)
                                    .clipShape(.rect(cornerRadius: 20))
                                    .opacity(animationEnable ? 1 : 0)
                                    .scaleEffect(animationEnable ? 1 : 0.5)
                                    .offset(x: animationEnable ? 0 : -320)
                                //                                .animation(.spring(duration: 0.5, bounce: 0.25).delay(1), value: animationEnable)
                            }
                        }
                        
                        if (pianoIndex == 4) {
                            Text("Caution! Be careful of broken string. You have to increase or decrease string only 3 steps from the pitch of that string given.")
                            //.frame(maxWidth: pageIndex == 0 ? 500 : 10)
                                .foregroundStyle(Color.white)                    .multilineTextAlignment(.leading)
                                .padding()
                                .background(Color.red)
                                .clipShape(.rect(cornerRadius: 20))
                                .opacity(animationEnable ? 1 : 0)
                                .scaleEffect(animationEnable ? 1 : 0.5)
                                .offset(x: animationEnable ? 0 : -320)
                                .animation(.spring(duration: 0.5, bounce: 0.25).delay(1.5), value: animationEnable)
                        }
                        
                        if (pianoIndex == 5) {
                            Text("Be careful when pressing the keys on the piano. You may be pressing a different key from the one in which the tuning stick is inserted.")
                            //.frame(maxWidth: pageIndex == 0 ? 500 : 10)
                                .foregroundStyle(Color.black)                    .multilineTextAlignment(.leading)
                                .padding()
                                .background(Color.yellow)
                                .clipShape(.rect(cornerRadius: 20))
                                .opacity(animationEnable ? 1 : 0)
                                .scaleEffect(animationEnable ? 1 : 0.5)
                                .offset(x: animationEnable ? 0 : -320)
                                .animation(.spring(duration: 0.5, bounce: 0.25).delay(2), value: animationEnable)
                        }
                        
                    }.frame(width: 250)
              
                    if (!isPhone) {
                        Spacer()
                    } else {
                        if (pianoIndex == 1) {
                            Spacer()
                        }
                    }
                    HStack {
                        Spacer()
                        Button {
                            withAnimation(.spring()) {
                                pianoIndex += 1;
                                
                                if (pianoIndex == 1) {
                                    animationEnable = false
                                }
                            }
                        } label: {
                            Label(allDialog[pianoIndex].buttonDialog, systemImage: allDialog[pianoIndex].buttonIcon)
                        }
                        .buttonStyle(.borderedProminent)
                        .opacity(animationEnable && allDialog[pianoIndex].useButton ? 1 : 0)
                        .scaleEffect(animationEnable ? 1 : 0.5)
                        .offset(x: animationEnable ? 0 : 320)
                        .animation(.spring(duration: 0.5, bounce: 0.25).delay(2), value: animationEnable)
                    }                        .onAppear() {
                        animationEnable.toggle()
                    }
                    
                }
                    .padding()
            }
            
            
            // Notification (if you wrong)
            HStack {
                Text("I think sound is still weired. Can you check for me again?")
                    .padding()
                    .background(Color.accentColor)
                //.offset(y: -2)
                    .foregroundStyle(Color.white)
                    .clipShape(.rect(cornerRadius: 20))

                Circle()
                    .frame(width: 50)
                    .overlay {
                        Image("Image Asset")
                            .resizable()
                            .offset(y: 20)
                            .frame(width: 70, height: 70)
                        
                    }
                    .clipShape(Circle())
            }                    .opacity(wrongAnimation ? 1 : 0)
                .scaleEffect(wrongAnimation ? 1 : 0.5)
                .offset(x: wrongAnimation ? 0 : 320)
                .animation(.spring(duration: 0.5, bounce: 0.25), value: wrongAnimation)
            
            
        }.sheet(isPresented: $sheetPresented, onDismiss: { 
            if (pianoIndex == 5) {
                skipPopUp = true
            }
        },content: {
            Section {
                if (pianoIndex < 3) {
                    VStack {
                        Text("Skip tutorial?")
                            .font(.largeTitle)
                        Image("Image Asset 1")
                            .resizable()
                            .scaledToFit()
                        Text("If you come to play for the first time, I recommended to continue with \"Tutorial\"")
                        Spacer()
                        HStack {
                            Button {
                                withAnimation(.spring()) {
                                    sheetPresented = false
                                    pianoIndex = 2
                                }
                            } label: {
                                Text("I'll tune myself")
                            }
                            Spacer()
                            Button {
                                skipTutorial = false
                                skipPopUp = false
                                sheetPresented = false
                            } label: {
                                Text("Go with tutorial")
                            }
                            .buttonStyle(.borderedProminent)
                        }
                    }.padding()
                } else if (pianoIndex == 5 || pianoIndex == 14 || (pianoIndex == 4 && skipTutorial)) {
                    TabView {
                        VStack(alignment: .leading) {
                            HStack {
                                Spacer()
                                Image("Image Asset 5").resizable().scaledToFit()
                                    .clipShape(.rect(cornerRadius: 20)).frame(maxWidth: .infinity, maxHeight: 400)
                                
                                Spacer()
                            }
                            Text("You can tap on left arrow\n(<-) to decrease pitch (-1 semitone) (reduce piano string tension).")
                                .bold()
                            Spacer()
                        }.padding()
                        VStack(alignment: .leading) {
                            HStack {
                                Spacer()
                                Image("Image Asset 6").resizable().scaledToFit()
                                    .clipShape(.rect(cornerRadius: 20)).frame(maxWidth: .infinity, maxHeight: 400)
                                
                                Spacer()
                            }
                            Text("You can tap on right arrow\n(->) to increase pitch (+1 semitone) (increase piano string tension).")
                                .bold()
                            Spacer()
                        }.padding()
                        VStack(alignment: .leading) {
                            HStack {
                                Spacer()
                                Image("Image Asset 7").resizable().scaledToFit()
                                    .clipShape(.rect(cornerRadius: 20)).frame(maxWidth: .infinity, maxHeight: 400)
                                
                                Spacer()
                            }
                            Text("You can press the key to listen current sound pitch.")
                                .bold()
                            Text("Be careful when pressing the keys on the piano. You may be pressing a different key from the one in which the tuning stick is inserted.")
                                .foregroundStyle(Color.yellow)
                            Spacer()
                        }.padding()
                        
                        VStack(alignment: .leading) {
                            HStack {
                                Spacer()
                                Image("Image Asset 8").resizable().scaledToFit()
                                    .clipShape(.rect(cornerRadius: 20)).frame(maxWidth: .infinity, maxHeight: 400)
                                
                                Spacer()
                            }
                            Text("If you don't know what the sound is, You can use hint (button above a piano) to listen what that sound actually is")
                                .bold()
                            
                            Spacer()
                        }.padding()
                        
                        VStack(alignment: .leading) {
                            HStack {
                                Spacer()
                                Image("Image Asset 9").resizable().scaledToFit()
                                    .clipShape(.rect(cornerRadius: 20)).frame(maxWidth: .infinity, maxHeight: 400)
                                
                                Spacer()
                            }
                            Text("Caution! Be careful of broken string. You have to increase or decrease string only 3 steps from the pitch of that string given.")
                                .bold()
                                .padding()
                                .foregroundStyle(Color.white)
                                .background(Color.red)
                                .clipShape(.rect(cornerRadius: 20))
                            
                            Text("Example in next page")
                            
                            Spacer()
                        }.padding()
                        
                        VStack(alignment: .leading) {
                            HStack {
                                Spacer()
                                Image("Image Asset 9").resizable().scaledToFit()
                                    .clipShape(.rect(cornerRadius: 20)).frame(maxWidth: .infinity, maxHeight: 200)
                                
                                Spacer()
                            }
                            Text("For example, I selected **\"C#\"** Key and current string sound pitch is **\"D\"** when I was tuning over 3 steps above from \"D\" **(1. D# -> 2. E -> 3. F)** the string was breaking on **\"F#\"**\n")
                            Text("If I tuning back (decrease from \"F\") **the limit of steps also decreased**\n\nSame way with tuning down.")
                            
                            Text("I selected **\"A\"** Key and current string sound pitch is **\"G\"** when I was tuning over 3 steps down from \"G\" **(1. F# -> 2. F -> 3. E)** the string was breaking on **\"D#\"**\n")
                            
                            Text("If I tuning up (increase from \"E\") **the limit of steps also decreased**")
                            
                            
                            Spacer()
                        }.padding()
                        
                        VStack(alignment: .leading) {
                            HStack {
                                Spacer()
                                Image("Image Asset 7").resizable().scaledToFit()
                                    .clipShape(.rect(cornerRadius: 20)).frame(maxWidth: .infinity, maxHeight: 200)
                                
                                Spacer()
                            }
                            Text("The goal of the game is to make every key on the piano sound exactly as it should.")
                                .bold()
                                .padding()
                                .foregroundStyle(Color.white)
                                .background(Color.accentColor)
                                .clipShape(.rect(cornerRadius: 20))
                            
                            Text("Don't worry if you gonna to break string. You might get a little scolded by customers :D\n\nYou can restart the game any time")
                            
                            
                            
                            Spacer()
                            
                            Button {
                                sheetPresented = false
                            } label: {
                                Label("Get start", systemImage: "tuningfork")
                                    .font(.title)
                                    .bold()
                                    .frame(maxWidth: .infinity)
                                    .padding(.vertical, 8)
                            }
                            .buttonStyle(.borderedProminent)
                            .padding()
                        }.padding()
                        
                        
                    }.tabViewStyle(.page)
                        .indexViewStyle(.page(backgroundDisplayMode: .always))
                        .padding(.bottom)
                    
                } else {
                    Text("Error... ")
                }
            }.interactiveDismissDisabled()
                
                
        })
    }
        
}

#Preview {
    PianoTuner(pageIndex: .constant(10))
}
