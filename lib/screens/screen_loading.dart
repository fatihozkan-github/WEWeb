import 'package:easy_localization/src/public_ext.dart';
import 'package:we_web/UI/design_material/DM_assets.dart';
import 'package:flutter/material.dart';
import 'package:we_web/UI/design_material/DM_colors.dart';
import 'package:we_web/screens/screen_feedback.dart';
import 'dart:async';

import 'package:we_web/screens/screen_welcome.dart';
import 'package:we_web/services/service_localization.dart';

class LoadingScreen extends StatefulWidget {
  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    Timer(Duration(seconds: 6), () => Navigator.pushNamed(context, '/Hosgeldiniz'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Center(
          child: Hero(tag: 'we_logo', child: Image.asset(UIAssets.loadingGif, height: 240)),
        ),
      );
}
