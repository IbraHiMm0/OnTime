import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pinput/pinput.dart';

import '../../presentation/resources/color_manager.dart';
import '../../presentation/resources/routes_manager.dart';
import '../../presentation/resources/string_manager.dart';
import '../../presentation/resources/styles_manager.dart';
import '../../presentation/resources/values_manager.dart';
import '../components/customButtonView.dart';

class PhoneOptionView extends StatefulWidget {
  @override
  _PhoneOptionViewState createState() => _PhoneOptionViewState();
}

class _PhoneOptionViewState extends State<PhoneOptionView> {
  void back() {
    Navigator.pushReplacementNamed(context, Routes.forgotPassword); // goto screen
  }

  int _currentStep = 0;

  final List<Step> _steps = [
    Step(
      title: const Text(''),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: AppSize.s60,
          ),
          Text(AppStrings.enterPhone1,style: getBoldStyle(color: ColorManager.black,fontSize: AppSize.s20),),
          const SizedBox(
            height: AppSize.s10,
          ),
          Text(
            textAlign: TextAlign.center,
            AppStrings.confirmPhone,
            style: getSemiBoldStyle(
                color: ColorManager.grey,
                fontSize: AppSize.s16),
          ),
          const SizedBox(
            height: AppSize.s24,
          ),
          SizedBox(
            height: 54,
            child: TextFormField(
              inputFormatters: [
                LengthLimitingTextInputFormatter(11),
              ],
              keyboardType: TextInputType.phone,
              cursorColor: ColorManager.lightGrey,
              style:  getRegularStyle(
                color: ColorManager.grey,
                fontSize: AppSize.s16,
              ),

              decoration: InputDecoration(

                hintText: AppStrings.phoneNumber,
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10)

                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10)

                ),

              ),
            ),
          ),
        ],
      ),

    ),
    Step(
      title: const Text(''),
      isActive: true,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: AppSize.s60,
          ),
          Text(AppStrings.enterVer,style: getBoldStyle(color: ColorManager.black,fontSize: AppSize.s20),),
          const SizedBox(
            height: AppSize.s10,
          ),
          Text(
            textAlign: TextAlign.center,
            AppStrings.weHaveSentPhone,
            style: getRegularStyle(
                color: ColorManager.grey,
                fontSize: AppSize.s14),
          ),
          const SizedBox(
            height: AppSize.s24,
          ),
          Pinput(
            onCompleted: (pin) => print(pin),
            length: 4,
            validator: (value) {
              if(value!.isEmpty){
                return 'Pin Number is Required';
              }
              else if(value.length <= 3){
                return 'Pin Number should contain 4 characters';
              }
              return null;
            },
          ),
          const SizedBox(
            height: AppSize.s10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                AppStrings.dontGetCode,
                style: getRegularStyle(
                    color: ColorManager.lightGrey, fontSize: AppSize.s16),
              ),
              const SizedBox(
                width: AppSize.s8,
              ),
              InkWell(
                  onTap: () {
                    Builder(
                      builder: (BuildContext context) {
                        // Navigator.pushReplacementNamed(context, Routes.registerRoute);
                        return Container(); // Placeholder container
                      },
                    );
                  },
                  child: Text(
                    AppStrings.resend,
                    style: getBoldStyle(
                        color: ColorManager.primary, fontSize: AppSize.s16),
                  )),
            ],
          ),

        ],
      ),

    ),

  ];
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
      body: Stepper(
        physics: const BouncingScrollPhysics(),
        currentStep: _currentStep,
        steps: _steps,
        controlsBuilder: (ctx, details) {
          if(_currentStep==_steps.length-1){
            return  Column(
              children: [
                const SizedBox(
                  height: AppSize.s160,
                ),
                customButton(
                  onTap: () {
                    setState(() {
                      if (_currentStep < _steps.length - 1) {
                        _currentStep++;
                      }
                    });
                  },
                  text:AppStrings.verfiy,
                  textColor: ColorManager.white,
                  color: ColorManager.primary,
                ),
              ],
            );
          }
          else{
            return Column(
              children: [
                const SizedBox(
                  height: AppSize.s250,
                ),
                customButton(
                  onTap: () {
                    setState(() {
                      if (_currentStep < _steps.length - 1) {
                        _currentStep++;
                      }
                    });
                  },
                  text:AppStrings.submit.toUpperCase(),
                  textColor: ColorManager.white,
                  color: ColorManager.primary,
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
