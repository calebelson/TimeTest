import 'package:flutter_time_test/resources/exports.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<TimerModel> timers = [];
  bool startTestsEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: startTestsEnabled ? () => pushView() : null,
              child: const Text("Start Tests"),
            ),
          ],
        ),
      ),
    );
  }

  void pushView() async {
    setState(() {
      startTestsEnabled = false;
    });

    if (timers.length == 20) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => SendData(
            timers: timers,
          ),
        ),
      );

      return;
    }

    late Widget viewToPush;
    switch (timers.length % 4) {
      case (0):
        viewToPush = TablePage(
          timers: timers,
          start: DateTime.now(),
        );
      case 1:
        viewToPush = CirclesGridPage(
          timers: timers,
          start: DateTime.now(),
        );
      case 2:
        viewToPush = SquaresGridPage(
          timers: timers,
          start: DateTime.now(),
        );
      case 3:
        viewToPush = FlutterTests(
          timers: timers,
          start: DateTime.now(),
        );
    }
    Navigator.push(context, MaterialPageRoute(builder: (context) => viewToPush))
        .then(
      (_) async {
        // Views being pushed before fully popped
        await Future.delayed(const Duration(seconds: 1));
        pushView();
      },
    );
  }
}
