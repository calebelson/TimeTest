import 'package:flutter_time_test/resources/exports.dart';

class TablePage extends StatefulWidget {
  const TablePage({super.key, required this.timers, required this.start});
  final List<TimerModel> timers;
  final DateTime start;

  @override
  State<TablePage> createState() => _TablePage();
}

class _TablePage extends State<TablePage> {
  late TimerModel timer;
  final int rowCount = 30;
  final double visibleRows = 10;

  @override
  void initState() {
    super.initState();
    timer = TimerModel(
      viewTested: "table",
      testNumber: widget.timers.length,
    );
    timer.setStartTime(widget.start);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      timer.viewLoadedTimer();
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final rowHeight = screenHeight / visibleRows;

    return VisibilityDetector(
      key: const Key('table_key'),
      onVisibilityChanged: (visibilityInfo) {
        num visiblePercentage = visibilityInfo.visibleFraction * 100;
        if (visiblePercentage == 100) {
          timer.stopTimer();
          widget.timers.add(timer);
          Navigator.pop(context);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Random Image Table View'),
        ),
        body: ListView.builder(
          itemCount: rowCount,
          itemBuilder: (context, index) {
            return Container(
              height:
                  rowHeight,
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  // Random image on the left
                  Image.asset(
                    RandomImage().getRandomImageUrl(),
                    width: rowHeight,
                    height: rowHeight,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    'Row ${index + 1}',
                    style: const TextStyle(fontSize: 18),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
