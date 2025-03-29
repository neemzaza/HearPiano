import SwiftUI

struct ContentView: View {
    let allCourse: [CourseView] = [
        CourseView(title: "Keyboard Fundamental", code: "KeyboardFund",desc: "This is essential content to learning about basic that should be known for playing keyboard!", icon: "pianokeys")
    ]
    
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    @State private var courseSeeking: String = "";
    @State private var takingCourse: Bool = false;
    @State private var presentedPage: [CourseView] = [];
    
    @State private var pauseSession: Bool = false;
    
    var body: some View {
        
        NavigationStack(path: $presentedPage) {
            TabView {
                
                PracticeView()
                    .tabItem { 
                        Label("HearPiano Game", systemImage: "pianokeys")
                    }
                
                AboutThisApp()
                    .tabItem { 
                        Label("About", systemImage: "info")
                    }
            }
        }
        
    }
}

//#Preview {
//    WelcomeView(isWelcomeSheetShowing: .constant(true))
//}




