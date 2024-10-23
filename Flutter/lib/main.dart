import 'package:flutter_time_test/resources/exports.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  WakelockPlus.enable();
  
  runApp(const MyApp());
}

final visibilityListeners =
    <void Function(VisibilityInfo info)>[];

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Time Test',
      theme: ThemeData.light(
        useMaterial3: true,
      ),
      darkTheme: ThemeData.dark(),
      home: const HomePage(),
    );
  }
}
