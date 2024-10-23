//
//  ContentView.swift
//  SwiftTimeTest
//
//  Created by Caleb Elson on 02/10/2024.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @State var timers: [TimerModel] = []
    @State private var viewsToTest = NavigationPath()
    
    var body: some View {
        VStack {
            NavigationStack(path: $viewsToTest) {                
                Button("Start Tests") {
                    viewsToTest.append(timers.count)
                }
                .disabled(timers.count != 0)
                .navigationDestination(for: Int.self) { i in
                    if i < 20 {
                        switch i % 4 {
                        case 0:
                            ImageTableView(timers: $timers, start: Date())
                                .onDisappear {
                                    viewsToTest.append(timers.count)
                                }
                        case 1:
                            CirclesView(timers: $timers, start: Date())
                                .onDisappear {
                                    viewsToTest.append(timers.count)
                                }
                        case 2:
                            SquaresView(timers: $timers, start: Date())
                                .onDisappear {
                                    viewsToTest.append(timers.count)
                                }
                        case 3:
                            SwiftTestsView(timers: $timers, start: Date())
                                .onDisappear {
                                    viewsToTest.append(timers.count)
                                }
                        default:
                            SwiftTestsView(timers: $timers, start: Date())
                                .onDisappear {
                                    viewsToTest.append(timers.count)
                                }
                        }
                    } else {
                        SendDataView(timers: $timers)
                            .navigationBarBackButtonHidden(true)
                    }
                }
            }
        }
    }
    
//    func addView(_ i: Int) {
//        switch i {
//        case 0:
//            viewsToTest.append(timers.count)
//            let _ = print("now we square case \(i)")
//            SquaresView(timers: $timers, start: Date())
//                .onDisappear {
//                    if timers.count <= 5 {
//                        viewsToTest.append(timers.count)
//                    }
//                }
//        case 1...4:
//            let _ = print("case \(i)")
//            SwiftTestsView(timers: $timers, start: Date())
//                .onDisappear {
//                    if timers.count <= 5 {
//                        viewsToTest.append(timers.count)
//                    }
//                }
//                .navigationBarBackButtonHidden(true)
//        default:
//            SendDataView(timers: $timers)
//                .navigationBarBackButtonHidden(true)
//        }
//    }
}

#Preview {
    ContentView()
}
