import SwiftUI

struct EarTrain: View {

    
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    @State private var animationEnable: Bool = false;
    @State private var pageIndex: Int = -2
    
    // Orientation detection
    @State private var isPortraitDetect: Bool = UIDevice.current.orientation.isPortrait
    
    // Device detection
    @State private var isPhone: Bool = UIDevice.current.userInterfaceIdiom == .phone ? true : false
    
    // true when preview on piano
    @State private var pagePhoneShuffle: Bool = false
    
    // shuffle camera between customer and tuner (bool)
    @State private var shuffleCamera: Bool = false
    
    private var chapter3: some View {
        VStack {
            HStack(alignment: .top) {
                Circle()
                    .frame(width: 50)
                    .overlay {
                        Image("Image Asset")
                            .resizable()
                            .offset(y: 20)
                            .frame(width: 70, height: 70)
                        
                    }
                    .clipShape(Circle())
                VStack(alignment: .leading) {
                    Text("Hello Piano tuner, My piano sound is weird!")
                    //.frame(maxWidth: pageIndex == 0 ? 500 : 10)
                        .foregroundStyle(Color.white)                    .multilineTextAlignment(.leading)
                        .padding()
                        .background(Color.accentColor)
                        .clipShape(.rect(cornerRadius: 20))
                        .opacity(animationEnable ? 1 : 0)
                        .scaleEffect(animationEnable ? 1 : 0.5)
                        .offset(x: animationEnable ? 0 : -320)
                        .animation(.spring(duration: 0.5, bounce: 0.25), value: animationEnable)
                        .onAppear() {
                            animationEnable = true
                        }
                    Text("I want to play but I can't stand listening")
                    //.frame(maxWidth: pageIndex == 0 ? 500 : 10)
                        .foregroundStyle(Color.white)                    .multilineTextAlignment(.leading)
                        .padding()
                        .background(Color.accentColor)
                        .clipShape(.rect(cornerRadius: 20))
                        .opacity(animationEnable ? 1 : 0)
                        .scaleEffect(animationEnable ? 1 : 0.5)
                        .offset(x: animationEnable ? 0 : -320)
                        .animation(.spring(duration: 0.5, bounce: 0.25).delay(1), value: animationEnable)
                    Text("Can you help me sir?")
                    //.frame(maxWidth: pageIndex == 0 ? 500 : 10)
                        .foregroundStyle(Color.white)                    .multilineTextAlignment(.leading)
                        .padding()
                        .background(Color.accentColor)
                        .clipShape(.rect(cornerRadius: 20))
                        .opacity(animationEnable ? 1 : 0)
                        .scaleEffect(animationEnable ? 1 : 0.5)
                        .offset(x: animationEnable ? 0 : -320)
                        .animation(.spring(duration: 0.5, bounce: 0.25).delay(2), value: animationEnable)
                    
                }
                
            }
            
            HStack(alignment: .top) {
                
                VStack(alignment: .trailing) {
                    Text("OK sir, send your house location and I'll come")
                    //.frame(maxWidth: pageIndex == 0 ? 500 : 10)
                        .foregroundStyle(Color.white)                    .multilineTextAlignment(.leading)
                        .padding()
                        .background(Color.secondary)
                        .clipShape(.rect(cornerRadius: 20))
                        .opacity(animationEnable ? 1 : 0)
                        .scaleEffect(animationEnable ? 1 : 0.5)
                        .offset(x: animationEnable ? 0 : 320)
                        .animation(.spring(duration: 0.5, bounce: 0.25).delay(3), value: animationEnable)
                       
                    
                }
                Circle()
                    .frame(width: 50)
                    .overlay {
                        Image("Image Asset 1")
                            .resizable()
                            .offset(y: 20)
                            .scaledToFit()
                            
                        
                    }
                    .clipShape(Circle())
                
            }
            Spacer()
            HStack {
                Spacer()
                Button {
                    withAnimation(.spring()) {
                        pageIndex += 1;
                        animationEnable = false
                    }
                } label: {
                    Label(
                        "Go to customer house", systemImage: "figure.walk")
                }
                .opacity(animationEnable ? 1 : 0)
                .scaleEffect(animationEnable ? 1 : 0.5)
                .offset(x: animationEnable ? 0 : 320)
                .animation(.spring(duration: 0.5, bounce: 0.25).delay(3), value: animationEnable)
            }
            .buttonStyle(.borderedProminent)
            
        }
    }
    
