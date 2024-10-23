//
//  CirclesView.swift
//  SwiftTimeTest
//
//  Created by Caleb Elson on 22/10/2024.
//

import SwiftUI

struct CirclesView: View {
    let circleCount = 5000 // Total circles (50 x 100)
    let filledCircleCount = 3500 // Number of filled circles
    @Binding var timers: [TimerModel]
    private let timer: TimerModel
    private let start: Date
    @Environment(\.dismiss) var dismiss
    
    // List of circle colors
    let circleColors: [Color] = [.blue, .brown, .cyan, .green, .orange, .purple, .red, .yellow]
    
    // Returns a random color from the list
    func getRandomColor() -> Color {
        return circleColors.randomElement()!
    }
    
    init(timers: Binding<[TimerModel]>, start: Date) {
        self.start = start
        timer = TimerModel(viewTested: "CirclesView", testNumber: timers.count)
        self._timers = timers
    }
    
    var body: some View {
        GeometryReader { geometry in
            let screenWidth = geometry.size.width
            let screenHeight = geometry.size.height
            
            // Calculate the size of each circle
            let circleSize = min(screenWidth / 50, screenHeight / 100)
            
            Canvas { context, size in
                for index in 0..<circleCount {
                    let isFilled = index < filledCircleCount
                    let randomColor = getRandomColor()
                    
                    // Calculate the position in the grid
                    let row = index / 50
                    let col = index % 50
                    let xPos = CGFloat(col) * (circleSize + 2)
                    let yPos = CGFloat(row) * (circleSize + 2)
                    
                    let rect = CGRect(x: xPos, y: yPos, width: circleSize, height: circleSize)
                    
                    // Draw filled or outlined circle
                    if isFilled {
                        context.fill(Path(ellipseIn: rect), with: .color(randomColor))
                    } else {
                        context.stroke(Path(ellipseIn: rect), with: .color(randomColor), lineWidth: 2)
                    }
                }
            }
            .onAppear {
                timer.setStartTime(start)
                timer.stopTimer()
                timers.append(timer)
                dismiss()
            }
        }
        .navigationTitle("Circle Grid")
    }
}
