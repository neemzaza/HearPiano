import SwiftUI
import Subsonic

struct TuningStick: View {

    @Binding var whichKey: Int
    @Binding var eachStringLimit: [Int]
    @Binding var eachKey: [Int]
    @Binding var tunerPutOn: Int
    @Binding var stringBreak: Int
    @Binding var skipTutorial: Bool
    @Binding var pianoIndex: Int
    
    // Orientation detection
    @State private var isPortraitDetect: Bool = UIDevice.current.orientation.isPortrait
    
    // Device detection
    @State private var isPhone: Bool = UIDevice.current.userInterfaceIdiom == .phone ? true : false
   
    let layout = UIDevice.current.userInterfaceIdiom == .phone ? AnyLayout(VStackLayout()) : AnyLayout(HStackLayout())
    
    //@State private var eachKey: [Int] = [1,0,3,5,4,7,5,6,5,8,9,8]
    
//    @State private var eachStringLimit: [Int] = Array(repeating: 0, count: 12)
    
    var body: some View {
        ZStack {
            
            layout {
                Button {
                    if ((!skipTutorial && (pianoIndex == 8 || pianoIndex == 11 || pianoIndex >= 14)) || skipTutorial) {
                        if (!skipTutorial && pianoIndex < 14) {
                            withAnimation(.spring()) {
                                pianoIndex += 1
                            }
                        }
                        
                        if (eachKey[whichKey] > 0 && eachKey[whichKey] <= 11 && stringBreak != whichKey) {
                            eachKey[whichKey] -= 1
                            eachStringLimit[whichKey] -= 1
                            
                            play(sound: "tuningFx.m4a")
                        }
                    }
                    
                    print(eachKey[whichKey])
                } label: {
                    Image(systemName: "arrow.left")
                        .frame(width: 40, height: 40)
                        .foregroundStyle(Color.white)
                        .background(Color.accentColor)
                        .clipShape(Circle())
                        .zIndex(1)
                }
                
                Button {
                    if (!(!skipTutorial && pianoIndex >= 5 && pianoIndex < 14) || skipTutorial) {
                        tunerPutOn = -1
                        print(tunerPutOn)
                    }
                } label: {
                    Image(systemName: "xmark")
                        .frame(width: 40, height: 40)
                        .background(Color.red)
                        .foregroundStyle(Color.white)
                        .clipShape(Circle())
                        //.zIndex(10.0)
                }
                
                
                Button {
                    if (!(!skipTutorial && pianoIndex >= 5 && pianoIndex < 14)) {
                        
                        if (eachKey[whichKey] >= 0 && eachKey[whichKey] < 11 && stringBreak != whichKey) {
                            eachKey[whichKey] += 1
                            eachStringLimit[whichKey] += 1
                            play(sound: "tuningFx.m4a")
                        }
                    }
                    print(eachKey[whichKey])
                } label: {
                    Image(systemName: "arrow.right")
                        .frame(width: 40, height: 40)
                        .foregroundStyle(Color.white)
                        .background(Color.accentColor)
                        .clipShape(Circle())
                        //.zIndex(10.0)
                }
            }.offset(y: !isPhone ? -50 : -100)
        
                Circle()
                    .foregroundStyle(Color.gray)
                    .frame(width: 30)
                    .overlay {
                        // stick
                        VStack(spacing: 0) {
                            Rectangle()
                                .foregroundStyle(Color.gray)
                                .clipShape(.rect(topLeadingRadius: 10, topTrailingRadius: 10))
                                .frame(width: 15, height: 40)
                            Rectangle()
                                .foregroundStyle(Color.brown)
                                .clipShape(.rect(bottomLeadingRadius: 10, bottomTrailingRadius: 10))
                                .frame(width: 20, height: 40)
                        }.offset(y: 35)
                            .rotationEffect(Angle(degrees: Double((-eachKey[whichKey]*22)+120)))
                    }
                    .shadow(radius: 10)
                    //.zIndex(-1.0)
            
        }
    }
}

//#Preview {
//    TuningStick(whichKey: .constant(0), eachKey: .constant([]), tunerPutOn: .constant(-1))
//}
