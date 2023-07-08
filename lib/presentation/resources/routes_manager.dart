import 'package:flutter/material.dart';
import 'package:ontimeapp/presentation/resources/string_manager.dart';
import 'package:ontimeapp/screens/Create_Profile/createProfileView.dart';
import 'package:ontimeapp/screens/Login_screen/LoginView.dart';
import 'package:ontimeapp/screens/Register_Screen/Register.dart';
import 'package:ontimeapp/screens/choose_email/EmailOptionView.dart';
import 'package:ontimeapp/screens/forget_password_screen/forgotPasswordView.dart';
import 'package:ontimeapp/screens/onboarding_screen/OnboardingView.dart';

import '../../screens/choose_phone/PhoneOptionView.dart';
import '../../screens/splash_screen/SplashView.dart';

class Routes {
  static const String splashRoute = "/";
  static const String loginRoute = "/login";
  static const String registerRoute = "/register";
  static const String onboardingRoute = "/onBoarding";
  static const String forgotPassword = "/forgotPassword";
  static const String chooseEmail = "/chooseEmail";
  static const String choosePhone = "/choosePhone";
  static const String createProfile = "/createProfile";

}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case Routes.onboardingRoute:
        return MaterialPageRoute(builder: (_) => const OnBoardingView());
      case Routes.loginRoute:
        return MaterialPageRoute(builder: (_) =>  LoginView());
      case Routes.registerRoute:
        return MaterialPageRoute(builder: (_) =>  RegisterView());
      case Routes.forgotPassword:
        return MaterialPageRoute(builder: (_) =>  ForgotPasswordView());
      case Routes.chooseEmail:
        return MaterialPageRoute(builder: (_) =>  EmailOptionView());
      case Routes.choosePhone:
        return MaterialPageRoute(builder: (_) =>  PhoneOptionView());
      case Routes.createProfile:
        return MaterialPageRoute(builder: (_) =>   CreateProfileView());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text(AppStrings.noRouteFound),
        ),
        body: const Center(child: Text(AppStrings.noRouteFound)),
      ),
    );
  }
}
