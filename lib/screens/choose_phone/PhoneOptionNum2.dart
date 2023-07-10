import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ontimeapp/cubit/AuthCubit.dart';
import 'package:ontimeapp/cubit/AuthState.dart';
import 'package:pinput/pinput.dart';
import '../../presentation/resources/color_manager.dart';
import '../../presentation/resources/routes_manager.dart';
import '../../presentation/resources/string_manager.dart';
import '../../presentation/resources/styles_manager.dart';
import '../../presentation/resources/values_manager.dart';
import '../components/customButtonView.dart';

class PhoneOptionNum2View extends StatelessWidget {

  final GlobalKey<FormState> formKey = GlobalKey();

  PhoneOptionNum2View({super.key});

  @override
  Widget build(BuildContext context) {

    void back() {
      Navigator.pushReplacementNamed(
          context, Routes.forgotPassword); // goto screen
    }

    return BlocProvider(
      create: (context) => AuthCubit(),
      child: BlocConsumer<AuthCubit,AuthState>(
        builder: (context, state) {
          return Form(
            key: formKey,
            child: Scaffold(
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
                padding: const EdgeInsets.only(left: 20.0,top: 20),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(left: 8, right: 5),
                                height: 30,
                                width: 30,

                                decoration: BoxDecoration(
                                  color: ColorManager.green,
                                  shape: BoxShape.circle,
                                ),
                                child: Center(child: Text("01",style: getBoldStyle(color: ColorManager.white,fontSize: AppSize.s14),)),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                height: 380,
                                margin: const EdgeInsets.only(left: 18),
                                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
                                decoration:  BoxDecoration(
                                    border: Border(
                                        left: BorderSide(
                                          color: ColorManager.green,
                                          width: 10,
                                        ))
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 20.0,bottom: 100),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      const SizedBox(
                                        height: AppSize.s60,
                                      ),
                                      Text(
                                        AppStrings.enterVer,
                                        style:
                                        getBoldStyle(color: ColorManager.black, fontSize: AppSize.s20),
                                      ),
                                      const SizedBox(
                                        height: AppSize.s10,
                                      ),
                                      Text(
                                        textAlign: TextAlign.center,
                                        AppStrings.weHaveSentPhone,
                                        style: getRegularStyle(
                                            color: ColorManager.grey, fontSize: AppSize.s14),
                                      ),
                                      const SizedBox(
                                        height: AppSize.s24,
                                      ),
                                      Pinput(
                                        onCompleted: (pin) => print(pin),
                                        length: 4,
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return AppStrings.pinReq;
                                          } else if (value.length <= 3) {
                                            return AppStrings.pinShould;
                                          }
                                          return null;
                                        },
                                      ),
                                      const SizedBox(
                                        height: AppSize.s18,
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
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(left: 8, right: 5),
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              color: ColorManager.primary,
                              shape: BoxShape.circle,
                            ),
                            child: Center(child: Text("02",style: getBoldStyle(color: ColorManager.white,fontSize: AppSize.s14),)),
                          ),
                        ],
                      ),
                      Container(
                        height: 50,
                        margin: const EdgeInsets.only(left: 18),
                        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
                        decoration:  BoxDecoration(
                            border: Border(
                                left: BorderSide(
                                  color: ColorManager.primary,
                                  width: 10,
                                ))),
                      ),
                      Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(left: 8, right: 5),
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              color: ColorManager.greyD,
                              shape: BoxShape.circle,
                            ),
                            child: Center(child: Text("03",style: getBoldStyle(color: ColorManager.titleBlack,fontSize: AppSize.s14),)),
                          ),
                        ],
                      ),
                      Container(
                        height: 50,
                        margin: const EdgeInsets.only(left: 18),
                        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
                        decoration:  BoxDecoration(
                            border: Border(
                                left: BorderSide(
                                  color: ColorManager.greyD,
                                  width: 10,
                                ))),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: customButton(
                          onTap: () {
                            if (formKey.currentState!.validate()) {

                            }
                          },
                          text: AppStrings.verfiy,
                          textColor: ColorManager.white,
                          color: ColorManager.primary,
                        ),
                      ),

                    ],
                  ),
                ),
              ),
            ),
          );
        },
        listener: (context, state) {

        },
      ),
    );
  }
}







