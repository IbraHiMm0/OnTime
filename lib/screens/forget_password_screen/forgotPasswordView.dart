import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ontimeapp/cubit/AuthCubit.dart';
import 'package:ontimeapp/presentation/resources/string_manager.dart';
import 'package:ontimeapp/screens/components/customButtonView.dart';
import '../../cubit/AuthState.dart';
import '../../presentation/resources/color_manager.dart';
import '../../presentation/resources/routes_manager.dart';
import '../../presentation/resources/styles_manager.dart';
import '../../presentation/resources/values_manager.dart';

class ForgotPasswordView extends StatelessWidget {
  ForgotPasswordView({Key? key}) : super(key: key);

  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    void back() {
      Navigator.pushReplacementNamed(context, Routes.loginRoute); // goto screen
    }

    return BlocProvider(
      create: (context) => AuthCubit(),
      child: BlocConsumer<AuthCubit, AuthState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              actions: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                        onPressed: () {
                          back();
                        },
                        icon: const Icon(Icons.arrow_back_ios_rounded),
                        color: ColorManager.whiteF5,
                      ),
                      const SizedBox(
                        width: AppSize.s70,
                      ),
                      Text(
                        AppStrings.forgotPass,
                        style: getSemiBoldStyle(
                            color: ColorManager.white, fontSize: AppSize.s18),
                      ),
                    ],
                  ),
                ),
              ],
              backgroundColor: ColorManager.primary,
              systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: ColorManager.primary,
                  statusBarBrightness: Brightness.light),
            ),
            backgroundColor: ColorManager.white,
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSize.s24),
              //padding from left
              child: ListView(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: AppSize.s60,
                      ),
                      Text(
                        AppStrings.forgotPass,
                        style: getBoldStyle(
                            color: ColorManager.titleBlack,
                            fontSize: AppSize.s32),
                      ),
                      const SizedBox(
                        height: AppSize.s12,
                      ),
                      Text(
                        AppStrings.choose,
                        style: getSemiBoldStyle(
                            color: ColorManager.grey, fontSize: AppSize.s16),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: AppSize.s24,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(AppSize.s8)),
                    child: customButton(
                      preIcon: Icons.phone_in_talk_outlined,
                      text: AppStrings.phone,
                      color: !AuthCubit.get(context).option ? ColorManager.white : ColorManager.lightPrimary,
                      // true
                      onTap: () {
                        AuthCubit.get(context).forgotPassOption();
                      },
                      textColor: ColorManager.titleBlack,
                    ),
                  ),
                  const SizedBox(
                    height: AppSize.s30,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(AppSize.s8)),
                    child: customButton(
                      text: AppStrings.email,
                      onTap: () {
                        AuthCubit.get(context).forgotPass2Option();
                      },
                      preIcon: Icons.mail_outlined,
                      textColor: ColorManager.titleBlack,
                      color: !AuthCubit.get(context).option1 ? ColorManager.white : ColorManager.lightPrimary,
                    ),
                  ),
                  const SizedBox(
                    height: AppSize.s250,
                  ),
                  customButton(
                    text: AppStrings.login,
                    textColor: ColorManager.white,
                    color: ColorManager.primary,
                    onTap: () {
                      if (!AuthCubit.get(context).option &&
                          AuthCubit.get(context).option1) {
                        Navigator.pushReplacementNamed(
                            context, Routes.chooseEmail);
                         // goto screen
                      } else if (!AuthCubit.get(context).option1 &&
                          AuthCubit.get(context).option) {

                        Navigator.pushReplacementNamed(
                            context, Routes.choosePhone);// goto screen
                      }
                    },
                  ),
                ],
              ),
            ),
          );
        },
        listener: (context, state) {},
      ),
    );
  }
}
