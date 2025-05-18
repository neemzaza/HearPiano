import SwiftUI
import Subsonic

struct WelcomeScreen: View {
    @Environment(\.horizontalSizeClass) var horizontalSizeClass

    @State private var mainPageIndex: Int = 0;
    
    @State private var spinAnimate: Bool = false
    @State private var getStarted: Bool = false
    
    @State private var pauseSession: Bool = false

    // Device detection
    @State private var isPhone: Bool = UIDevice.current.userInterfaceIdiom == .phone ? true : false
    
    let layout = UIDevice.current.userInterfaceIdiom == .phone ? AnyLayout(VStackLayout()) : AnyLayout(HStackLayout())
    
    private var welcomePage: some View {
        return ZStack {
            Rectangle()
                .foregroundStyle(AngularGradient(gradient: Gradient(colors: [Color.orange.opacity(0.5), Color.green.opacity(0.5),Color.accentColor.opacity(0.75)]), center: .center, angle: Angle(degrees: spinAnimate ? 0 : 360)))
                .blur(radius: 100)
                .animation(.linear.speed(0.05).repeatForever(), value: spinAnimate)
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Image("Logo")
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: 350)
                        .opacity(spinAnimate ? 1 : 0)
                        .scaleEffect(spinAnimate ? 1 : 0.5)
                        .offset(y: spinAnimate ? 0 : 320)
                        .animation(.spring(duration: 0.5, bounce: 0.25), value: spinAnimate)
                    
                    Spacer()
                }
                layout {
                    Spacer()
                    Text("Want to get ear training by playing our interesting game? 🤔")
                        .opacity(spinAnimate ? 1 : 0)
                        .offset(y: spinAnimate ? 0 : 320)
                        .blur(radius: spinAnimate ? 0 : 10)
                        .animation(.spring(duration: 0.5, bounce: 0.15).delay(1), value: spinAnimate)
                        .padding()
                        .multilineTextAlignment(.trailing)
                        .onAppear() {
                            play(sound:"cnote.wav")
                            
                            play(sound:"e.wav")
                            
                            
                            
                            play(sound:"g.wav")
                            
                            
                            
                            play(sound:"c5.wav")
                            
                        }
                    Spacer()
                    Text("Go to play HearPiano Game now! 🎶")
                        .opacity(spinAnimate ? 1 : 0)
                        .offset(y: spinAnimate ? 0 : 320)
                        .blur(radius: spinAnimate ? 0 : 10)
                        .animation(.spring(duration: 0.5, bounce: 0.15).delay(2), value: spinAnimate)
                        .padding()
                    Spacer()
                }
                Spacer()
                Text("Welcome to HearPiano")
                    .font(.largeTitle)
                    .bold()
                    .opacity(spinAnimate ? 1 : 0)
                    .scaleEffect(spinAnimate ? 1 : 0.5)
                    .offset(y: spinAnimate ? 0 : 320)
                    .animation(.spring(duration: 0.5, bounce: 0.25).delay(3), value: spinAnimate)
                Text("iPad in landscape orientation is recommeded. but now some iPhone supported! (Portrait mode)")
                    .opacity(spinAnimate ? 0.5 : 0)
                    .animation(.spring(duration: 0.5, bounce: 0.25).delay(3.75), value: spinAnimate)
                    .multilineTextAlignment(.center)
                HStack {
                    Spacer()
                    Button {
                        withAnimation(.spring()) {
                            mainPageIndex += 1
                            spinAnimate = false
                            
                        }
                    } label: {
                        Label("Get start!", systemImage: "play.fill")
                            .font(.title)
                            .bold()
                            .padding()
                    }.buttonStyle(.borderedProminent)
                        .opacity(spinAnimate ? 1 : 0)
                        .scaleEffect(spinAnimate ? 1 : 0.5)
                        .offset(y: spinAnimate ? 0 : 320)
                        .animation(.spring(duration: 0.5, bounce: 0.25).delay(4), value: spinAnimate)
                    Spacer()
                }
                Spacer()
                Button {
                    withAnimation(.spring()) {
                        mainPageIndex = -1
                    }
                } label: {
                    Label("Home", systemImage: "house.fill")
                    //                        .foregroundStyle(Color.gray)
                }
                .opacity(spinAnimate ? 1 : 0)
                .scaleEffect(spinAnimate ? 1 : 0.5)
                .offset(y: spinAnimate ? 0 : 320)
                .animation(.spring(duration: 0.5, bounce: 0.25).delay(4.5), value: spinAnimate)
                Spacer()
            }
        }
        .clipped()
        .onAppear() {
            spinAnimate = true
        }
    }
    
    private var introductionPage: some View {
        return VStack(alignment: .leading) {
            Spacer()
            Text("Nice to meet you in HearPiano")
                .frame(maxWidth: .infinity)
                .font(.largeTitle)
                .bold()
            
            VStack(alignment: .leading) {
                Text("Hello Everyone! 👋 'HearPiano' is an app that can help you get ear training by playing our interesting game!")
                //.frame(maxWidth: pageIndex == 0 ? 500 : 10)
                    .foregroundStyle(Color.white)                    .multilineTextAlignment(.leading)
                    .padding()
                    .background(Color.accentColor)
                    .clipShape(.rect(cornerRadius: 20))
                    .opacity(spinAnimate ? 1 : 0)
                    .scaleEffect(spinAnimate ? 1 : 0.5)
                    .offset(x: spinAnimate ? 0 : -320)
                    .animation(.spring(duration: 0.5, bounce: 0.25), value: spinAnimate)
                    .onAppear() {
                        spinAnimate.toggle()
                    }
                
                
                Text("If you want to know what is that game, You can start by pressing 'Start' button")
                //.frame(maxWidth: pageIndex == 0 ? 500 : 10)
                    .foregroundStyle(Color.white)                    .multilineTextAlignment(.leading)
                    .padding()
                    .background(Color.accentColor)
                    .clipShape(.rect(cornerRadius: 20))
                    .opacity(spinAnimate ? 1 : 0)
                    .scaleEffect(spinAnimate ? 1 : 0.5)
                    .offset(x: spinAnimate ? 0 : -320)
                    .animation(.spring(duration: 0.5, bounce: 0.25).delay(2), value: spinAnimate)
                
                Spacer()
                HStack {
                    Spacer()
                    Label("Turn on your speaker and get start with us by pressing \"Start\"", systemImage: "speaker.wave.2")
                }
                HStack {
                    Spacer()
                    Button {
                        withAnimation(.spring()) {
                            mainPageIndex += 1
                        }
                    } label: {
                        Label("Start", systemImage: "arrow.right")
                    }
                    .buttonStyle(.borderedProminent)
                }
                
            }
        }.padding()
    }
    
    var body: some View {
        Group {
            switch(mainPageIndex) {
            case -1:
                ContentView()
                    .transition(.slide)
            case 0:
                welcomePage
                    .transition(.move(edge: .leading))
            case 1:
                ZStack(alignment: .topLeading) {
                    introductionPage
                        .padding(.top, 40)
                        .transition(.move(edge: .leading))
                    Button {
                        withAnimation(.spring()) {
                            pauseSession = true
                        }
                    } label: {
                        Circle()
                            .frame(width: 45)
                            .overlay {
                                Image(systemName: "house.fill")
                                    .foregroundStyle(Color.white)
                            }
                    }
                    .padding()
                }
            case 2:
                ZStack(alignment: .topLeading) {
                    EarTrain()
                    //                        .padding(.top, 40)
                        .transition(.move(edge: .leading))
                    Button {
                        withAnimation(.spring()) {
                            pauseSession = true
                        }
                    } label: {
                        Circle()
                            .frame(width: 45)
                            .overlay {
                                Image(systemName: "house.fill")
                                    .foregroundStyle(Color.white)
                            }
                    }
                    .padding()
                }
            default:
                welcomePage
            }
        }
        
        .onAppear {
            if isPhone {
                
                DispatchQueue.main.async {
                    AppDelegate.orientationLock = .portrait
                    
                    UIDevice.current.setValue(UIInterfaceOrientation.portrait.rawValue, forKey: "orientation")
                   
                    UIViewController.attemptRotationToDeviceOrientation()
                    
                }
            } else {
                DispatchQueue.main.async {
                    AppDelegate.orientationLock = .landscapeLeft
                    
                    UIDevice.current.setValue(UIInterfaceOrientation.landscapeLeft.rawValue, forKey: "orientation")
                    
                    UIViewController.attemptRotationToDeviceOrientation()
                    print("Ipad")
                }
            }
        }
        .sheet(isPresented: $pauseSession) {
            Text("Presentation Mode 🎞️")
            
                .font(.largeTitle)
            Text("You're in presentation mode. 'Quit to Home' to go to main page.")
            VStack {
                Text("Menu Options")
                    .font(.title)
                    .bold()
                
                Button {
                    pauseSession = false
                } label: {
                    Label("Resume", systemImage: "play.fill")
                        .font(.title)
                        .bold()
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 8)
                }
                .buttonStyle(.borderedProminent)
                .padding()
                
                Button {
                    withAnimation(.spring()) {
                        pauseSession = false
                        mainPageIndex = -1
                    }
                } label: {
                    Label("Quit to Home", systemImage: "")
                        .font(.title)
                        .bold()
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 8)
                }
                .buttonStyle(.borderedProminent)
                .padding()
                
            }
            .padding()
            .background(Color.accentColor.opacity(0.3))
            .clipShape(.rect(cornerRadius: 20))
            .padding()
            .interactiveDismissDisabled()
        }
        
    }
}

#Preview {
    WelcomeScreen()
}
