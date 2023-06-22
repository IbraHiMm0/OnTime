import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ontimeapp/presentation/resources/assets_manager.dart';
import 'package:ontimeapp/presentation/resources/color_manager.dart';
import 'package:ontimeapp/presentation/resources/routes_manager.dart';
import 'package:ontimeapp/presentation/resources/string_manager.dart';
import 'package:ontimeapp/presentation/resources/styles_manager.dart';
import 'package:ontimeapp/presentation/resources/values_manager.dart';
import 'package:ontimeapp/screens/Register_Screen/Register.dart';
import 'package:ontimeapp/screens/components/custom-TextField.dart';
import 'package:ontimeapp/screens/components/customButtonView.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _pass = TextEditingController();

    return Scaffold(
      body: SingleChildScrollView(
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
                  Text(
                    AppStrings.welcomeBack,
                    style:
                        getBoldStyle(color: ColorManager.black, fontSize: AppSize.s26),
                  ),

                  Text(
                    AppStrings.enterInformation,
                    style: getSemiBoldStyle(
                        color: ColorManager.grey, fontSize: AppSize.s16),
                  ),
                  const SizedBox(
                    height: AppSize.s30,
                  ),
                  Text(
                    AppStrings.email,
                    style:
                        getBoldStyle(color: ColorManager.black, fontSize: AppSize.s16),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  customField(

                    obs: false,
                    numForm: 34,
                    hintText: AppStrings.enterEmail,
                    valid: (value) {
                      if(value!.isEmpty){
                        return 'E-mail is Required';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    AppStrings.pass,
                    style:
                        getBoldStyle(color: ColorManager.black, fontSize: AppSize.s16),
                  ),
                  const SizedBox(
                    height: AppSize.s8,
                  ),
                  customField(
                    obs: isPass2,
                    hintText: AppStrings.enterPass,
                    numForm: 24,

                    controller: _pass,
                    valid: (value){
                      if(value!.isEmpty) {
                        return AppStrings.passRequired;
                      }
                      else if(value.length <= 7){
                        return AppStrings.pass8Char;
                      }
                      else if(value == user.text) {
                        return AppStrings.passMatch1;
                      }
                      else if(value == user1.text) {
                        return AppStrings.passMatch2;
                      }
                      return null;
                    },
                    keyboardType: TextInputType.visiblePassword,
                    suffix: IconButton(
                      onPressed: (){
                        // setState(() {
                        //   isPass2 = !isPass2;
                        // });
                      },
                      icon: Icon(
                        isPass2? Icons.visibility_outlined:Icons.visibility_off_outlined ,
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
                            Navigator.pushReplacementNamed(context, Routes.forgotPassword);
                          },
                          child: Text(
                            AppStrings.passForgot,
                            style: getLightStyle(
                                color: ColorManager.lightGrey, fontSize: AppSize.s16),
                          ))
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  customButton(
                    text:AppStrings.login,
                    textColor: ColorManager.white,
                    color: ColorManager.primary,
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
                            color: ColorManager.lightGrey, fontSize: AppSize.s15),
                      ),
                      InkWell(
                          onTap: () {
                            Navigator.pushReplacementNamed(context, Routes.registerRoute);
                          },
                          child: Text(
                            AppStrings.signUP.toUpperCase(),
                            style: getBoldStyle(
                                color: ColorManager.primary, fontSize: AppSize.s15),
                          )),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
