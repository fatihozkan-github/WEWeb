import 'package:we_web/screens/screen_feedback.dart';
import 'package:we_web/services/service_localization.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:we_web/screens/screen_loading.dart';
import 'package:we_web/screens/screen_welcome.dart';
import 'package:url_strategy/url_strategy.dart';
import 'UI/design_material/DM_assets.dart';
import 'UI/design_material/DM_colors.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  setPathUrlStrategy();

  runApp(
    EasyLocalization(
      supportedLocales: [LocalizationService.supportedLocales.first],
      path: LocalizationService.translationsPath,
      fallbackLocale: LocalizationService.supportedLocales.first,
      child: WeWeb(),
    ),
  );
}

class WeWeb extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: _themeData,
      debugShowCheckedModeBanner: false,
      title: 'WE | Werecycle Official',
      locale: LocalizationService.supportedLocales.first,
      supportedLocales: [LocalizationService.supportedLocales.first],
      localizationsDelegates: context.localizationDelegates,
      // initialRoute: '/',
      routes: {
        '/': (context) => LoadingScreen(),
        '/Hosgeldiniz': (context) => WelcomeScreen(),
        '/Iletisim': (context) => FeedbackScreen(),
      },
    );
  }

  final ThemeData _themeData = ThemeData(
    fontFamily: "MontserratAlternates",
    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor: UIColors.primaryColor,
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontFamily: "MontserratAlternates",
        fontSize: 26,
        fontWeight: FontWeight.bold,
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.all(UIColors.primaryColor.withOpacity(0.1)),
        foregroundColor: MaterialStateProperty.all(Colors.black),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.all(UIColors.primaryColor.withOpacity(0.1)),
        foregroundColor: MaterialStateProperty.all(Colors.white),
        backgroundColor: MaterialStateProperty.all(UIColors.primaryColor),
      ),
    ),
  );
}
