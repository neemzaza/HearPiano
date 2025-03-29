import SwiftUI

struct CourseView: Identifiable, Hashable {
    let id = UUID();
    let title: String;
    let code: String;
    let desc: String;
    let icon: String;
}

struct CourseList: View {
    @Binding var mode: Int
    @Binding var allCourse: [CourseView];
    @Binding var courseSeeking: String;
    @Binding var takingCourse: Bool;
    
    var body: some View {
        //NavigationStack(path: $presentedPage) {
            
            //ScrollView {
            
                ForEach(allCourse) {
                    course in
                    
                    @AppStorage(course.code) var progressEach = 0.00
                    

                    
//                    let progressEach =         UserDefaults.standard.double(forKey: course.code)
                    NavigationLink() {
                        
                        GeometryReader {
                            geometry in
                            ScrollView(.vertical) {
                                VStack {
                                    Image(course.code)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: geometry.size.width ,height: 200, alignment: .leading)
                                        .multilineTextAlignment(.leading)
                                        .clipped()
                                    
                                    VStack(alignment: .leading) {
                                        HStack {
                                                                                        
                                            Text(course.title)
                                                .font(.title)
                                                .bold()
                                            
                                            Image(systemName: "checkmark.circle.fill")
                                                .foregroundStyle(Color.green)
                                                .opacity(progressEach >= 1.00 ? 1 : 0)
                                        } 
                                        Divider()
                                        Text(course.desc)
                                            .multilineTextAlignment(.leading)
                                        
                                        
                                        Divider()
                                        
                                        Spacer()
                                        
                                        Button {
                                            self.courseSeeking = course.code
                                            takingCourse = true;
                                            //print(courseSeeking)
                                        } label: {
                                            Label(mode == 0 ? "Start Learning" : "Go Practice!", systemImage: mode == 0 ? "book.pages" : "hand.raised")
                                                .font(.title)
                                                .bold()
                                                .frame(maxWidth: .infinity)
                                                .padding(.vertical, 8)
                                        }
                                        .buttonStyle(.borderedProminent)
                                        .padding()
                                        
//                                        Button {
//                                            progressEach = 0.00
//                                            print(progressEach)
//                                        } label: {
//                                            Text("Reset")
//                                        }
//                                        
//                                        Button {
//                                            progressEach = 1.00
//                                            print(progressEach)
//                                        } label: {
//                                            Text("Finish")
//                                        }
//                                        
                                    }.padding()
                                }.tint(mode == 0 ? Color.accentColor : Color.orange)
                            }
                            
                            .navigationTitle("\(course.title)")
                        }
                        
                    } label: {
                        ZStack(alignment: .trailing) {
                            Spacer()
                            Image(systemName: course.icon)
                                /*.foregroundColor(progressEach >= 1.00 ? Color.green : Color.accentColor)*/
                                .font(.system(size: 120))
                                .opacity(0.25)
                                //.frame(maxWidth: 80)
                            VStack(alignment: .leading) {
                                Text(course.title)
                                    .font(.title2)
                                    .bold()
                                    .multilineTextAlignment(.leading)
                                Text(course.desc)
                                    .multilineTextAlignment(.leading)
                            }                   .foregroundStyle(Color.primary)
                                .buttonBorderShape(.roundedRectangle)
                                .padding()
                                Spacer()
                        }
                        .multilineTextAlignment(.leading)
                        .frame(maxWidth: .infinity, maxHeight: 400)
                        .background(Color.primary.opacity(0.1))
                        .clipShape(.rect(cornerRadius: 20))
                        //.shadow(radius: 10)
                        
                    }
                    
                }
            //}
            
        //}
    }
}

//#Preview {
//    CourseList()
//}
