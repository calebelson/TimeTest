//
//  TableView.swift
//  SwiftTimeTest
//
//  Created by Caleb Elson on 22/10/2024.
//

import SwiftUI

struct ImageTableView: View {
    @Binding var timers: [TimerModel]
    private let timer: TimerModel
    private let start: Date
    let rowCount = 30
    let visibleRows: CGFloat = 10
    @Environment(\.dismiss) var dismiss
    
    init(timers: Binding<[TimerModel]>, start: Date) {
        self.start = start
        timer = TimerModel(viewTested: "ImageTableView", testNumber: timers.count)
        self._timers = timers
    }

    var body: some View {
        GeometryReader { geometry in
            let screenHeight = geometry.size.height
            let rowHeight = screenHeight / visibleRows

            List(0..<rowCount, id: \.self) { index in
                HStack {
                    Image(RandomImage().getRandomImage())
                    .frame(width: rowHeight, height: rowHeight)
                    .clipped()

                    Spacer().frame(width: 10)

                    // Row number
                    Text("Row \(index + 1)")
                        .font(.system(size: 18))
                }
                .frame(height: rowHeight)
                .padding(.horizontal, 8)
            }
            .onAppear {
                timer.setStartTime(start)
                timer.stopTimer()
                timers.append(timer)
                dismiss()
            }
        }
        .navigationTitle("Random Image Table View")
        .onDisappear {
            timer.stopTimer()
        }
    }
}

#Preview {
    struct Preview: View {
        @State var timers = [TimerModel(viewTested: "ImageTableView", testNumber: 1)]
        
        var body: some View {
            ImageTableView(timers: $timers, start: Date())
        }
    }

    return Preview()
    //ImageTableView()
}
