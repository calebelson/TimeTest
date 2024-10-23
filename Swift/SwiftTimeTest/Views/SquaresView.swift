//
//  SquaresView.swift
//  SwiftTimeTest
//
//  Created by Caleb Elson on 22/10/2024.
//

import SwiftUI

struct SquaresView: View {
    let count = 25000 // Number of squares
    @Binding var timers: [TimerModel]
    private let timer: TimerModel
    private let start: Date
    @Environment(\.dismiss) var dismiss

    init(timers: Binding<[TimerModel]>, start: Date) {
        self.start = start
        timer = TimerModel(viewTested: "SquaresView", testNumber: timers.count)
        self._timers = timers
    }

    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                LazyVGrid(
                    columns: Array(repeating: GridItem(.flexible()), count: 50), // Adjust for layout
                    spacing: 2
                ) {
                    ForEach(0..<count, id: \.self) { _ in
                        generateComplexSquare()
                            .frame(width: CGFloat.random(in: 10...30), height: CGFloat.random(in: 10...30))
                    }
                }
                .padding()
            }
            .onAppear {
                timer.setStartTime(start)
                timer.stopTimer()
                timers.append(timer)
                dismiss()
            }
        }
        .navigationTitle("Square Grid")
    }

    // Generates a randomly colored square with gradient, shadows, etc.
    func generateComplexSquare() -> some View {
        return Rectangle()
            .fill(
                LinearGradient(
                    gradient: Gradient(colors: [Color.random(), Color.random()]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
            )
            .shadow(color: Color.black.opacity(0.5), radius: 4, x: CGFloat.random(in: -2...2), y: CGFloat.random(in: -2...2))
            .cornerRadius(5)
    }
}

extension Color {
    static func random() -> Color {
        return Color(
            red: Double.random(in: 0...1),
            green: Double.random(in: 0...1),
            blue: Double.random(in: 0...1)
        )
    }
}

#Preview {
    struct Preview: View {
        @State var timers = [TimerModel(viewTested: "SquaresView", testNumber: 1)]
        
        var body: some View {
            SquaresView(timers: $timers, start: Date())
        }
    }

    return Preview()
}
