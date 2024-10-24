# TimeTest Data

This study investigates whether SwiftUI performs layout tasks faster than Flutter on iOS devices by measuring view layout times of equivalent views across eight real-world devices. Full report and all data is included here.

User data for SwiftTimeTest includes start, end, and duration for each view across the 5 loops. Start is from before the view is created, end is when .onAppear() is called, with duration being the difference between the two.

User data for FlutterTimeTest includes start, end, and duration, but also viewLoaded and timerToLoad. Initial designs used [VisibilityDetector](https://pub.dev/packages/visibility_detector) to compare to SwiftUI's .onAppear(), the end value is the time when the view is visible according to VisibilityDetector, with duration being the difference between start and end. Further testing revealed WidgetsBinding.instance.addPostFrameCallback() was a better comparison. The viewLoaded value is when WidgetsBinding.instance.addPostFrameCallback() is called, with timerToLoad being the difference between the start and viewLoaded timestamps.
