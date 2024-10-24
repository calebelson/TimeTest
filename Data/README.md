# TimeTest Data

This study investigates whether SwiftUI performs layout tasks faster than Flutter on iOS devices by measuring view layout times of equivalent views across eight real-world devices. Full report and all data is included here.

User data for SwiftTimeTest includes start, end, and duration for each view across the 5 loops. Start is from before the view is created, end is when .onAppear() is called, with duration being the difference between the two.

User data for FlutterTimeTest includes start, end, and duration, but also viewLoaded and timerToLoad. Initial designs used [VisibilityDetector](https://pub.dev/packages/visibility_detector) to compare to SwiftUI's .onAppear(), but WidgetsBinding.instance.addPostFrameCallback() was found to be a better comparison. viewLoaded is when WidgetsBinding.instance.addPostFrameCallback() is called, with timerToLoad being the difference between the start and viewLoaded.