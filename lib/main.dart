import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:qr_scanner_itlympics/custom_widgets/custom_splash.dart';
import 'package:qr_scanner_itlympics/views/homepage.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:lottie/lottie.dart';

void main() {
  runApp(
        MaterialApp(
        debugShowCheckedModeBanner: false,
        home: AnimatedSplashScreen(
          splash: CustomSplash(),
          splashIconSize: 1000,
          duration: 4000,
          nextScreen: const HomePage(),
          splashTransition: SplashTransition.fadeTransition,
          pageTransitionType: PageTransitionType.leftToRightWithFade,
        )
      ));
}