    private var chapter4: some View {
        ZStack(alignment: .bottom) {

            VStack(spacing: 0) {
                //Sky
                Rectangle()
                    .foregroundStyle(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.yellow]), startPoint: .top, endPoint: .bottom))
                    .overlay(alignment: .bottomTrailing) {
                        Image("Image Asset 2")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 400)
                            .offset(y: 30)
                    }
                
                // Ground
                Rectangle()
                    .foregroundStyle(Color.gray)
                    .frame(height: 80)
            }
            
            HStack {
                Image("Image Asset 1")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200)
                            .offset(x: animationEnable ? 0 : -320)
                VStack(alignment: .leading) {
                    Text("Ah yes finally I arrived!")
                    //.frame(maxWidth: pageIndex == 0 ? 500 : 10)
                        .foregroundStyle(Color.white)                    .multilineTextAlignment(.leading)
                        .padding()
                        .background(Color.gray)
                        .clipShape(.rect(cornerRadius: 20))
                        .opacity(animationEnable ? 1 : 0)
                        .scaleEffect(animationEnable ? 1 : 0.5)
                        .offset(x: animationEnable ? 0 : -320)
                        .animation(.spring(duration: 0.5, bounce: 0.25).delay(1.5), value: animationEnable)
                        .shadow(radius: 10)
                    
                    Text("Let's go inside")
                    //.frame(maxWidth: pageIndex == 0 ? 500 : 10)
                        .foregroundStyle(Color.white)                    .multilineTextAlignment(.leading)
                        .padding()
                        .background(Color.gray)
                        .clipShape(.rect(cornerRadius: 20))
                        .opacity(animationEnable ? 1 : 0)
                        .scaleEffect(animationEnable ? 1 : 0.5)
                        .offset(x: animationEnable ? 0 : -320)
                        .animation(.spring(duration: 0.5, bounce: 0.25).delay(3), value: animationEnable)
                        .shadow(radius: 10)
                    
                    Text("Tap me to Knock the door!")
                    //.frame(maxWidth: pageIndex == 0 ? 500 : 10)
                        .foregroundStyle(Color.white)                    .multilineTextAlignment(.leading)
                        .padding()
                        .background(Color.accentColor)
                        .clipShape(.rect(cornerRadius: 20))
                        .opacity(animationEnable ? 1 : 0)
                        .animation(.spring(duration: 0.5, bounce: 0.25).delay(4), value: animationEnable)
                        .scaleEffect(animationEnable ? 1 : 0.8)
                                            .animation(.spring(duration: 0.5, bounce: 0.25).repeatForever(), value: animationEnable)
                    
                        .shadow(radius: 10)
                        .onTapGesture {
                            withAnimation(.spring()) {
                                pageIndex = 4
                                animationEnable = false
                                            play(sound: "Soundfxknock.m4a")
                            }
                        }
                }.offset(y: -100)
            }
            //.opacity(animationEnable ? 1 : 0)
            //.scaleEffect(animationEnable ? 1 : 0.5)

            .animation(.easeInOut(duration: 1), value: animationEnable)
            .onAppear() {
                animationEnable = true
                            play(sound: "Soundfxwalking.m4a")
            }
            
            
        }
        .frame(maxHeight: .infinity)
    }
    
    private var chapter5: some View {
        ZStack(alignment: .bottom) {
            
            VStack(spacing: 0) {
                //Sky
                Rectangle()
                    .foregroundStyle(Color.brown)
                    .overlay(alignment: .bottom) {
                        Image("Image Asset 3")
                            .resizable()
                            .offset(y: 4)
                                                    .scaledToFit()
                            .frame(width: 350)
                    }
                
                // Ground
                Rectangle()
                    .foregroundStyle(Color.red)
                    .frame(height: 80)
            }
            
            HStack {
                VStack(alignment: .leading) {
                    Text("Yes, did you know? your house very close to my place!")
                    //.frame(maxWidth: pageIndex == 0 ? 500 : 10)
                        .foregroundStyle(Color.white)                    .multilineTextAlignment(.leading)
                        .padding()
                        .background(Color.gray)
                        .clipShape(.rect(cornerRadius: 20))
                        .opacity(animationEnable ? 1 : 0)
                        .scaleEffect(animationEnable ? 1 : 0.5)
                        .offset(x: animationEnable ? 0 : -320)
                        .animation(.spring(duration: 0.5, bounce: 0.25).delay(3), value: animationEnable)
                        .shadow(radius: 10)
                    
                    Text("OK, Let me checking for you. You can do anything else while I am checking")
                    //.frame(maxWidth: pageIndex == 0 ? 500 : 10)
                        .foregroundStyle(Color.white)                    .multilineTextAlignment(.leading)
                        .padding()
                        .background(Color.gray)
                        .clipShape(.rect(cornerRadius: 20))
                        .opacity(animationEnable ? 1 : 0)
                        .scaleEffect(animationEnable ? 1 : 0.5)
                        .offset(x: animationEnable ? 0 : -320)
                        .animation(.spring(duration: 0.5, bounce: 0.25).delay(9), value: animationEnable)
                        .shadow(radius: 10)
                    
                    Text("Tap me to Check up the piano")
                    //.frame(maxWidth: pageIndex == 0 ? 500 : 10)
                        .foregroundStyle(Color.white)                    .multilineTextAlignment(.leading)
                        .padding()
                        .background(Color.accentColor)
                        .clipShape(.rect(cornerRadius: 20))
                        .opacity(animationEnable ? 1 : 0)
                        .animation(.spring(duration: 0.5, bounce: 0.25).delay(10), value: animationEnable)
                        .scaleEffect(animationEnable ? 1 : 0.8)
                        .animation(.spring(duration: 0.5, bounce: 0.25).repeatForever(), value: animationEnable)
                    
                        .shadow(radius: 10)
                        .onTapGesture {
                            withAnimation(.spring()) {
                                pageIndex = 5
                                animationEnable.toggle()
                            }
                        }
                    
                    Image("Image Asset 1")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300)
                        .offset(x: animationEnable ? 0 : -320)
                }
                .padding()

            
                
                VStack(alignment: .trailing) {
                    Text("Good evening, Piano Tuner. You arrived too fast!")
                    //.frame(maxWidth: pageIndex == 0 ? 500 : 10)
                        .foregroundStyle(Color.white)                    .multilineTextAlignment(.leading)
                        .padding()
                        .background(Color.accentColor)
                        .clipShape(.rect(cornerRadius: 20))
                        .opacity(animationEnable ? 1 : 0)
                        .scaleEffect(animationEnable ? 1 : 0.5)
                        .offset(x: animationEnable ? 0 : 320)
                        .animation(.spring(duration: 0.5, bounce: 0.25).delay(1.5), value: animationEnable)
                        .shadow(radius: 10)
                    
                    Text("Oh wow! so I want you to check my piano")
                    //.frame(maxWidth: pageIndex == 0 ? 500 : 10)
                        .foregroundStyle(Color.white)                    .multilineTextAlignment(.leading)
                        .padding()
                        .background(Color.accentColor)
                        .clipShape(.rect(cornerRadius: 20))
                        .opacity(animationEnable ? 1 : 0)
                        .scaleEffect(animationEnable ? 1 : 0.5)
                        .offset(x: animationEnable ? 0 : 320)
                        .animation(.spring(duration: 0.5, bounce: 0.25).delay(5), value: animationEnable)
                        .shadow(radius: 10)
                    
                    Text("Those sound are so weired!. Can you help?")
                    //.frame(maxWidth: pageIndex == 0 ? 500 : 10)
                        .foregroundStyle(Color.white)                    .multilineTextAlignment(.leading)
                        .padding()
                        .background(Color.accentColor)
                        .clipShape(.rect(cornerRadius: 20))
                        .opacity(animationEnable ? 1 : 0)
                        .scaleEffect(animationEnable ? 1 : 0.5)
                        .offset(x: animationEnable ? 0 : 320)
                        .animation(.spring(duration: 0.5, bounce: 0.25).delay(7), value: animationEnable)
                        .shadow(radius: 10)
                    
                    Image("Image Asset")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 400)
                }.padding()
                
            }
            //.opacity(animationEnable ? 1 : 0)
            //.scaleEffect(animationEnable ? 1 : 0.5)
            
            .animation(.easeInOut(duration: 1), value: animationEnable)
            .onAppear() {
                animationEnable = true
                
                
            }
            .task {
                if (isPhone) {
                    withAnimation(.spring()) {
                        shuffleCamera = true
                    }
                    try? await Task.sleep(nanoseconds: UInt64(2.8) * 1_000_000_000)
//                    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                        withAnimation(.spring()) {
                            shuffleCamera = false
                        }
//                    }
                    
                    try? await Task.sleep(nanoseconds: UInt64(3.95) * 1_000_000_000)
                    
//                    DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                        withAnimation(.spring()) {
                            shuffleCamera = true
                        }
