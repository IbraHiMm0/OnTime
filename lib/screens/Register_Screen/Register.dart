import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ontimeapp/presentation/resources/constants.dart';
import 'package:ontimeapp/presentation/resources/string_manager.dart';
import 'package:ontimeapp/screens/Login_screen/LoginView.dart';
import 'package:ontimeapp/screens/components/custom-TextField.dart';
import 'package:ontimeapp/screens/components/customButtonView.dart';
import '../../cubit/AuthCubit.dart';
import '../../cubit/AuthState.dart';
import '../../presentation/resources/assets_manager.dart';
import '../../presentation/resources/color_manager.dart';
import '../../presentation/resources/styles_manager.dart';
import '../../presentation/resources/values_manager.dart';

class RegisterView extends StatelessWidget {

  final GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController _pass = TextEditingController();
  final TextEditingController _repeatedPass = TextEditingController();
  final TextEditingController user = TextEditingController();
  final TextEditingController user1 = TextEditingController();
  final List<String> _departments = [
    'CS',
    'IS',
    'Front',
    'Back',
  ];
  RegisterView({super.key});

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (context) => AuthCubit(),
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            backgroundColor: ColorManager.whiteF5,
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSize.s18),
              child: Form(
                key: formKey,
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: ListView(
                    children: [
                      const SizedBox(
                        height: AppSize.s40,
                      ),
                      Image(
                        image: const AssetImage(ImageAssets.splashLogo),
                        height: AppSize.s30,
                        width: AppSize.s30,
                        color: ColorManager.black,
                      ),
                      const SizedBox(
                        height: AppSize.s50,
                      ),
                      Row(
                        children: [
                          Text(
                            'Create an account',
                            style: getBoldStyle(
                                color: ColorManager.titleBlack,
                                fontSize: AppSize.s24),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: AppSize.s30,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          AppStrings.fullName,
                          style: getRegularStyle(
                              color: ColorManager.titleBlack, fontSize: AppSize.s16),
                        ),
                      ),
                      const SizedBox(
                        height: AppSize.s8,
                      ),
                      customField(
                        hintText: AppStrings.plsEnterFullName,
                        numForm: 26,
                        // just 14
                        controller: user,
                        valid: (value) {
                          if (value!.isEmpty) {
                            return AppStrings.fullReq;
                          } else if (value.length <= 3) {
                            return AppStrings.uTyped;
                          }
                          return null;
                        },

                        keyboardType: TextInputType.text,
                      ),
                      const SizedBox(
                        height: AppSize.s20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          AppStrings.email,
                          style: getRegularStyle(
                              color: ColorManager.titleBlack, fontSize: AppSize.s16),
                        ),
                      ),
                      const SizedBox(
                        height: AppSize.s8,
                      ),
                      customField(
                        obs: false,
                        numForm: 34,
                        hintText: AppStrings.enterVEmail,
                        valid: (value) {
                          if (value!.isEmpty) {
                            return AppStrings.emailReq;
                          }
                          return null;
                        },
                        keyboardType: TextInputType.emailAddress,
                      ),
                      const SizedBox(
                        height: AppSize.s20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          AppStrings.phoneNumber,
                          style: getRegularStyle(
                              color: ColorManager.titleBlack, fontSize: AppSize.s16),
                        ),
                      ),
                      const SizedBox(
                        height: AppSize.s8,
                      ),
                      customField(
                        hintText: AppStrings.enterPhone,
                        numForm: 11,
                        valid: (value) {
                          String pattern =
                              r'^(01)[0-9]{9}$'; //must enter 01 and 11 num
                          RegExp regExp = RegExp(pattern);

                          if (value!.isEmpty) {
                            return AppStrings.phoneReq;
                          } else if (!regExp.hasMatch(value)) {
                            return AppStrings.validMobReq;
                          }
                          return null;
                        },
                        keyboardType: TextInputType.phone,
                      ),
                      const SizedBox(
                        height: AppSize.s20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          AppStrings.department,
                          style: getRegularStyle(
                              color: ColorManager.titleBlack, fontSize: AppSize.s16),
                        ),
                      ),
                      const SizedBox(
                        height: AppSize.s8,
                      ),
                      //////////////////////////////////////////////////////////////////////////////////////////////////

                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: AuthCubit.get(context).selectedDepartment,
                            onChanged: (newValue) {
                              AuthCubit.get(context).changeOption(newValue);

                            },
                            dropdownColor: Colors.grey[200],
                            isExpanded: true,
                            icon: SizedBox(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.keyboard_arrow_down_sharp,
                                  color: ColorManager.grey,
                                ),
                              ),
                            ),
                            style: getRegularStyle(
                              color: ColorManager.lightGrey,
                              fontSize: AppSize.s16,
                            ),
                            hint: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text(
                                AppStrings.department,
                                style: getRegularStyle(
                                  color: ColorManager.lightGrey,
                                  fontSize: AppSize.s16,
                                ),
                              ),
                            ),
                            items: _departments
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: SizedBox(
                                  width: double.infinity,
                                  child: Padding(
                                    padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                    child: Text(
                                      value,
                                      textAlign: TextAlign.start,
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                      Container(
                        // Your other widgets...
                        child: (!_departments.contains(AuthCubit.get(context).selectedDepartment))
                            ? Padding(
                          padding: const EdgeInsets.only(bottom: 8.0, left: 8),
                          child: Text(
                            AppStrings.makeSure,
                            style: getSemiBoldStyle(
                                fontSize: AppSize.s12, color: Colors.red),
                          ),
                        )
                            : Container(),
                      ),

                      /////////////////////////////////////////////////////////////////////////
                      const SizedBox(
                        height: AppSize.s20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          AppStrings.pass,
                          style: getRegularStyle(
                              color: ColorManager.titleBlack, fontSize: AppSize.s16),
                        ),
                      ),
                      const SizedBox(
                        height: AppSize.s8,
                      ),
                      customField(
                        obs: AuthCubit.get(context).isPass,
                        hintText: AppStrings.enterPass,
                        numForm: 24,
                        controller: _pass,
                        valid: (value) {
                          if (value!.isEmpty) {
                            return AppStrings.passReq;
                          } else if (value.length <= 7) {
                            return AppStrings.valid8char;
                          } else if (value == user.text) {
                            return AppStrings.validMatch;
                          } else if (value == user1.text) {
                            return AppStrings.valid2Match;
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
                        height: AppSize.s20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          'Repeat Password',
                          style: getRegularStyle(
                              color: ColorManager.titleBlack, fontSize: AppSize.s16),
                        ),
                      ),
                      const SizedBox(
                        height: AppSize.s8,
                      ),
                      customField(
                        obs: AuthCubit.get(context).isPass2,
                        controller: _repeatedPass,
                        hintText: AppStrings.repeatPass,
                        numForm: 24,
                        valid: (val) {
                          if (val!.isEmpty) {
                            return AppStrings.repeatPassReq;
                          } else if (val != _pass.text) {
                            return AppStrings.passNotMatching;
                          } else if (val.length <= 7) {
                            return AppStrings.valid8char;
                          }
                          return null;
                        },
                        keyboardType: TextInputType.visiblePassword,
                        suffix: IconButton(
                          onPressed: () {
                            AuthCubit.get(context).changePass2();
                          },
                          icon: Icon(
                            AuthCubit.get(context).suffix2,
                            color: ColorManager.iconColor,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: AppSize.s16,
                      ),
                      customButton(
                        textColor: ColorManager.white,
                        text: AppStrings.signUP.toUpperCase(),
                        color: ColorManager.primary,
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            // if (!_departments.contains(_selectedDepartment)) {
                            //   setState(() {
                            //   });
                            // }
                          }
                        },
                      ),
                      const SizedBox(
                        height: AppSize.s10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            AppStrings.alreadyHave,
                            style: getRegularStyle(
                                color: ColorManager.black, fontSize: AppSize.s15),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushReplacement(
                                context,
                                PageRouteBuilder(
                                  transitionDuration: const Duration(
                                      milliseconds: AppConstants.signUpAnimation),
                                  pageBuilder: (_, __, ___) =>  LoginView(),
                                  transitionsBuilder: (_, Animation<double> animation,
                                      __, Widget child) {
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
                              AppStrings.signIN.toUpperCase(),
                              style: getBoldStyle(
                                  color: ColorManager.primary, fontSize: AppSize.s16),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: AppSize.s50,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}






