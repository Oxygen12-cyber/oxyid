import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/services.dart';
import 'package:oxyid/pages/adminhome.dart';
import 'package:oxyid/pages/authgate.dart';
import 'package:oxyid/pages/emptypage.dart';
import 'package:oxyid/pages/historypage.dart';
import 'package:oxyid/pages/homepage.dart';
import 'package:oxyid/pages/loginpage.dart';
import 'package:oxyid/pages/marketplace.dart';
import 'package:oxyid/pages/scannerpage.dart';
import 'package:oxyid/pages/settingspage.dart';
import 'package:oxyid/pages/streakspage.dart';
import 'package:oxyid/theme/theme.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

  await Supabase.initialize(
    url: 'https://gihnmyeinrsstcdgrjdc.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImdpaG5teWVpbnJzc3RjZGdyamRjIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjQ0NTA1MDEsImV4cCI6MjA4MDAyNjUwMX0.Mg-fc6bqBr8wTBz6GmIKqsdcyAH3bY41bWFJD6uOdqQ',
  );
  // runApp(MyApp());
  runApp(DevicePreview(builder: (context) => MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // locale: DevicePreview.locale(context),
      // builder: DevicePreview.appBuilder,
      title: 'Flutter Demo',
      theme: lighttheme,
      darkTheme: darktheme,
      themeMode: ThemeMode.light,
      routes: {
        '/homePage': (context) => HomePage(),
        '/historyPage': (context) => HistoryPage(),
        '/settingsPage': (context) => SettingsPage(),
        '/marketPage': (context) => MarketPlace(),
        '/streaksPage': (context) => StreaksPage(),
        '/scannerPage': (context) => ScannerPage(),
        '/loginPage': (context) => LoginPage(),
        '/adminPage': (context) => AdminHomePage(),
        '/emptyPage': (context) => EmptyPage(),
      },
      home: const AdminHomePage(),
    );
  }
}
