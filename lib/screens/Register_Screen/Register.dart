import 'package:flutter/material.dart';
import 'package:ontimeapp/presentation/resources/string_manager.dart';
import 'package:ontimeapp/screens/components/custom-TextField.dart';
import 'package:ontimeapp/screens/components/customButtonView.dart';
import '../../presentation/resources/assets_manager.dart';
import '../../presentation/resources/color_manager.dart';
import '../../presentation/resources/routes_manager.dart';
import '../../presentation/resources/styles_manager.dart';
import '../../presentation/resources/values_manager.dart';


class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}
bool isPass=true;
bool isPass2=true;




String? selectedValue;

GlobalKey<FormState> formKey = GlobalKey();
TextEditingController _pass = TextEditingController();
TextEditingController _repeatedPass = TextEditingController();
TextEditingController user = TextEditingController();
TextEditingController user1 = TextEditingController();


String? choose; //no radio button will be selected on initial

class _RegisterViewState extends State<RegisterView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.whiteF5,
      body: Padding(
        padding:  const EdgeInsets.symmetric(horizontal: AppSize.s18),
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
                  children:  [
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
                Text(
                  'Full Name',
                  style: getRegularStyle(color: ColorManager.titleBlack,fontSize: AppSize.s16),
                ),
                const SizedBox(
                  height: AppSize.s8,
                ),
                customField(
                  hintText: 'Please enter your full name',
                  numForm: 14, // just 14
                  controller: user,
                  valid: (value) {
                    if(value!.isEmpty){
                      return 'First Name is Required';
                    }
                    else if(value.length <= 3){
                      return 'You typed a few character';
                    }
                    return null;
                  },

                  keyboardType: TextInputType.text,
                ),
                const SizedBox(
                  height: AppSize.s20,
                ),
                Text(
                  'Email',
                  style: getRegularStyle(color: ColorManager.titleBlack,fontSize: AppSize.s16),
                ),
                const SizedBox(
                  height: AppSize.s8,
                ),
                customField(
                  obs: false,
                  numForm: 34,
                  hintText: 'Please enter your email',
                  valid: (value) {
                    if(value!.isEmpty){
                      return 'E-mail is Required';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(
                  height: AppSize.s20,
                ),
                Text(
                  'Phone number',
                  style: getRegularStyle(color: ColorManager.titleBlack,fontSize: AppSize.s16),
                ),
                const SizedBox(
                  height: AppSize.s8,
                ),
                customField(

                  hintText: 'Please enter your phone number',
                  numForm: 11,
                  valid: (value) {
                    String pattern = r'^(01)[0-9]{9}$'; //must enter 01 and 11 num
                    RegExp regExp =  RegExp(pattern);

                    if(value!.isEmpty){
                      return 'Phone Number is Required';
                    }
                    else if (!regExp.hasMatch(value)) {
                      return 'Please enter valid mobile number';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.phone,
                ),
                const SizedBox(
                  height: AppSize.s20,
                ),
                Text(
                  'Department',
                  style: getRegularStyle(color: ColorManager.titleBlack,fontSize: AppSize.s16),
                ),
                const SizedBox(
                  height: AppSize.s8,
                ),
                DropdownButtonFormField<String>(
                  value: selectedValue,
                  hint:  Text(
                    'Department',
                    style: getRegularStyle(color: ColorManager.lightGrey,fontSize: AppSize.s16),
                  ),
                  style: getRegularStyle(color: ColorManager.lightGrey,fontSize: AppSize.s16),
                  onChanged: (options) =>
                      setState(() => selectedValue = options),

                  validator: (value) => value == null ? 'This field required' : null,
                  items:
                  ['Engineering', 'CS'].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,

                      child: Text(value),
                    );
                  }).toList(),
                ),
                const SizedBox(
                  height: AppSize.s20,
                ),
                Text(
                  'Password',
                  style: getRegularStyle(color: ColorManager.titleBlack,fontSize: AppSize.s16),
                ),
                const SizedBox(
                  height: AppSize.s8,
                ),
                customField(
                  obs: isPass2,
                  hintText: 'Please enter your password',
                  numForm: 24,

                  controller: _pass,
                  valid: (value){
                    if(value!.isEmpty) {
                      return 'Password is Required';
                    }
                    else if(value.length <= 7){
                      return 'Password should contain more than 8 characters';
                    }
                    else if(value == user.text) {
                      return 'The Password Match with first Name change it';
                    }
                    else if(value == user1.text) {
                      return 'The Password Match with last Name change it';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.visiblePassword,
                  suffix: IconButton(
                    onPressed: (){
                      setState(() {
                        isPass2 = !isPass2;
                      });
                    },
                    icon: Icon(
                      isPass2? Icons.visibility_outlined:Icons.visibility_off_outlined ,
                      color: ColorManager.iconColor,
                    ),
                  ),
                ),
                const SizedBox(
                  height: AppSize.s20,
                ),
                Text(
                  'Repeat Password',
                  style: getRegularStyle(color: ColorManager.titleBlack,fontSize: AppSize.s16),
                ),
                const SizedBox(
                  height: AppSize.s8,
                ),
                customField(
                  obs: isPass,
                  controller: _repeatedPass,
                  hintText: 'Please repeat your password',
                  numForm: 24,
                  valid: (val){
                    if(val!.isEmpty) {
                      return 'Repeat Password is Required';
                    }
                    else if(val != _pass.text) {
                      return 'The Password Not Matching';
                    }
                    else if(val.length <= 7){
                      return 'Password should contain more than 8 characters';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.visiblePassword,
                  suffix: IconButton(
                    onPressed: (){
                      setState(() {
                        isPass = !isPass;
                      });
                    },
                    icon: Icon(
                      isPass? Icons.visibility_outlined:Icons.visibility_off_outlined ,
                      color: ColorManager.iconColor,
                    ),
                  ),
                ),


                const SizedBox(
                  height: AppSize.s16
                  ,
                ),
                customButton(
                  textColor: ColorManager.white,

                  text: AppStrings.signUP.toUpperCase(),
                  color: ColorManager.primary,
                  onTap: () async {
                    if (formKey.currentState!.validate()) {

                      setState(() {});
                      if(selectedValue=='For User'){
                        Navigator.pushReplacementNamed(
                            context, Routes.splashRoute);
                      }
                      else{
                        // Navigator.pushReplacementNamed(
                        //     context, Routes.forChildRoute);
                      }
                      setState(() {});
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
                          color: ColorManager.black,
                          fontSize: AppSize.s15
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacementNamed(
                            context, Routes.loginRoute);
                      },
                      child: Text(
                        AppStrings.signIN.toUpperCase(),
                        style: getBoldStyle(
                            color: ColorManager.primary,
                            fontSize: AppSize.s16),
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
  }
  List<DropdownMenuItem<String>> _addDividersAfterItems(List<String> items) {
    List<DropdownMenuItem<String>> _menuItems = [];
    for (var item in items) {
      _menuItems.addAll(
        [
          DropdownMenuItem<String>(
            value: item,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                  item,
                  style:  getRegularStyle(fontSize: AppSize.s18,
                    color: ColorManager.whiteF6,)
              ),
            ),
          ),
          //If it's last item, we will not add Divider after it.
          if (item != items.last)
            const DropdownMenuItem<String>(
              enabled: false,
              child: Divider(),
            ),
        ],
      );
    }
    return _menuItems;
  }
}
