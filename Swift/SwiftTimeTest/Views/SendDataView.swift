//
//  SendDataView.swift
//  SwiftTimeTest
//
//  Created by Caleb Elson on 07/10/2024.
//

import SwiftUI

struct SendDataView: View {
    @Binding var timers: [TimerModel]
    var data = MetricsData()
    @Environment(\.dismiss) var dismiss
    
    init(timers: Binding<[TimerModel]>) {
        self._timers = timers
        addAllTimers()
    }
    
    var body: some View {
        Spacer()
        ShareLink("Send the data", item: data.getFileName(), preview: SharePreview("Test Data"))
        Spacer()
        Button("Redo Tests") {
            timers = []
            dismiss()
        }
        Spacer()
    }
    
    func addAllTimers() {
        for timer in timers {
            data.addData(timer: timer)
        }
    }
}

#Preview {
    struct Preview: View {
        @State var timers = [TimerModel(viewTested: "SwiftTestView", testNumber: 1)]
        
        var body: some View {
            SendDataView(timers: $timers)
        }
    }
    
    return Preview()
}
