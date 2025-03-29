import SwiftUI



struct PracticeView: View {
    let allCourse: [CourseView] = [
//        CourseView(title: "Song Practice for keyboard", code: "SongPractice",desc: "This section collected essential song for practice in Piano/Keyboard!", icon: "opticaldisc.fill"),
        CourseView(title: "Ear Training Session", code: "EarTrain", desc: "Ear training represented as \"Piano Tuner\" a job that very important to every pianist. This game can practice your hearing note skill", icon: "ear.fill"),
    ]
    
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    @AppStorage("isWelcomeSheetShowing") var isWelcomeSheetShowing = true
    
    @State private var courseSeeking: String = "";
    @State private var takingCourse: Bool = false;
    
    @State private var pauseSession: Bool = false;
    
    var body: some View {
        let layout = horizontalSizeClass == .regular ? AnyLayout(HStackLayout()) : AnyLayout(VStackLayout())
        
                ScrollView {
                    Section {
                        VStack(spacing: 0) {
                            //circle curve
                            Spacer().frame(maxHeight: 500)
                            // Header
                            VStack(alignment: .center) {
                                Spacer()
                                    .frame(height: 80)
                                Text("HearPiano Game")
                                    .font(.system(size: 50))
                                    .bold()
                                Divider()
                                    .background(Color.white)
                                Text("HearPiano Game is a game that practice your note recognition skills which note actually has.")
                                
                            }
                            //.padding(20)
                            .frame(maxWidth: .infinity)
                            .padding(50)

                            
                            
                        }
                        
                            .background(LinearGradient(gradient: Gradient(colors: [Color.orange.opacity(0.5), Color.purple.opacity(0.1)]), startPoint: .bottom, endPoint: .top))
                        .offset(y: -70)
                        
                    }
                    VStack {

                        Text("Practice today not tomorrow!")
                            .font(.title3)
                            .bold()
                        Text("\(courseSeeking)")
                            .hidden()
                        //.padding(20)
                        layout {
                            CourseList(mode: .constant(1), allCourse: .constant(allCourse), courseSeeking: self.$courseSeeking, takingCourse: self.$takingCourse)
                                .tint(Color.orange)
                            
                        }
                        .padding()
                        
                    }
                    
                    
                }.tint(Color.orange)
        
        .fullScreenCover(isPresented: $takingCourse, content: {
            ZStack(alignment: .topLeading) {
                
                if (courseSeeking == "EarTrain") {
                    EarTrain()
                    
                } else {
                    Text("404 - \(courseSeeking)")
                    Button {
                        takingCourse = false;
                    } label: {
                        Text("Exit")
                    }
                }
                Button {
                    pauseSession = true;
                } label: {
                    Circle()
                        .frame(width: 45)
                        .overlay {
                            Image(systemName: "pause.fill")
                                .foregroundStyle(Color.white)
                        }
                }
                .padding()
            }.frame(maxWidth: .infinity)
                .sheet(isPresented: $pauseSession) {
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
                            takingCourse = false
                        } label: {
                            Label("Quit to Title", systemImage: "")
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
        })
        
    }
}

//#Preview {
//    WelcomeView(isWelcomeSheetShowing: .constant(true))
//}
