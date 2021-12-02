import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/widgets.dart';

class LocalizationService {
  static List<Locale> supportedLocales = [Locale('tr', 'TR'), Locale('en', 'US')];
  static LocalizedText localizedTexts = LocalizedText();
  static String translationsPath = 'translations';

// static Future<void> changeLocale(BuildContext context, int index) async {
//   switch (index) {
//     case 0:
//       await context.setLocale(supportedLocales[0]);
//       break;
//     case 1:
//       await EasyLocalization.of(context).setLocale(supportedLocales[1]);
//       break;
//     default:
//       await EasyLocalization.of(context).setLocale(supportedLocales[0]);
//       break;
//   }
// }
}

class LocalizedText {
  String tab1Title = "tab1title".tr();
  String tab2Title = "tab2title".tr();
  String tab3Title = "tab3title".tr();
  String tab4Title = "tab4title".tr();
  String tab5Title = "tab5title".tr();
  String signUp = "signUpTitle".tr();
}
