import SwiftUI
import Subsonic

struct PianoUpright: View {
    @Binding var returnKey: [Int];
    @Binding var showSymbol: Bool;
    @Binding var stringBreak: Int; // d: -1
    @Binding var tunerStickHas: Bool;
    @Binding var coverFrontState: Bool; // d: false // ok
    
    @Binding var eachKey: [Int]; // d: false // ok
    
    @Binding var tunerPutOn: Int;
    
    @Binding var skipTutorial: Bool;
    
    @Binding var pianoIndex: Int;
    
    @Binding var octaveRandomBool: Bool

    @State private var onDragCover: CGSize = .zero;
    @State private var coverFrontStateAnim: Bool = true;
    
    let radiusGlobal: CGFloat = 10;
    
    //@State private var eachKey: [Int] = [1,0,3,5,4,7,5,6,5,8,9,8]
    
    @State private var eachStringLimit: [Int] = Array(repeating: 0, count: 12)
    
    @State private var soundVolumeKey: [Double] = Array(repeating: 1, count: 12)
    
    @State private var keyPressed: [Bool] = Array(repeating: false, count: 12)
    
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
    
    func stringBrokenStatus(which: Int) {
        if (eachStringLimit[which] >= 4 || eachStringLimit[which] <= -4) {
            stringBreak = which;
            eachKey[which] = -1
            play(sound: "breakStringFx.m4a")
        }
    }
    
