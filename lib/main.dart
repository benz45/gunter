import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:gunter/components/left_side.dart';
import 'package:gunter/components/right_side.dart';
import 'package:gunter/labels.dart';
import 'package:gunter/provider/activate_provider.dart';
import 'package:gunter/provider/menu_provider.dart';
import 'package:gunter/provider/setting_provider.dart';
import 'package:gunter/theme.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env');
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MenuProvider()),
        ChangeNotifierProvider(create: (_) => ActivateProvider()),
        ChangeNotifierProvider(create: (_) => SettingProvider()),
      ],
      child: const Main(),
    ),
  );
  doWhenWindowReady(() {
    const initialSize = Size(800, 800);
    appWindow.minSize = initialSize;
    appWindow.maxSize = initialSize;
    appWindow.size = initialSize;
    appWindow.alignment = Alignment.center;
    appWindow.show();
  });
}

class Main extends StatefulWidget {
  const Main({super.key});

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: primaryLabel,
      debugShowCheckedModeBanner: false,
      darkTheme: darkTheme,
      themeMode: ThemeMode.dark,
      home: Scaffold(
        body: WindowBorder(
          width: 0,
          color: const Color.fromARGB(255, 46, 43, 43),
          child: const Row(
            children: [LeftSide(), RightSide()],
          ),
        ),
      ),
    );
  }
}
