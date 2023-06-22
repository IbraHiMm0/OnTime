import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../presentation/resources/assets_manager.dart';
import '../../presentation/resources/color_manager.dart';
import '../../presentation/resources/constants.dart';
import '../../presentation/resources/routes_manager.dart';
import '../../presentation/resources/values_manager.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Timer? _timer;

  _startDelay() {
    _timer = Timer(const Duration(seconds: AppConstants.splashDelay), _goNext);
  }

  _goNext() {
    Navigator.pushReplacementNamed(context, Routes.onboardingRoute);
  }

  @override
  void initState() {
    _startDelay();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: ColorManager.whiteF5,

        ),
      ),
      backgroundColor: ColorManager.whiteF5,
      body: const Center(
        child: Image(
          image: AssetImage(
            ImageAssets.splashLogo,
          ),
          height:AppSize.s250,
          width: AppSize.s250,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }


}
