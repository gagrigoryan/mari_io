import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mari_io/pages/get-started/get_started.dart';
import 'package:mari_io/pages/local-auth/local_auth.dart';
import 'package:mari_io/pages/onboarding/onboarding_step_1.dart';
import 'package:mari_io/pages/onboarding/onboarding_step_2.dart';
import 'package:mari_io/styles/theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(const MyApp());
}

ThemeManager _themeManager = ThemeManager();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mari.io',
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      // themeMode: _themeManager.themeMode,
      // theme: ThemeData(
      //   scaffoldBackgroundColor: AppColors.white,
      //   fontFamily: "NotoSansJP",
      //   focusColor: AppColors.primary,
      //   primaryColor: AppColors.primary,
      //   textButtonTheme: TextButtonThemeData(
      //     style: TextButton.styleFrom(
      //       primary: AppColors.secondary,
      //     ),
      //   ),
      // ),
      // darkTheme: ThemeData(scaffoldBackgroundColor: AppColors.textBlack),
      initialRoute: '/local-auth',
      routes: {
        '/onboarding/1': (context) => const OnBoardingStep1(),
        '/onboarding/2': (context) => const OnBoardingStep2(),
        '/get-started': (context) => const GetStarted(),
        '/local-auth': (context) => const LocalAuth()
      },
    );
  }
}
