import 'package:flutter_time_test/resources/exports.dart';

class SendData extends StatefulWidget {
  final List<TimerModel> timers;

  const SendData({super.key, required this.timers});

  @override
  State<SendData> createState() => _SendDataState();
}

class _SendDataState extends State<SendData> {
  late MetricsData data;

  @override
  void initState() {
    super.initState();
    data = MetricsData();
  }

  void addAllTimers(MetricsData data) {
    for (var timer in widget.timers) {
      data.addData(timer);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Send Data'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            ElevatedButton(
              onPressed: () async {
                addAllTimers(data);
                String filePath = await data.getFileName();
                Share.shareXFiles([XFile(filePath)], subject: 'Test Data');
              },
              child: const Text('Send the data file'),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomePage(),
                  ),
                );
              },
              child: const Text('Redo test'),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
