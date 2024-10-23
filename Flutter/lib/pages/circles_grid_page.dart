import 'package:flutter_time_test/resources/exports.dart';

class CirclesGridPage extends StatefulWidget {
  const CirclesGridPage({super.key, required this.timers, required this.start});
  final List<TimerModel> timers;
  final DateTime start;

  @override
  State<CirclesGridPage> createState() => _CirclesGridPageState();
}

class _CirclesGridPageState extends State<CirclesGridPage> {
  late TimerModel timer;
  final Random _random = Random();
  final int circleCount = 5000;
  final int filledCircleCount = 3500;

  @override
  void initState() {
    super.initState();
    timer = TimerModel(
      viewTested: "circles_grid",
      testNumber: widget.timers.length,
    );
    timer.setStartTime(widget.start);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      timer.viewLoadedTimer();
    });
  }

  // Define the list of colors
  final List<Color> circleColors = [
    Colors.blue,
    Colors.brown,
    Colors.cyan,
    Colors.green,
    Colors.orange,
    Colors.purple,
    Colors.red,
    Colors.yellow,
  ];

  // Get a random color from the list
  Color getRandomColor() {
    return circleColors[_random.nextInt(circleColors.length)];
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: const Key('circle_key'),
      onVisibilityChanged: (visibilityInfo) {
        num visiblePercentage = visibilityInfo.visibleFraction * 100;
        if (visiblePercentage == 100) {
          timer.stopTimer();
          widget.timers.add(timer);
          Navigator.pop(context);
        }
      },
      child: Scaffold(
        appBar: AppBar(title: const Text('Circle Grid')),
        body: LayoutBuilder(
          builder: (context, constraints) {
            // Get the size of the available space
            double screenWidth = constraints.maxWidth;
            double screenHeight = constraints.maxHeight;

            // Calculate the size of each circle based on 50 columns and 100 rows
            double circleSize = min(screenWidth / 50, screenHeight / 100);

            return CustomPaint(
              size: Size(screenWidth, screenHeight),
              painter: CircleGridPainter(
                circleCount: circleCount,
                filledCircleCount: filledCircleCount,
                circleSize: circleSize,
                getRandomColor: getRandomColor,
              ),
            );
          },
        ),
      ),
    );
  }
}

class CircleGridPainter extends CustomPainter {
  final int circleCount;
  final int filledCircleCount;
  final double circleSize;
  final Color Function() getRandomColor;

  CircleGridPainter({
    required this.circleCount,
    required this.filledCircleCount,
    required this.circleSize,
    required this.getRandomColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    for (int i = 0; i < circleCount; i++) {
      final bool isFilled = i < filledCircleCount;
      final color = getRandomColor();

      // Calculate the row and column
      final int row = i ~/ 50;
      final int col = i % 50;

      // Calculate the x and y position
      final double xPos = col * (circleSize + 2);
      final double yPos = row * (circleSize + 2);

      final Rect rect = Rect.fromLTWH(xPos, yPos, circleSize, circleSize);
      final RRect rrect =
          RRect.fromRectXY(rect, circleSize / 2, circleSize / 2);

      if (isFilled) {
        paint.color = color;
        canvas.drawRRect(rrect, paint);
      } else {
        paint.style = PaintingStyle.stroke;
        paint.strokeWidth = 2;
        paint.color = color;
        canvas.drawRRect(rrect, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false; // Set to true if you need dynamic updates
  }
}