// class _PhoneOptionViewState extends State<PhoneOptionView> {
//
//
//   int _currentStep = 0;
//
//   final List<Step> _steps = [
//     Step(
//       title: const Text(''),
//       content: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           const SizedBox(
//             height: AppSize.s60,
//           ),
//           Text(
//             AppStrings.enterPhone1,
//             style:
//                 getBoldStyle(color: ColorManager.black, fontSize: AppSize.s20),
//           ),
//           const SizedBox(
//             height: AppSize.s10,
//           ),
//           Text(
//             textAlign: TextAlign.center,
//             AppStrings.confirmPhone,
//             style: getSemiBoldStyle(
//                 color: ColorManager.grey, fontSize: AppSize.s16),
//           ),
//           const SizedBox(
//             height: AppSize.s24,
//           ),
//           SizedBox(
//             height: 54,
//             child: TextFormField(
//               inputFormatters: [
//                 LengthLimitingTextInputFormatter(11),
//               ],
//               validator: (value) {
//                 String pattern =
//                     r'^(01)[0-9]{9}$'; //must enter 01 and 11 num
//                 RegExp regExp = RegExp(pattern);
//
//                 if (value!.isEmpty) {
//                   return 'Phone Number is Required';
//                 } else if (!regExp.hasMatch(value)) {
//                   return 'Please enter valid mobile number';
//                 }
//                 return null;
//               },
//               keyboardType: TextInputType.phone,
//               cursorColor: ColorManager.lightGrey,
//               style: getRegularStyle(
//                 color: ColorManager.grey,
//                 fontSize: AppSize.s16,
//               ),
//               decoration: InputDecoration(
//                 errorStyle: TextStyle(
//                   color: Colors.red,
//                   backgroundColor: ColorManager.white,
//                   fontFamily: "NunitoSans",
//                   fontWeight: FontWeight.w600,
//                 ),                hintText: AppStrings.phoneNumber,
//                 enabledBorder:
//                     OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
//                 focusedBorder:
//                     OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
//               ),
//             ),
//           ),
//         ],
//       ),
//     ),
//     Step(
//       title: const Text(''),
//       isActive: true,
//       content: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           const SizedBox(
//             height: AppSize.s60,
//           ),
//           Text(
//             AppStrings.enterVer,
//             style:
//                 getBoldStyle(color: ColorManager.black, fontSize: AppSize.s20),
//           ),
//           const SizedBox(
//             height: AppSize.s10,
//           ),
//           Text(
//             textAlign: TextAlign.center,
//             AppStrings.weHaveSentPhone,
//             style: getRegularStyle(
//                 color: ColorManager.grey, fontSize: AppSize.s14),
//           ),
//           const SizedBox(
//             height: AppSize.s24,
//           ),
//           Pinput(
//             onCompleted: (pin) => print(pin),
//             length: 4,
//             validator: (value) {
//               if (value!.isEmpty) {
//                 return 'Pin Number is Required';
//               } else if (value.length <= 3) {
//                 return 'Pin Number should contain 4 characters';
//               }
//               return null;
//             },
//           ),
//           const SizedBox(
//             height: AppSize.s10,
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text(
//                 AppStrings.dontGetCode,
//                 style: getRegularStyle(
//                     color: ColorManager.lightGrey, fontSize: AppSize.s16),
//               ),
//               const SizedBox(
//                 width: AppSize.s8,
//               ),
//               InkWell(
//                   onTap: () {
//                     Builder(
//                       builder: (BuildContext context) {
//                         // Navigator.pushReplacementNamed(context, Routes.registerRoute);
//                         return Container(); // Placeholder container
//                       },
//                     );
//                   },
//                   child: Text(
//                     AppStrings.resend,
//                     style: getBoldStyle(
//                         color: ColorManager.primary, fontSize: AppSize.s16),
//                   )),
//             ],
//           ),
//         ],
//       ),
//     ),
//     Step(
//       title: const Text(''),
//
//       content: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           const SizedBox(
//             height: AppSize.s60,
//           ),
//           Text(
//             AppStrings.enterPhone1,
//             style:
//             getBoldStyle(color: ColorManager.black, fontSize: AppSize.s20),
//           ),
//           const SizedBox(
//             height: AppSize.s10,
//           ),
//           Text(
//             textAlign: TextAlign.center,
//             AppStrings.confirmPhone,
//             style: getSemiBoldStyle(
//                 color: ColorManager.grey, fontSize: AppSize.s16),
//           ),
//           const SizedBox(
//             height: AppSize.s24,
//           ),
//           SizedBox(
//             height: 54,
//             child: TextFormField(
//               inputFormatters: [
//                 LengthLimitingTextInputFormatter(11),
//               ],
//               validator: (value) {
//                 String pattern =
//                     r'^(01)[0-9]{9}$'; //must enter 01 and 11 num
//                 RegExp regExp = RegExp(pattern);
//
//                 if (value!.isEmpty) {
//                   return 'Phone Number is Required';
//                 } else if (!regExp.hasMatch(value)) {
//                   return 'Please enter valid mobile number';
//                 }
//                 return null;
//               },
//               keyboardType: TextInputType.phone,
//               cursorColor: ColorManager.lightGrey,
//               style: getRegularStyle(
//                 color: ColorManager.grey,
//                 fontSize: AppSize.s16,
//               ),
//               decoration: InputDecoration(
//                 errorStyle: TextStyle(
//                   color: Colors.red,
//                   backgroundColor: ColorManager.white,
//                   fontFamily: "NunitoSans",
//                   fontWeight: FontWeight.w600,
//                 ),                hintText: AppStrings.phoneNumber,
//                 enabledBorder:
//                 OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
//                 focusedBorder:
//                 OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
//               ),
//             ),
//           ),
//         ],
//       ),
//     ),
//   ];
//
//
//   // Color getColor(Set<MaterialState> states, int currentStep, List _steps) {
//   //   const Set<MaterialState> interactiveStates = <MaterialState>{
//   //     MaterialState.pressed,
//   //     MaterialState.hovered,
//   //     MaterialState.focused,
//   //   };
//   //
//   //   if (states.any(interactiveStates.contains)) {
//   //     return Colors.blue;
//   //   }
//   //
//   //   if (_currentStep == _steps.length-1) {
//   //     return ColorManager.primary;
//   //   }
//   //
//   //   return Colors.green;
//   // }
// }
//Stepper(
//           physics: const BouncingScrollPhysics(),
//           currentStep: _currentStep,
//           steps: _steps,
//           connectorThickness: 8,
//           connectorColor: MaterialStateProperty.resolveWith((states) => getColor(states, _currentStep, _steps)),
//           controlsBuilder: (ctx, details) {
//             if (_currentStep == _steps.length - 1) {
//               return Column(
//                 children: [
//                   const SizedBox(
//                     height: AppSize.s160,
//                   ),
//                   customButton(
//                     onTap: () {
//                       // if (formKey.currentState!.validate()) {
//                         setState(() {
//                           if (_currentStep < _steps.length - 1) {
//                             _currentStep++;
//                           }
//                         });
//                       // }
//                     },
//                     text: AppStrings.verfiy,
//                     textColor: ColorManager.white,
//                     color: ColorManager.primary,
//                   ),
//                 ],
//               );
//             }
//             else {
//               return Column(
//                 children: [
//                   const SizedBox(
//                     height: AppSize.s250,
//                   ),
//                   customButton(
//                     onTap: () {
//                       // if (formKey.currentState!.validate()) {
//                         setState(() {
//                           if (_currentStep < _steps.length - 1) {
//                             _currentStep++;
//                           }
//                         });
//                       // }
//                     },
//                     text: AppStrings.submit.toUpperCase(),
//                     textColor: ColorManager.white,
//                     color: ColorManager.primary,
//                   ),
//                 ],
//               );
//             }
//           },
//         ),

//final List<Step> _steps = [
//     Step(
//       title: const Text(''),
//       content: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           const SizedBox(
//             height: AppSize.s60,
//           ),
//           Text(
//             AppStrings.enterPhone1,
//             style:
//                 getBoldStyle(color: ColorManager.black, fontSize: AppSize.s20),
//           ),
//           const SizedBox(
//             height: AppSize.s10,
//           ),
//           Text(
//             textAlign: TextAlign.center,
//             AppStrings.confirmPhone,
//             style: getSemiBoldStyle(
//                 color: ColorManager.grey, fontSize: AppSize.s16),
//           ),
//           const SizedBox(
//             height: AppSize.s24,
//           ),
//           SizedBox(
//             height: 54,
//             child: TextFormField(
//               inputFormatters: [
//                 LengthLimitingTextInputFormatter(11),
//               ],
//               validator: (value) {
//                 String pattern =
//                     r'^(01)[0-9]{9}$'; //must enter 01 and 11 num
//                 RegExp regExp = RegExp(pattern);
//
//                 if (value!.isEmpty) {
//                   return 'Phone Number is Required';
//                 } else if (!regExp.hasMatch(value)) {
//                   return 'Please enter valid mobile number';
//                 }
//                 return null;
//               },
//               keyboardType: TextInputType.phone,
//               cursorColor: ColorManager.lightGrey,
//               style: getRegularStyle(
//                 color: ColorManager.grey,
//                 fontSize: AppSize.s16,
//               ),
//               decoration: InputDecoration(
//                 errorStyle: TextStyle(
//                   color: Colors.red,
//                   backgroundColor: ColorManager.white,
//                   fontFamily: "NunitoSans",
//                   fontWeight: FontWeight.w600,
//                 ),                hintText: AppStrings.phoneNumber,
//                 enabledBorder:
//                     OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
//                 focusedBorder:
//                     OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
//               ),
//             ),
//           ),
//         ],
//       ),
//     ),
//     Step(
//       title: const Text(''),
//       isActive: true,
//       content: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           const SizedBox(
//             height: AppSize.s60,
//           ),
//           Text(
//             AppStrings.enterVer,
//             style:
//                 getBoldStyle(color: ColorManager.black, fontSize: AppSize.s20),
//           ),
//           const SizedBox(
//             height: AppSize.s10,
//           ),
//           Text(
//             textAlign: TextAlign.center,
//             AppStrings.weHaveSentPhone,
//             style: getRegularStyle(
//                 color: ColorManager.grey, fontSize: AppSize.s14),
//           ),
//           const SizedBox(
//             height: AppSize.s24,
//           ),
//           Pinput(
//             onCompleted: (pin) => print(pin),
//             length: 4,
//             validator: (value) {
//               if (value!.isEmpty) {
//                 return 'Pin Number is Required';
//               } else if (value.length <= 3) {
//                 return 'Pin Number should contain 4 characters';
//               }
//               return null;
//             },
//           ),
//           const SizedBox(
//             height: AppSize.s10,
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text(
//                 AppStrings.dontGetCode,
//                 style: getRegularStyle(
//                     color: ColorManager.lightGrey, fontSize: AppSize.s16),
//               ),
//               const SizedBox(
//                 width: AppSize.s8,
//               ),
//               InkWell(
//                   onTap: () {
//                     Builder(
//                       builder: (BuildContext context) {
//                         // Navigator.pushReplacementNamed(context, Routes.registerRoute);
//                         return Container(); // Placeholder container
//                       },
//                     );
//                   },
//                   child: Text(
//                     AppStrings.resend,
//                     style: getBoldStyle(
//                         color: ColorManager.primary, fontSize: AppSize.s16),
//                   )),
//             ],
//           ),
//         ],
//       ),
//     ),
//     Step(
//       title: const Text(''),
//
//       content: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           const SizedBox(
//             height: AppSize.s60,
//           ),
//           Text(
//             AppStrings.enterPhone1,
//             style:
//             getBoldStyle(color: ColorManager.black, fontSize: AppSize.s20),
//           ),
//           const SizedBox(
//             height: AppSize.s10,
//           ),
//           Text(
//             textAlign: TextAlign.center,
//             AppStrings.confirmPhone,
//             style: getSemiBoldStyle(
//                 color: ColorManager.grey, fontSize: AppSize.s16),
//           ),
//           const SizedBox(
//             height: AppSize.s24,
//           ),
//           SizedBox(
//             height: 54,
//             child: TextFormField(
//               inputFormatters: [
//                 LengthLimitingTextInputFormatter(11),
//               ],
//               validator: (value) {
//                 String pattern =
//                     r'^(01)[0-9]{9}$'; //must enter 01 and 11 num
//                 RegExp regExp = RegExp(pattern);
//
//                 if (value!.isEmpty) {
//                   return 'Phone Number is Required';
//                 } else if (!regExp.hasMatch(value)) {
//                   return 'Please enter valid mobile number';
//                 }
//                 return null;
//               },
//               keyboardType: TextInputType.phone,
//               cursorColor: ColorManager.lightGrey,
//               style: getRegularStyle(
//                 color: ColorManager.grey,
//                 fontSize: AppSize.s16,
//               ),
//               decoration: InputDecoration(
//                 errorStyle: TextStyle(
//                   color: Colors.red,
//                   backgroundColor: ColorManager.white,
//                   fontFamily: "NunitoSans",
//                   fontWeight: FontWeight.w600,
//                 ),                hintText: AppStrings.phoneNumber,
//                 enabledBorder:
//                 OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
//                 focusedBorder:
//                 OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
//               ),
//             ),
//           ),
//         ],
//       ),
//     ),
//   ];