//                    }
                    
                    try? await Task.sleep(nanoseconds: UInt64(3.95) * 1_000_000_000)
                    
//                    DispatchQueue.main.asyncAfter(deadline: .now() + 9) {
                        withAnimation(.spring()) {
                            shuffleCamera = false
                        }
//                    }
                }
            }
            
            
        }
        
        .offset(x: shuffleCamera ? -370 : 0)
        .frame(maxHeight: .infinity)
    }
    
    private var chapter6: some View {
        ZStack(alignment: .bottom) {
            
            VStack(spacing: 0) {
                //Sky
                Rectangle()
                    .foregroundStyle(Color.brown)
                    .overlay(alignment: .bottom) {
                        Image("Image Asset 3")
                            .resizable()
                            .offset(y: 4)
                            .scaledToFit()
                            .frame(width: 350)
                    }
                
                // Ground
                Rectangle()
                    .foregroundStyle(Color.red)
                    .frame(height: 80)
            }
            
            HStack {
                VStack(alignment: .leading) {
                    Text("You're welcome! enjoy your piano.")
                    //.frame(maxWidth: pageIndex == 0 ? 500 : 10)
                        .foregroundStyle(Color.white)                    .multilineTextAlignment(.leading)
                        .padding()
                        .background(Color.gray)
                        .clipShape(.rect(cornerRadius: 20))
                        .opacity(animationEnable ? 1 : 0)
                        .scaleEffect(animationEnable ? 1 : 0.5)
                        .offset(x: animationEnable ? 0 : -320)
                        .animation(.spring(duration: 0.5, bounce: 0.25).delay(2), value: animationEnable)
                        .shadow(radius: 10)
                    
                    Text("5 Thousand Dollars.")
                    //.frame(maxWidth: pageIndex == 0 ? 500 : 10)
                        .foregroundStyle(Color.white)                    .multilineTextAlignment(.leading)
                        .padding()
                        .background(Color.gray)
                        .clipShape(.rect(cornerRadius: 20))
                        .opacity(animationEnable ? 1 : 0)
                        .scaleEffect(animationEnable ? 1 : 0.5)
                        .offset(x: animationEnable ? 0 : -320)
                        .animation(.spring(duration: 0.5, bounce: 0.25).delay(4.5), value: animationEnable)
                        .shadow(radius: 10)
                    
                    Text("Next round try to not using hint to practice your hearing skill!")
                    //.frame(maxWidth: pageIndex == 0 ? 500 : 10)
                        .foregroundStyle(Color.white)                    .multilineTextAlignment(.leading)
                        .padding()
                        .background(Color.gray)
                        .clipShape(.rect(cornerRadius: 20))
                        .opacity(animationEnable ? 1 : 0)
                        .scaleEffect(animationEnable ? 1 : 0.5)
                        .offset(x: animationEnable ? 0 : -320)
                        .animation(.spring(duration: 0.5, bounce: 0.25).delay(6), value: animationEnable)
                        .shadow(radius: 10)
                    
                    
                    
                    Image("Image Asset 1")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300)
                        .offset(x: animationEnable ? 0 : -320)
                }
                
                
                
                
                VStack(alignment: .trailing) {
                    Text("Oh! Thank you!!")
                    //.frame(maxWidth: pageIndex == 0 ? 500 : 10)
                        .foregroundStyle(Color.white)                    .multilineTextAlignment(.leading)
                        .padding()
                        .background(Color.accentColor)
                        .clipShape(.rect(cornerRadius: 20))
                        .opacity(animationEnable ? 1 : 0)
                        .scaleEffect(animationEnable ? 1 : 0.5)
                        .offset(x: animationEnable ? 0 : 320)
                        .animation(.spring(duration: 0.5, bounce: 0.25).delay(1.5), value: animationEnable)
                        .shadow(radius: 10)
                    
                    Text("How much is this?")
                    //.frame(maxWidth: pageIndex == 0 ? 500 : 10)
                        .foregroundStyle(Color.white)                    .multilineTextAlignment(.leading)
                        .padding()
                        .background(Color.accentColor)
                        .clipShape(.rect(cornerRadius: 20))
                        .opacity(animationEnable ? 1 : 0)
                        .scaleEffect(animationEnable ? 1 : 0.5)
                        .offset(x: animationEnable ? 0 : 320)
                        .animation(.spring(duration: 0.5, bounce: 0.25).delay(3), value: animationEnable)
                        .shadow(radius: 10)
                    
                    Text("HUHHHHHHH!!!??")
                    //.frame(maxWidth: pageIndex == 0 ? 500 : 10)
                        .foregroundStyle(Color.white)                    .multilineTextAlignment(.leading)
                        .padding()
                        .background(Color.accentColor)
                        .clipShape(.rect(cornerRadius: 20))
                        .opacity(animationEnable ? 1 : 0)
                        .scaleEffect(animationEnable ? 1 : 0.5)
                        .offset(x: animationEnable ? 0 : 320)
                        .animation(.spring(duration: 0.5, bounce: 0.25).delay(5), value: animationEnable)
                        .shadow(radius: 10)
                    
                    Image("Image Asset")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 400)
                }
                
            }.padding()
            //.opacity(animationEnable ? 1 : 0)
            //.scaleEffect(animationEnable ? 1 : 0.5)
            
            .animation(.easeInOut(duration: 1), value: animationEnable)
            .onAppear() {
                animationEnable = false
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
                    animationEnable = true
                }
            }
            
            HStack {
                Button {
                    withAnimation(.spring()) {
                        pageIndex = 5
                        animationEnable = false
                    }
                } label: {
                    Label("Find new customer", systemImage: "eyes")
                }
                .buttonStyle(.borderedProminent)
                .opacity(animationEnable ? 1 : 0)
                .scaleEffect(animationEnable ? 1 : 0.5)
                .offset(x: animationEnable ? 0 : -320)
                .animation(.spring(duration: 0.5, bounce: 0.25).delay(6.5), value: animationEnable)
                Spacer()
                Text("You reached to the end!")
//                Button {
//                    withAnimation(.spring()) {
//                        pageIndex = 1
//                    }
//                } label: {
//                    Label("Explore another games!", systemImage: "ear")
//                }
                .buttonStyle(.borderedProminent)
            }.padding()
            
            
        }
        .frame(maxHeight: .infinity)
        .task {
            if (isPhone) {
                withAnimation(.spring()) {
                    shuffleCamera = false
                }
                try? await Task.sleep(nanoseconds: UInt64(3) * 1_000_000_000)
//                    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    withAnimation(.spring()) {
                        shuffleCamera = true
                    }
//                    }
                
                try? await Task.sleep(nanoseconds: UInt64(2) * 1_000_000_000)
                
//                    DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                    withAnimation(.spring()) {
                        shuffleCamera = false
                    }
