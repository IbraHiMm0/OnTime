import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ontimeapp/cubit/AuthState.dart';
import 'package:ontimeapp/presentation/resources/string_manager.dart';
import 'package:ontimeapp/screens/components/customButtonView.dart';
import '../../cubit/AuthCubit.dart';
import '../../presentation/resources/assets_manager.dart';
import '../../presentation/resources/color_manager.dart';
import '../../presentation/resources/routes_manager.dart';
import '../../presentation/resources/styles_manager.dart';
import '../../presentation/resources/values_manager.dart';

class CreateProfileView extends StatelessWidget {
  CreateProfileView({Key? key}) : super(key: key);

  final GlobalKey<FormState> formKey = GlobalKey();
  final List<String> _departments = [
    'CS',
    'IS',
    'Front',
    'Back',
  ];

  @override
  Widget build(BuildContext context) {
    void back() {
      Navigator.pushReplacementNamed(
          context, Routes.forgotPassword); // goto screen
    }

    return BlocProvider(
      create: (context) => AuthCubit(),
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {},
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
                        AppStrings.createProfile,
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
            body: Form(
              key: formKey,
              child: Padding(
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
                        GestureDetector(
                          onTap: () {},
                          child: const Image(
                            height: AppSize.s80,
                            width: AppSize.s80,
                            image: AssetImage(ImageAssets.choosePhoto),
                          ),
                        ),
                        const SizedBox(
                          height: AppSize.s12,
                        ),
                        Text(
                          AppStrings.addPhoto,
                          style: getSemiBoldStyle(
                              color: ColorManager.titleBlack,
                              fontSize: AppSize.s20),
                        ),
                        const SizedBox(
                          height: AppSize.s12,
                        ),
                        Text(
                          AppStrings.thisPhoto,
                          style: getSemiBoldStyle(
                              color: ColorManager.lightGrey,
                              fontSize: AppSize.s14),
                        ),
                        Divider(
                          color: ColorManager.grey,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: AppSize.s70,
                    ),
                    SizedBox(
                      height: 50,
                      child: TextFormField(
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(24),
                        ],
                        keyboardType: TextInputType.text,
                        cursorColor: ColorManager.lightGrey,
                        style: getRegularStyle(
                          color: ColorManager.grey,
                          fontSize: AppSize.s14,
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return '   Name is Required';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: AppStrings.yourName,
                          hintStyle: getRegularStyle(
                            color: ColorManager.grey,
                            fontSize: AppSize.s14,
                          ),
                          errorStyle: TextStyle(
                            color: Colors.red,
                            backgroundColor: ColorManager.white,
                            fontFamily: "NunitoSans",
                            fontWeight: FontWeight.w600,
                          ),
                          // prefixText: AppStrings.space,
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: ColorManager.titleBlack,
                              ),
                              borderRadius: BorderRadius.circular(8)),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: AppSize.s20,
                    ),
                    Container(
                      height: 50,
                      decoration: BoxDecoration(
                          color: ColorManager.white,
                          borderRadius: BorderRadius.circular(8.0),
                          border: Border.all(color: ColorManager.black)),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: AuthCubit.get(context).selectedDepartment,
                          onChanged: (newValue) {
                            AuthCubit.get(context).changeOption(newValue);
                          },
                          dropdownColor: ColorManager.white,
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
                            color: ColorManager.grey,
                            fontSize: AppSize.s14,
                          ),
                          hint: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              AppStrings.department,
                              style: getRegularStyle(
                                color: ColorManager.grey,
                                fontSize: AppSize.s14,
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
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
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
                    const SizedBox(
                      height: AppSize.s8,
                    ),
                    Container(
                      // Your other widgets...
                      child: (!_departments.contains(
                              AuthCubit.get(context).selectedDepartment))
                          ? Padding(
                              padding:
                                  const EdgeInsets.only(bottom: 8.0, left: 8),
                              child: Text(
                                AppStrings.depSection,
                                style: getSemiBoldStyle(
                                    fontSize: AppSize.s12, color: Colors.red),
                              ),
                            )
                          : Container(),
                    ),
                    const SizedBox(
                      height: AppSize.s160,
                    ),
                    customButton(
                      text: AppStrings.getStarted,
                      textColor: ColorManager.white,
                      color: ColorManager.primary,
                      onTap: () {
                        if (formKey.currentState!.validate()) {}
                      },
                    ),
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