    var pianoKeyboard: some View {
        
        GeometryReader { geometry in
            ZStack(alignment: .top) {
                
                //White
                HStack(spacing: 3) {
                    // DO
                    Rectangle()
                        .fill(
                            .shadow(.inner(radius: keyPressed[0] ? 10 : 0))
                        )
                        .foregroundStyle(Color.white)
                    //.frame(maxHeight: heightOfKey)
                        .clipShape(.rect(cornerRadius: radiusGlobal))
                        .overlay(alignment: .bottom) {
                            showSymbol ?
                            Text("C")
                                .foregroundStyle(Color.black)
                                .padding()
                            :
                            nil
                        }
                        .onLongPressGesture(minimumDuration: 0, maximumDistance: 100, pressing: {
                            pressing in
                            if (pressing) {
                                //print("Pressed")
                                keyPressed[0] = true;
                                returnKey.append(0)
                                soundOfNote(number: eachKey[0])
                            }
                            if (!pressing) {
                                //print("Unpressed")
                                keyPressed[0] = false;
                                returnKey.removeAll(where: { $0 == 0 })
                            }
                        }, perform: {})
                    
                    // RE
                    Rectangle()
                        .fill(
                            .shadow(.inner(radius: keyPressed[2] ? 10 : 0))
                        )
                        .foregroundStyle(Color.white)
                    //.frame(maxHeight: heightOfKey)
                        .clipShape(.rect(cornerRadius: radiusGlobal))
                        .overlay(alignment: .bottom) {
                            showSymbol ?
                            Text("D")
                                .foregroundStyle(Color.black)
                                .padding()
                            :
                            nil
                        }
                        .onLongPressGesture(minimumDuration: 0, maximumDistance: 100, pressing: {
                            pressing in
                            if (pressing) {
                                soundOfNote(number: eachKey[2])
                                //print("Pressed")
                                keyPressed[2] = true;
                                returnKey.append(2)
                            }
                            if (!pressing) {
                                //print("Unpressed")
                                keyPressed[2] = false;
                                returnKey.removeAll(where: { $0 == 2 })
                                
                            }
                        }, perform: {})
                    
                    // MI
                    Rectangle()
                        .fill(
                            .shadow(.inner(radius: keyPressed[4] ? 10 : 0))
                        )
                        .foregroundStyle(Color.white)
                    //.frame(maxHeight: heightOfKey)
                        .clipShape(.rect(cornerRadius: radiusGlobal))
                        .overlay(alignment: .bottom) {
                            showSymbol ?
                            Text("E")
                                .foregroundStyle(Color.black)
                                .padding()
                            :
                            nil
                        }
                        .onLongPressGesture(minimumDuration: 0, maximumDistance: 100, pressing: {
                            pressing in
                            if (pressing) {
                                soundOfNote(number: eachKey[4])
                                //print("Pressed")
                                keyPressed[4] = true;
                                returnKey.append(4)
                            }
                            if (!pressing) {
                                //print("Unpressed")
                                keyPressed[4] = false;
                                returnKey.removeAll(where: { $0 == 4 })
                            }
                        }, perform: {})
                    
                    // FA
                    Rectangle()
                        .fill(
                            .shadow(.inner(radius: keyPressed[5] ? 10 : 0))
                        )
                        .foregroundStyle(Color.white)
                    //.frame(maxHeight: heightOfKey)
                        .clipShape(.rect(cornerRadius: radiusGlobal))
                        .overlay(alignment: .bottom) {
                            showSymbol ?
                            Text("F")
                                .foregroundStyle(Color.black)
                                .padding()
                            :
                            nil
                        }
                        .onLongPressGesture(minimumDuration: 0, maximumDistance: 100, pressing: {
                            pressing in
                            if (pressing) {
                                soundOfNote(number: eachKey[5])
                                //print("Pressed")
                                keyPressed[5] = true;
                                returnKey.append(5)
                            }
                            if (!pressing) {
                                //print("Unpressed")
                                keyPressed[5] = false;
                                returnKey.removeAll(where: { $0 == 5 })
                            }
                        }, perform: {})
                    
                    // SOL
                    Rectangle()
                        .fill(
                            .shadow(.inner(radius: keyPressed[7] ? 10 : 0))
                        )
                        .foregroundStyle(Color.white)
                    //.frame(maxHeight: heightOfKey)
                        .clipShape(.rect(cornerRadius: radiusGlobal))
                        .overlay(alignment: .bottom) {
                            showSymbol ?
                            Text("G")
                                .foregroundStyle(Color.black)
                                .padding()
                            :
                            nil
                        }
                        .onLongPressGesture(minimumDuration: 0, maximumDistance: 100, pressing: {
                            pressing in
                            if (pressing) {
                                soundOfNote(number: eachKey[7])
                                //print("Pressed")
                                keyPressed[7] = true;
                                returnKey.append(7)
                            }
                            if (!pressing) {
                                //print("Unpressed")
                                keyPressed[7] = false;
                                returnKey.removeAll(where: { $0 == 7 })
                            }
                        }, perform: {})
                    
                    // LA
                    Rectangle()
                        .fill(
                            .shadow(.inner(radius: keyPressed[9] ? 10 : 0))
                        )
                        .foregroundStyle(Color.white)
                    //.frame(maxHeight: heightOfKey)
                        .clipShape(.rect(cornerRadius: radiusGlobal))
                        .overlay(alignment: .bottom) {
                            showSymbol ?
                            Text("A")
                                .foregroundStyle(Color.black)
                                .padding()
                            :
                            nil
                        }
                        .onLongPressGesture(minimumDuration: 0, maximumDistance: 100, pressing: {
                            pressing in
                            if (pressing) {
                                soundOfNote(number: eachKey[9])
                                //print("Pressed")
                                keyPressed[9] = true;
                                returnKey.append(9)
                            }
                            if (!pressing) {
                                //print("Unpressed")
                                keyPressed[9] = false;
                                returnKey.removeAll(where: { $0 == 9 })
                            }
                        }, perform: {})
                    
                    // SI
                    Rectangle()
                        .fill(
                            .shadow(.inner(radius: keyPressed[11] ? 10 : 0))
                        )
                        .foregroundStyle(Color.white)
                    //.frame(maxHeight: heightOfKey)
                        .clipShape(.rect(cornerRadius: radiusGlobal))
                        .overlay(alignment: .bottom) {
                            showSymbol ?
                            Text("B")
                                .foregroundStyle(Color.black)
                                .padding()
                            :
                            nil
                        }
                        .onLongPressGesture(minimumDuration: 0, maximumDistance: 100, pressing: {
                            pressing in
                            if (pressing) {
                                soundOfNote(number: eachKey[11])
                                //print("Pressed")
                                keyPressed[11] = true;
                                returnKey.append(11)
                            }
                            if (!pressing) {
                                //print("Unpressed")
                                keyPressed[11] = false;
                                returnKey.removeAll(where: { $0 == 11 })
                            }
                        }, perform: {})
                }
                .shadow(radius: 10)
                
                // Black key
                HStack(spacing: 18) {
                    Spacer()
                        .frame(width: 20)
                    // Do #
                    Rectangle()
                        .foregroundStyle(Color.black)
                        .frame(height: geometry.size.height / 2)
                        .clipShape(.rect(cornerRadius: radiusGlobal))
                        .overlay(alignment: .top, content: {
                            showSymbol ?
                            Text("C#\nDb")
                                .foregroundStyle(Color.gray)
                            :
                            nil
                            
                            Rectangle()
                                .foregroundStyle(Color.gray.opacity(keyPressed[1] ? 0.2 : 0.4))
                                .frame(height: keyPressed[1] ? (geometry.size.height / 2) - 10  : (geometry.size.height / 2) - 20)
                                .clipShape(.rect(cornerRadius: 10))
                        })
                        .onLongPressGesture(minimumDuration: 0, maximumDistance: 100, pressing: {
                            pressing in
                            if (pressing) {
                                soundOfNote(number: eachKey[1])
                                //print("Pressed")
                                keyPressed[1] = true;
                                returnKey.append(1)
                            }
                            if (!pressing) {
                                //print("Unpressed")
                                keyPressed[1] = false;
                                returnKey.removeAll(where: { $0 == 1 })
                            }
                        }, perform: {})
                    
                    
                    // Mi b
                    Rectangle()
                        .foregroundStyle(Color.black)
                        .frame(height: (geometry.size.height / 2))
                        .clipShape(.rect(cornerRadius: radiusGlobal))
                        .overlay(alignment: .top, content: {
                            showSymbol ?
                            Text("D#\nEb")
                                .foregroundStyle(Color.gray)
                            :
                            nil
                            Rectangle()
                                .foregroundStyle(Color.gray.opacity(keyPressed[3] ? 0.2 : 0.4))
                                .frame(height: keyPressed[3] ? (geometry.size.height / 2) - 10 : (geometry.size.height / 2) - 20)
                                .clipShape(.rect(cornerRadius: 10))
                        })
                        .onLongPressGesture(minimumDuration: 0, maximumDistance: 100, pressing: {
                            pressing in
                            if (pressing) {
                                soundOfNote(number: eachKey[3])
                                //print("Pressed")
                                keyPressed[3] = true;
                                returnKey.append(3)
                            }
                            if (!pressing) {
                                //print("Unpressed")
                                keyPressed[3] = false;
                                returnKey.removeAll(where: { $0 == 3 })
                            }
                        }, perform: {})
                    
                    Spacer()
                        .frame(width: 35)
                    
                    
                    // Fa #
                    Rectangle()
                        .foregroundStyle(Color.black)
                        .frame(height: (geometry.size.height / 2))
                        .clipShape(.rect(cornerRadius: radiusGlobal))
                        .overlay(alignment: .top, content: {
                            showSymbol ?
                            Text("F#\nGb")
                                .foregroundStyle(Color.gray)
                            :
                            nil
                            Rectangle()
                                .foregroundStyle(Color.gray.opacity(keyPressed[6] ? 0.2 : 0.4))
                                .frame(height: keyPressed[6] ? (geometry.size.height / 2) - 10 : (geometry.size.height / 2) - 20)
                                .clipShape(.rect(cornerRadius: 10))
                        })
                        .onLongPressGesture(minimumDuration: 0, maximumDistance: 100, pressing: {
                            pressing in
                            if (pressing) {
                                soundOfNote(number: eachKey[6])
                                //print("Pressed")
                                keyPressed[6] = true;
                                returnKey.append(6)
                            }
                            if (!pressing) {
                                //print("Unpressed")
                                keyPressed[6] = false;
                                returnKey.removeAll(where: { $0 == 6 })
                            }
                        }, perform: {})
                    
                    
                    // Sol #
                    Rectangle()
                        .foregroundStyle(Color.black)
                        .frame(height: (geometry.size.height / 2))
                        .clipShape(.rect(cornerRadius: radiusGlobal))
                        .overlay(alignment: .top, content: {
                            showSymbol ?
                            Text("G#\nAb")
                                .foregroundStyle(Color.gray)
                            :
                            nil
                            Rectangle()
                                .foregroundStyle(Color.gray.opacity(keyPressed[8] ? 0.2 : 0.4))
                                .frame(height: keyPressed[8] ? (geometry.size.height / 2) - 10 : (geometry.size.height / 2) - 20)
                                .clipShape(.rect(cornerRadius: 10))
                        })
                        .onLongPressGesture(minimumDuration: 0, maximumDistance: 100, pressing: {
                            pressing in
                            if (pressing) {
                                soundOfNote(number: eachKey[8])
                                //print("Pressed")
                                keyPressed[8] = true;
                                returnKey.append(8)
                            }
                            if (!pressing) {
                                //print("Unpressed")
                                keyPressed[8] = false;
                                returnKey.removeAll(where: { $0 == 8 })
                            }
                        }, perform: {})
                    
                    // SI b
                    Rectangle()
                        .foregroundStyle(Color.black)
                        .frame(height: (geometry.size.height / 2))
                        .clipShape(.rect(cornerRadius: radiusGlobal))
                        .overlay(alignment: .top, content: {
                            showSymbol ?
                            Text("A#\nBb")
                                .foregroundStyle(Color.gray)
                            :
                            nil
                            Rectangle()
                                .foregroundStyle(Color.gray.opacity(keyPressed[10] ? 0.2 : 0.4))
                                .frame(height: keyPressed[10] ? (geometry.size.height / 2) - 10 : (geometry.size.height / 2) - 20)
                                .clipShape(.rect(cornerRadius: 10))
                        })
                        .onLongPressGesture(minimumDuration: 0, maximumDistance: 100, pressing: {
                            pressing in
                            if (pressing) {
                                soundOfNote(number: eachKey[10])
                                //print("Pressed")
                                keyPressed[10] = true;
                                returnKey.append(10)
                            }
                            if (!pressing) {
                                //print("Unpressed")
                                keyPressed[10] = false;
                                returnKey.removeAll(where: { $0 == 10 })
                            }
                        }, perform: {})
                    
                    Spacer()
                        .frame(width: 20)
                }
            }
        }.onAppear {
            for keys in 0...11 {
                if keys == 0 {
                    eachKey[0] = 2
                    continue
                }
                
                let keyExact = Int.random(in: keys-3 ..< keys+3)
                eachKey[keys] = (keyExact > 11 ? 11 : keyExact < 0 ? 0 : keyExact)
            }
        }
        .onChange(of: keyPressed[0]) {
            value in
            if (!skipTutorial && (pianoIndex == 5 || pianoIndex == 9 || pianoIndex == 12)) {
                withAnimation(.spring()) {
                    pianoIndex += 1
                }
            }
            
        }
    }

    
    
