import 'package:design/SplashScreen.dart';
import 'package:design/providerrr.dart';
import 'package:design/showmodalbottomsheet.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// late SharedPreferences sharedPreferences;
void main() async {
  // sharedPreferences = await SharedPreferences.getInstance();
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ProviderSetting(),
        ),
        ChangeNotifierProvider(
          create: (context) => LoginProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => SignUp(),
        ),
        ChangeNotifierProvider(
          create: (context) => ShowModalProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'design',
        home: SplashScreen(),
      ),
    );
  }
}
