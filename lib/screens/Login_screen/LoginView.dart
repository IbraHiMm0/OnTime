import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ontimeapp/presentation/resources/assets_manager.dart';
import 'package:ontimeapp/presentation/resources/color_manager.dart';
import 'package:ontimeapp/presentation/resources/routes_manager.dart';
import 'package:ontimeapp/presentation/resources/string_manager.dart';
import 'package:ontimeapp/presentation/resources/styles_manager.dart';
import 'package:ontimeapp/presentation/resources/values_manager.dart';
import 'package:ontimeapp/screens/Register_Screen/Register.dart';
import 'package:ontimeapp/screens/components/custom-TextField.dart';
import 'package:ontimeapp/screens/components/customButtonView.dart';

import '../../cubit/AuthCubit.dart';
import '../../cubit/AuthState.dart';
import '../../presentation/resources/constants.dart';

class LoginView extends StatelessWidget {
  final TextEditingController _pass = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();

  LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            backgroundColor: ColorManager.whiteF5,
            body: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Stack(
                      children: [
                        Column(
                          children: [
                            Image(
                              image: AssetImage(ImageAssets.loginView),
                              height: AppSize.s242,
                            ),
                          ],
                        ),
                        Center(
                          child: Image(
                            image: AssetImage(ImageAssets.loginFont),
                            height: AppSize.s160,
                            width: AppSize.s150,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: AppSize.s20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(AppSize.s15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              AppStrings.welcomeBack,
                              style: getBoldStyle(
                                  color: ColorManager.black,
                                  fontSize: AppSize.s26),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              AppStrings.enterInformation,
                              style: getSemiBoldStyle(
                                  color: ColorManager.grey,
                                  fontSize: AppSize.s16),
                            ),
                          ),
                          const SizedBox(
                            height: AppSize.s30,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              AppStrings.email,
                              style: getBoldStyle(
                                  color: ColorManager.black,
                                  fontSize: AppSize.s16),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          customField(
                            obs: false,
                            numForm: 34,
                            hintText: AppStrings.enterEmail,
                            valid: (value) {
                              if (value!.isEmpty) {
                                return 'E-mail is Required';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.emailAddress,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              AppStrings.pass,
                              style: getBoldStyle(
                                  color: ColorManager.black,
                                  fontSize: AppSize.s16),
                            ),
                          ),
                          const SizedBox(
                            height: AppSize.s8,
                          ),
                          customField(
                            obs: AuthCubit.get(context).isPass2,
                            hintText: AppStrings.enterPass,
                            numForm: 24,
                            controller: _pass,
                            valid: (value) {
                              if (value!.isEmpty) {
                                return AppStrings.passRequired;
                              } else if (value.length <= 7) {
                                return AppStrings.pass8Char;
                              }
                              return null;
                            },
                            keyboardType: TextInputType.visiblePassword,
                            suffix: IconButton(
                              onPressed: () {
                                AuthCubit.get(context).changePass();
                              },
                              icon: Icon(
                                AuthCubit.get(context).suffix,
                                color: ColorManager.iconColor,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: AppSize.s18,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              InkWell(
                                  onTap: () {
                                    Navigator.pushReplacementNamed(
                                        context, Routes.forgotPassword);
                                  },
                                  child: Text(
                                    AppStrings.passForgot,
                                    style: getLightStyle(
                                        color: ColorManager.lightGrey,
                                        fontSize: AppSize.s14),
                                  ))
                            ],
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          customButton(
                            text: AppStrings.login,
                            textColor: ColorManager.white,
                            color: ColorManager.primary,
                            onTap: () {
                              if (formKey.currentState!.validate()) {}
                            },
                          ),
                          const SizedBox(
                            height: AppSize.s18,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                AppStrings.dontHaveAcc,
                                style: getSemiBoldStyle(
                                    color: ColorManager.lightGrey,
                                    fontSize: AppSize.s15),
                              ),
                              InkWell(
                                  onTap: () {
                                    Navigator.pushReplacement(
                                      context,
                                      PageRouteBuilder(
                                        transitionDuration: const Duration(
                                            milliseconds:
                                            AppConstants.signUpAnimation),
                                        pageBuilder: (_, __, ___) =>
                                            RegisterView(),
                                        transitionsBuilder: (_,
                                            Animation<double> animation,
                                            __,
                                            Widget child) {
                                          return SlideTransition(
                                            position: Tween<Offset>(
                                              begin: const Offset(0.0, 1.0),
                                              end: Offset.zero,
                                            ).animate(CurvedAnimation(
                                              parent: animation,
                                              curve: Curves.easeInOut,
                                            )),
                                            child: child,
                                          );
                                        },
                                      ),
                                    );
                                  },
                                  child: Text(
                                    AppStrings.signUP.toUpperCase(),
                                    style: getBoldStyle(
                                        color: ColorManager.primary,
                                        fontSize: AppSize.s15),
                                  )),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