    var body: some View {
        

        
            VStack(spacing: 0) {
                ZStack {
                    // Background
                    Rectangle()
                        .clipShape(.rect(topLeadingRadius: 20, topTrailingRadius: 20))
                        .foregroundStyle(Color.black)
                        .frame(maxWidth: 425 ,maxHeight: 225)
                        //.zIndex(-2)
                    
                    Rectangle()
                        .clipShape(.rect(topLeadingRadius: 20, topTrailingRadius: 20))
                        .foregroundStyle(LinearGradient(gradient: Gradient(colors: [Color.yellow.opacity(0.25), Color.brown.opacity(0.25)]), startPoint: .top, endPoint: .bottom))
                        .frame(maxWidth: 400 ,maxHeight: 225)
                        //.zIndex(-2)
                    
                    HStack(spacing: 5) {
                        ForEach(0 ..< keyPressed.count, id: \.self) {
                            eachKeyPressed in
                            // System
                            ZStack {
                                
                                
                                Rectangle()
                                    .frame(width: 2, height: stringBreak == eachKeyPressed ? 0 : 150)
                                    .rotationEffect(Angle(degrees: stringBreak == eachKeyPressed ? 180 : 0))
                                    .animation(.spring(duration: 0.3, bounce: 0.9), value: stringBreak)
                                    .offset(x: keyPressed[eachKeyPressed] ? 1 : 0, y: stringBreak == eachKeyPressed ? 100 : 0)
                                    .animation(.spring(duration: 0.5, bounce: 0.9), value: keyPressed[eachKeyPressed])
                                    .foregroundStyle(Color.gray)
                                    .shadow(radius: 10)
                                
                                HStack(alignment: .bottom) {
                                    VStack(spacing: 0) {
                                        Rectangle()
                                            .foregroundStyle(Color.white)
                                            .frame(width: 20, height: 40)
                                            .clipShape(.rect(cornerRadius: 20))
                                            .shadow(radius: 10)
                                        Rectangle()
                                            .frame(width: 5, height: 100)
                                            .foregroundStyle(Color.yellow)
                                        
                                    }
                                }
                                .offset(y: keyPressed[eachKeyPressed] ? 45 : 35)
                                .animation(.spring(duration: 0.1, bounce: 0.75), value: keyPressed[eachKeyPressed])
                                
                                Circle()
                                    .frame(width: 25)
                                    .foregroundStyle(Color.white)
                                    .offset(y: -80)
                                    .onTapGesture {
                                        if (tunerStickHas) {
                                            
                                            if (!skipTutorial && eachKeyPressed == 0) {
                                                tunerPutOn = 0
                                            } else if (skipTutorial || pianoIndex >= 7) {
                                                tunerPutOn = eachKeyPressed
                                            }
                                            
                                        }
                                    }
                                    
                                    
                                
                                
                                
                                Rectangle()
                                    .clipShape(.rect(cornerRadius: 20))
                                    .foregroundStyle(Color.brown)
                                    .frame(width: 25 ,height: 75)
                                    .offset(y: keyPressed[eachKeyPressed] ? 110 : 100)
                                    .animation(.spring(duration: 0.1, bounce: 0.75), value: keyPressed[eachKeyPressed])
                                    .overlay {
                                        Text(nameOfNote(number: eachKeyPressed))
                                            .opacity(0.5)
                                            .offset(y: keyPressed[eachKeyPressed] ? 95 : 85)
                                            .animation(.spring(duration: 0.1, bounce: 0.75), value: keyPressed[eachKeyPressed])
                                        
                                        
                                    }
                            }
                            .id(eachKeyPressed)
                            .overlay {
                                if (tunerPutOn == eachKeyPressed) {
                                    TuningStick(whichKey: .constant(eachKeyPressed),eachStringLimit: $eachStringLimit, eachKey: $eachKey, tunerPutOn: $tunerPutOn, stringBreak: $stringBreak, 
                                                skipTutorial: $skipTutorial,pianoIndex: $pianoIndex)
                                        .offset(y: -80)
                                        .zIndex(10)
                                        .onChange(of: eachStringLimit) { value in
                                            stringBrokenStatus(which: eachKeyPressed)
                                        }
                                }
                            }.zIndex(tunerPutOn == eachKeyPressed ? 10 : 1)
                            
//                            Text("\(geometry.frame(in: CoordinateSpace.local).origin.x)")
                            
                        }
                    }
                    //.zIndex(-1.0)
                    Rectangle()
                        .frame(maxWidth: 400, maxHeight: 25)
                        .foregroundStyle(Color.brown)
                        .offset(y: 30)
                        .shadow(radius: 5)
                        .overlay {
                            HStack {
                                Spacer()
                                Text(octaveRandomBool ? "HearPiano Model-A" : "HearPiano Model-B")
                                    .foregroundStyle(Color.black)
                                    .font(.caption)
                                Spacer().frame(width: 25)
                                
                            }.offset(y: 30)
                        }
                    
                    
                    // Cover
                    Rectangle()
                        .clipShape(.rect(topLeadingRadius: 20, topTrailingRadius: 20))
                        .foregroundStyle(Color.black)
                        .frame(maxWidth: 425 ,maxHeight: 225)
                        .offset(onDragCover)
                        .opacity(coverFrontStateAnim ? 1 : 0)
                        .gesture(
                            DragGesture()
                                .onChanged {
                                    value in
                                    onDragCover = value.translation
                                }
                                .onEnded {
                                    value in
                                    onDragCover = .zero
                                    coverFrontState = false;
                                    coverFrontStateAnim = false;
                                    
                                    print(coverFrontState)
                                }
                        )
                    
                }
                ZStack(alignment: .top) {
                    Rectangle()
                        .clipShape(.rect(cornerRadius: 20))
                        .foregroundStyle(Color.black)
                        .frame(maxWidth: 450 ,maxHeight: 175)
                    
                    Group {
                        pianoKeyboard
                    }.frame(maxWidth: 400 ,maxHeight: 150)
                    
                    
                }
                
                Rectangle()
                    .clipShape(.rect(bottomLeadingRadius: 20, bottomTrailingRadius: 20))
                    .foregroundStyle(Color.black)
                    .frame(width: 325, height: 125)
                    .overlay {
                        VStack {
                            Spacer()
                            HStack(alignment: .bottom) {
                                Spacer()
                                HStack {
                                    Rectangle()
                                        .clipShape(.rect(cornerRadius: 20))
                                        .foregroundStyle(Color.yellow)
                                        .frame(width: 25, height: 10)
                                    Rectangle()
                                        .clipShape(.rect(cornerRadius: 20))
                                        .foregroundStyle(Color.yellow)
                                        .frame(width: 25, height: 10)
                                    Rectangle()
                                        .clipShape(.rect(cornerRadius: 20))
                                        .foregroundStyle(Color.yellow)
                                        .frame(width: 25, height: 10)
                                }
                                Spacer()
                            }
                        }
                    }
            }
            .onChange(of: tunerPutOn) {
                value in
                play(sound: "Soundfxtuningput.m4a")
            }
            .onAppear() {
                octaveRandomBool = Bool.random()
            }
        
    }
        
}

//#Preview {
//    PianoUpright(returnKey: .constant([]), showSymbol: .constant(true), stringBreak: .constant(-1), tunerStickHas: .constant(true), coverFrontState: .constant(true), turningSuccess: .constant(false), tunerPutOn: .constant(1))
//}
