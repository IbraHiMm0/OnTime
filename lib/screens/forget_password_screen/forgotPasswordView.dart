import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ontimeapp/presentation/resources/string_manager.dart';
import 'package:ontimeapp/screens/components/customButtonView.dart';
import '../../presentation/resources/assets_manager.dart';
import '../../presentation/resources/color_manager.dart';
import '../../presentation/resources/routes_manager.dart';
import '../../presentation/resources/styles_manager.dart';
import '../../presentation/resources/values_manager.dart';
import '../components/custom-TextField.dart';

class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

GlobalKey<FormState> formKey = GlobalKey();

class _ForgotPasswordViewState extends State<ForgotPasswordView> {

  void back() {
    Navigator.pushReplacementNamed(context, Routes.loginRoute); // goto screen
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: (){
                    back();
                  },
                  icon: const Icon(
                      Icons.arrow_back_ios_rounded
                  ),
                  color: ColorManager.whiteF5,

                ),
                const SizedBox(
                  width: AppSize.s70,
                ),

                 Text(AppStrings.forgotPass,style: getSemiBoldStyle(color: ColorManager.white,fontSize: AppSize.s18),),
              ],
            ),
          ),
        ],
        backgroundColor: ColorManager.primary,
        systemOverlayStyle:  SystemUiOverlayStyle(
          statusBarColor: ColorManager.primary,
          statusBarBrightness: Brightness.light
        ),
      ),
      backgroundColor: ColorManager.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSize.s24), //padding from left
        child: ListView(
          children: [
            Column(

              crossAxisAlignment: CrossAxisAlignment.center,
              children:  [
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
                      color: ColorManager.grey,
                      fontSize: AppSize.s16),
                ),

              ],
            ),
            const SizedBox(
              height: AppSize.s24,
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(AppSize.s8)
              ),
              child: customButton(
                preIcon: Icons.phone_in_talk_outlined,
                text:AppStrings.phone,
                color: ColorManager.white,
                onTap: (){
                  Navigator.pushReplacementNamed(context, Routes.choosePhone); // goto screen
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
                  borderRadius: BorderRadius.circular(AppSize.s8)
              ),
              child: customButton(
                text:AppStrings.email,
                onTap: (){
                  Navigator.pushReplacementNamed(context, Routes.chooseEmail); // goto screen
                },
                preIcon: Icons.mail_outlined,
                textColor: ColorManager.titleBlack,
                color: ColorManager.white,
              ),
            ),
            const SizedBox(
              height: AppSize.s250,
            ),
            customButton(
              text:AppStrings.login,
              textColor: ColorManager.white,
              color: ColorManager.primary,
            ),
          ],
        ),
      ),
    );
  }
}