//                    }
                
                try? await Task.sleep(nanoseconds: UInt64(1) * 1_000_000_000)
                
//                    DispatchQueue.main.asyncAfter(deadline: .now() + 9) {
                    withAnimation(.spring()) {
                        shuffleCamera = true
                    }
//                    }
                
                try? await Task.sleep(nanoseconds: UInt64(1.5) * 1_000_000_000)
                
                withAnimation(.spring()) {
                    shuffleCamera = false
                }
            }
        }
        .offset(x: shuffleCamera ? -330 : 0)
    }
    
    private var instruction1: some View {
        VStack(alignment: .center) {
            Spacer()
            HStack {
                Image("Image Asset 1")
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: 300)
                VStack(alignment: .leading) {
                    Text("Piano Tuner")
                        .font(.largeTitle)
                        .bold()
                    Text("You're \"Piano Tuner\" a job that very important to every pianist. You should go to tuning piano and avoid break the string!")
                }
            }.frame(maxWidth: 500)
            Spacer()
            Text("Before we get start, Apologies in advance for incompatible UI and layout for some small device such as iPhone SE and iPhone mini series. I recommended you to use iPad in Landscape mode to get the best experience but iPhone that larger than 6.1 inch will fit perfectly.\n")
                .italic()
                .bold()
            Spacer()
            HStack {
                Spacer()
                Button {
                    withAnimation(.spring()) {
                        pageIndex += 1
                        animationEnable = false
                    }
                } label: {
                    Label("Start as Piano Tuner", systemImage: "tuningfork")
                }
                .buttonStyle(.borderedProminent)
            }
        }.frame(maxWidth: .infinity)
            
    }
    
    private var instruction2: some View {
        VStack(alignment: .leading) {
            Spacer()
            Text("Before you go to tuning piano...")
                .frame(maxWidth: .infinity)
                .font(.largeTitle)
       
            .bold()
        
        VStack(alignment: .leading) {
            Text("Before going to work, let telling about some fact in this game.")
            //.frame(maxWidth: pageIndex == 0 ? 500 : 10)
                .foregroundStyle(Color.white)                    .multilineTextAlignment(.leading)
                .padding()
                .background(Color.accentColor)
                .clipShape(.rect(cornerRadius: 20))
                .opacity(animationEnable ? 1 : 0)
                .scaleEffect(animationEnable ? 1 : 0.5)
                .offset(x: animationEnable ? 0 : -320)
                .animation(.spring(duration: 0.5, bounce: 0.25), value: animationEnable)
                .onAppear() {
                    animationEnable.toggle()
                }
            
            
            Text("Piano Tuner game can practice your note hearing skills (Ear Training) 👂🎵")
            //.frame(maxWidth: pageIndex == 0 ? 500 : 10)
                .foregroundStyle(Color.white)                    .multilineTextAlignment(.leading)
                .padding()
                .background(Color.accentColor)
                .clipShape(.rect(cornerRadius: 20))
                .opacity(animationEnable ? 1 : 0)
                .scaleEffect(animationEnable ? 1 : 0.5)
                .offset(x: animationEnable ? 0 : -320)
                .animation(.spring(duration: 0.5, bounce: 0.25).delay(1), value: animationEnable)
            
            Text("You have to tune a piano that has been played many times, and the pitch of each keys on every round that you go to tune is random 🎹")
            //.frame(maxWidth: pageIndex == 0 ? 500 : 10)
                .foregroundStyle(Color.white)                    .multilineTextAlignment(.leading)
                .padding()
                .background(Color.accentColor)
                .clipShape(.rect(cornerRadius: 20))
                .opacity(animationEnable ? 1 : 0)
                .scaleEffect(animationEnable ? 1 : 0.5)
                .offset(x: animationEnable ? 0 : -320)
                .animation(.spring(duration: 0.5, bounce: 0.25).delay(2), value: animationEnable)
            Text("Also, type of piano that you encounter is also random. In this game, we have 2 type of pianos.")
            //.frame(maxWidth: pageIndex == 0 ? 500 : 10)
                .foregroundStyle(Color.white)                    .multilineTextAlignment(.leading)
                .padding()
                .background(Color.accentColor)
                .clipShape(.rect(cornerRadius: 20))
                .opacity(animationEnable ? 1 : 0)
                .scaleEffect(animationEnable ? 1 : 0.5)
                .offset(x: animationEnable ? 0 : -320)
                .animation(.spring(duration: 0.5, bounce: 0.25).delay(3), value: animationEnable)
            
            Spacer()
            HStack {
                Spacer()
                Button {
                    withAnimation(.spring()) {
                        pageIndex += 1
                        animationEnable = false
                    }
                } label: {    
                    Label("Next", systemImage: "arrow.right")
                }
                .buttonStyle(.borderedProminent)
            }
            
        }
             }.padding()
    }
    
    private var instruction3: some View {
        VStack(alignment: .leading) {
            
            Text("We have 2 types of piano")
                .frame(maxWidth: .infinity)
                .font(.largeTitle)
            
                .bold()
            
            if isPhone {
                //VStack {
                    if (pagePhoneShuffle) {
                        Group {
                            PianoUpright(returnKey: .constant([]), showSymbol: .constant(true), stringBreak: .constant(-1), tunerStickHas: .constant(false), coverFrontState: .constant(true), eachKey: .constant([0,1,2,3,4,5,6,7,8,9,10,11]), tunerPutOn: .constant(-1), skipTutorial: .constant(true), pianoIndex: .constant(3), octaveRandomBool: .constant(true))
                                .scaledToFill()
                                .ignoresSafeArea()
                        }
                        Spacer()
                        HStack {
                            Button {
                                withAnimation(.spring()) {
                                    pagePhoneShuffle = false
                                }
                            } label: {
                                Label("Back", systemImage: "arrow.left")
                            }
                            Spacer()
                            Button {
                                withAnimation(.spring()) {
                                    pageIndex += 1
                                    animationEnable = false
                                    pagePhoneShuffle = false
                                }
                            } label: {
                                Label("Next", systemImage: "arrow.right")
                            }
                            .buttonStyle(.borderedProminent)
                            
                        }
                        
                    } else {
                        VStack(alignment: .leading) {
                            Text("First one is 'HearPiano Model-A'. This piano sound is in range of middle c to middle b (C3 to B3)")
                            //.frame(maxWidth: pageIndex == 0 ? 500 : 10)
                                .foregroundStyle(Color.white)                    .multilineTextAlignment(.leading)
                                .padding()
                                .background(Color.accentColor)
                                .clipShape(.rect(cornerRadius: 20))
                                .opacity(animationEnable ? 1 : 0)
                                .scaleEffect(animationEnable ? 1 : 0.5)
                                .offset(x: animationEnable ? 0 : -320)
                                .animation(.spring(duration: 0.5, bounce: 0.25), value: animationEnable)
                                .onAppear() {
                                    animationEnable = true
                                }
                            Text("Try to press the key to listen the sound!")
                            //.frame(maxWidth: pageIndex == 0 ? 500 : 10)
                                .foregroundStyle(Color.white)                    .multilineTextAlignment(.leading)
                                .padding()
                                .background(Color.accentColor)
                                .clipShape(.rect(cornerRadius: 20))
                                .opacity(animationEnable ? 1 : 0)
                                .scaleEffect(animationEnable ? 1 : 0.5)
                                .offset(x: animationEnable ? 0 : -320)
                                .animation(.spring(duration: 0.5, bounce: 0.25).delay(1), value: animationEnable)
                            Spacer()
                            HStack {
                                Spacer()
                                Button {
                                    withAnimation(.spring()) {
                                        pagePhoneShuffle = true
                                        
                                    }
                                } label: {
                                    Label("Try Piano", systemImage: "arrow.right")
                                }
                                .buttonStyle(.borderedProminent)
                            }
                        }
                        
                    
                
                        
                    }
                //}
            } else {
                VStack(alignment: .leading) {
                    HStack {
                        PianoUpright(returnKey: .constant([]), showSymbol: .constant(true), stringBreak: .constant(-1), tunerStickHas: .constant(false), coverFrontState: .constant(true), eachKey: .constant([0,1,2,3,4,5,6,7,8,9,10,11]), tunerPutOn: .constant(-1), skipTutorial: .constant(true), pianoIndex: .constant(3), octaveRandomBool: .constant(true))
                        VStack(alignment: .trailing) {
                            Text("First one is 'HearPiano Model-A'. This piano sound is in range of middle c to middle b (C3 to B3)")
                            //.frame(maxWidth: pageIndex == 0 ? 500 : 10)
                                .foregroundStyle(Color.white)                    .multilineTextAlignment(.leading)
                                .padding()
                                .background(Color.accentColor)
                                .clipShape(.rect(cornerRadius: 20))
                                .opacity(animationEnable ? 1 : 0)
                                .scaleEffect(animationEnable ? 1 : 0.5)
                                .offset(x: animationEnable ? 0 : -320)
                                .animation(.spring(duration: 0.5, bounce: 0.25), value: animationEnable)
                                .onAppear() {
                                    animationEnable.toggle()
                                }
                            Text("Try to press the key to listen the sound!")
                            //.frame(maxWidth: pageIndex == 0 ? 500 : 10)
                                .foregroundStyle(Color.white)                    .multilineTextAlignment(.leading)
                                .padding()
                                .background(Color.accentColor)
                                .clipShape(.rect(cornerRadius: 20))
                                .opacity(animationEnable ? 1 : 0)
                                .scaleEffect(animationEnable ? 1 : 0.5)
                                .offset(x: animationEnable ? 0 : -320)
                                .animation(.spring(duration: 0.5, bounce: 0.25).delay(1), value: animationEnable)
                            HStack {
                                Spacer()
                                Button {
                                    withAnimation(.spring()) {
                                        pageIndex += 1
                                        animationEnable = false
                                        pagePhoneShuffle = false
                                    }
                                } label: {
                                    Label("Next", systemImage: "arrow.right")
                                }
                                .buttonStyle(.borderedProminent)
                            }
                        }
                        
                    }
                    Spacer()
                    
                }
            }
        }.padding()
    }
    
    private var instruction4: some View {
        VStack(alignment: .leading) {
            
            Text("We have 2 types of piano")
                .frame(maxWidth: .infinity)
                .font(.largeTitle)
            
                .bold()
            
            if isPhone {
                //VStack {
                    if (pagePhoneShuffle) {
                        Group {
                            PianoUpright(returnKey: .constant([]), showSymbol: .constant(true), stringBreak: .constant(-1), tunerStickHas: .constant(false), coverFrontState: .constant(true), eachKey: .constant([0,1,2,3,4,5,6,7,8,9,10,11]), tunerPutOn: .constant(-1), skipTutorial: .constant(true), pianoIndex: .constant(3), octaveRandomBool: .constant(false))
                                .scaledToFill()
                                .ignoresSafeArea()
                        }
                        Spacer()
                        HStack {
                            Button {
                                withAnimation(.spring()) {
                                    pagePhoneShuffle = false
                                }
                            } label: {
                                Label("Back", systemImage: "arrow.left")
                            }
                            Spacer()
                            Button {
                                withAnimation(.spring()) {
                                    pageIndex += 1
                                    animationEnable = false
                                }
                            } label: {
                                Label("Am ready!", systemImage: "arrow.right")
                            }
                            .buttonStyle(.borderedProminent)
                            
                        }
                        
                    } else {
                        VStack(alignment: .leading) {
                            Text("And the last one is 'HearPiano Model-B'. This piano sound is in range of higher c to higher b (C4 to B4)")
                            //.frame(maxWidth: pageIndex == 0 ? 500 : 10)
                                .foregroundStyle(Color.white)                    .multilineTextAlignment(.leading)
                                .padding()
                                .background(Color.accentColor)
                                .clipShape(.rect(cornerRadius: 20))
                                .opacity(animationEnable ? 1 : 0)
                                .scaleEffect(animationEnable ? 1 : 0.5)
                                .offset(x: animationEnable ? 0 : -320)
                                .animation(.spring(duration: 0.5, bounce: 0.25), value: animationEnable)
                                .onAppear() {
                                    animationEnable = true
                                }
                            Text("Try to press the key to listen the sound!")
                            //.frame(maxWidth: pageIndex == 0 ? 500 : 10)
                                .foregroundStyle(Color.white)                    .multilineTextAlignment(.leading)
                                .padding()
                                .background(Color.accentColor)
                                .clipShape(.rect(cornerRadius: 20))
                                .opacity(animationEnable ? 1 : 0)
                                .scaleEffect(animationEnable ? 1 : 0.5)
                                .offset(x: animationEnable ? 0 : -320)
                                .animation(.spring(duration: 0.5, bounce: 0.25).delay(1), value: animationEnable)
                            Text("Are you ready to tuning piano?")
                            //.frame(maxWidth: pageIndex == 0 ? 500 : 10)
                                .foregroundStyle(Color.white)                    .multilineTextAlignment(.leading)
                                .padding()
                                .background(Color.accentColor)
                                .clipShape(.rect(cornerRadius: 20))
                                .opacity(animationEnable ? 1 : 0)
                                .scaleEffect(animationEnable ? 1 : 0.5)
                                .offset(x: animationEnable ? 0 : -320)
                                .animation(.spring(duration: 0.5, bounce: 0.25).delay(2), value: animationEnable)
                            Spacer()
                            HStack {
                                Spacer()
                                Button {
                                    withAnimation(.spring()) {
                                        pagePhoneShuffle = true
                                    }
                                } label: {
                                    Label("Try Piano", systemImage: "arrow.right")
                                }
                                .buttonStyle(.borderedProminent)
                            }
                        }
                        
                    
                
                        
                    }
                //}
            } else {
                VStack(alignment: .leading) {
                    HStack {
                        PianoUpright(returnKey: .constant([]), showSymbol: .constant(true), stringBreak: .constant(-1), tunerStickHas: .constant(false), coverFrontState: .constant(true), eachKey: .constant([0,1,2,3,4,5,6,7,8,9,10,11]), tunerPutOn: .constant(-1), skipTutorial: .constant(true), pianoIndex: .constant(3), octaveRandomBool: .constant(false))
                        VStack(alignment: .trailing) {
                            Text("And the last one is 'HearPiano Model-B'. This piano sound is in range of higher c to higher b (C4 to B4)")
                            //.frame(maxWidth: pageIndex == 0 ? 500 : 10)
                                .foregroundStyle(Color.white)                    .multilineTextAlignment(.leading)
                                .padding()
                                .background(Color.accentColor)
                                .clipShape(.rect(cornerRadius: 20))
                                .opacity(animationEnable ? 1 : 0)
                                .scaleEffect(animationEnable ? 1 : 0.5)
                                .offset(x: animationEnable ? 0 : -320)
                                .animation(.spring(duration: 0.5, bounce: 0.25), value: animationEnable)
                                .onAppear() {
                                    animationEnable.toggle()
                                }
                            Text("Try to press the key to listen the sound!")
                            //.frame(maxWidth: pageIndex == 0 ? 500 : 10)
                                .foregroundStyle(Color.white)                    .multilineTextAlignment(.leading)
                                .padding()
                                .background(Color.accentColor)
                                .clipShape(.rect(cornerRadius: 20))
                                .opacity(animationEnable ? 1 : 0)
                                .scaleEffect(animationEnable ? 1 : 0.5)
                                .offset(x: animationEnable ? 0 : -320)
                                .animation(.spring(duration: 0.5, bounce: 0.25).delay(1), value: animationEnable)
                            Text("Are you ready to tuning piano?")
                            //.frame(maxWidth: pageIndex == 0 ? 500 : 10)
                                .foregroundStyle(Color.white)                    .multilineTextAlignment(.leading)
                                .padding()
                                .background(Color.accentColor)
                                .clipShape(.rect(cornerRadius: 20))
                                .opacity(animationEnable ? 1 : 0)
                                .scaleEffect(animationEnable ? 1 : 0.5)
                                .offset(x: animationEnable ? 0 : -320)
                                .animation(.spring(duration: 0.5, bounce: 0.25).delay(2), value: animationEnable)
                            HStack {
                                Spacer()
                                Button {
                                    withAnimation(.spring()) {
                                        pageIndex += 1
                                        animationEnable = false
                                    }
                                } label: {
                                    Label("Am ready!", systemImage: "arrow.right")
                                }
                                .buttonStyle(.borderedProminent)
                            }
                        }
                        
                    }
                    Spacer()
                    
                }
            }
        }.padding()
    }
    
    
    
    var body: some View {
        
        GeometryReader {
            geometry in 
            Section {
                switch(pageIndex) {
                case -2:
                    AnyView(instruction1)
                        .padding()
                case -1:
                    AnyView(instruction2)
                        .padding()
                case 0:
                    AnyView(instruction3)
                        .padding()
                case 1:
                    AnyView(instruction4)
                        .padding()
                case 2:
                    AnyView(chapter3)
                                    .padding()
                case 3:
                    AnyView(chapter4)
                case 4:
                    AnyView(chapter5)
                case 5:
                    PianoTuner(pageIndex: $pageIndex)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                case 6:
                    AnyView(chapter6)
                default:
                    AnyView(instruction1)
                }
            }
                .transition(.move(edge: .leading))
        }
    }
}


#Preview {
    EarTrain()
}

