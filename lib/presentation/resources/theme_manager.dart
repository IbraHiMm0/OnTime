import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ontimeapp/presentation/resources/styles_manager.dart';
import 'package:ontimeapp/presentation/resources/values_manager.dart';

import 'color_manager.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    //Primary
    primaryColor: ColorManager.primary,
    // primaryColorLight: ColorManager.lightGrey,
    // primaryColorDark: ColorManager.darkGery,
    // disabledColor: ColorManager.grey1,
    // splashColor: ColorManager.lightPrimary,
    //
    // cardTheme: CardTheme(
    //   color: ColorManager.white,
    //   shadowColor: ColorManager.grey,
    //   elevation: AppSize.s4,
    // ),
    //

    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: ColorManager.whiteF5,
      elevation: AppSize.s0,
      shadowColor: ColorManager.grey,
      systemOverlayStyle:  const SystemUiOverlayStyle(
        // systemNavigationBarColor: ColorManager.lightGrey, // Navigation bar
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark // Status bar
      ),
      titleTextStyle:
          getLightStyle(color: ColorManager.whiteF5, fontSize: AppSize.s18),
    ),
    // //ButtonTheme
    // buttonTheme: ButtonThemeData(
    //   shape: const StadiumBorder(),
    //   disabledColor: ColorManager.whiteF6,
    //   buttonColor: ColorManager.primary,
    //   splashColor: ColorManager.whiteF6,
    // ),
    // floatingActionButtonTheme: FloatingActionButtonThemeData(
    //   backgroundColor: ColorManager.primary,
    // ),
    // elevatedButtonTheme: ElevatedButtonThemeData(
    //   style: ElevatedButton.styleFrom(
    //       textStyle: getRegularStyle(color: ColorManager.white, fontSize: AppSize.s16),
    //       backgroundColor: ColorManager.primary,
    //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSize.s12))),
    // ),
    // //TextTheme
    // textTheme: TextTheme(
    //   displayLarge: getSemiBoldStyle(
    //       color: ColorManager.white, fontSize: AppSize.s20),
    //   headlineLarge: getSemiBoldStyle(
    //       color: ColorManager.darkGery, fontSize: AppSize.s16),
    //   titleMedium:
    //       getMediumStyle(color: ColorManager.lightGrey, fontSize: AppSize.s14),
    //   bodyLarge: getRegularStyle(color: ColorManager.grey1),
    //   bodySmall: getRegularStyle(color: ColorManager.grey),
    // ),
    //
    // inputDecorationTheme: InputDecorationTheme(
    //
    //     contentPadding: const EdgeInsets.all(8),
    //
    //     hintStyle:
    //         getRegularStyle(color: ColorManager.grey, fontSize: AppSize.s14),
    //
    //     labelStyle:
    //         getMediumStyle(color: ColorManager.grey, fontSize: AppSize.s14),
    //
    //     errorStyle: getRegularStyle(color: ColorManager.error),
    //
    //
    //     enabledBorder: OutlineInputBorder(
    //         borderSide:
    //             BorderSide(color: ColorManager.grey, width: AppSize.s1_5),
    //         borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))),
    //
    //
    //     focusedBorder: OutlineInputBorder(
    //         borderSide:
    //             BorderSide(color: ColorManager.grey, width: AppSize.s1_5),
    //         borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))),
    //
    //
    //     errorBorder: OutlineInputBorder(
    //         borderSide:
    //             BorderSide(color: ColorManager.error, width: AppSize.s1_5),
    //         borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))),
    //
    //
    //     focusedErrorBorder: OutlineInputBorder(
    //         borderSide:
    //             BorderSide(color: ColorManager.primary, width: AppSize.s1_5),
    //         borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)))),
  );
}
