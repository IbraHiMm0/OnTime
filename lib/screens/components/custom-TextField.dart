import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ontimeapp/presentation/resources/color_manager.dart';
import 'package:ontimeapp/presentation/resources/string_manager.dart';

import '../../presentation/resources/styles_manager.dart';
import '../../presentation/resources/values_manager.dart';


class customField extends StatelessWidget {
   customField({this.hintText,this.numForm,this.valid,this.controller,this.onChanged,this.suffix, this.icon,required this.keyboardType,this.obs=false,});

    String? hintText;
    Function(String)? onChanged;
   Icon? icon;
   IconButton? suffix;
   bool? obs;
   int? numForm;
   String? Function(String?)? valid;
   TextEditingController? controller;
   TextInputType keyboardType;
  @override

  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(8)
          ),
          child: TextFormField(

            inputFormatters: [
              LengthLimitingTextInputFormatter(numForm),
            ],
            keyboardType: keyboardType,
            controller: controller,
            obscureText: obs!,

            validator: valid,
            cursorColor: ColorManager.lightGrey,
            style:  getRegularStyle(
              color: ColorManager.grey,
              fontSize: AppSize.s16,
            ),
            onChanged: onChanged,
            decoration: InputDecoration(
              errorStyle:   TextStyle(color: Colors.red,backgroundColor: ColorManager.whiteF5,fontFamily: "NunitoSans",fontWeight: FontWeight.w600,),
              prefixIcon: icon,
              hintText: hintText,
              hintStyle:  getRegularStyle(color: ColorManager.lightGrey,
                fontSize: AppSize.s16,
                  ),
              prefixText: AppStrings.space,
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey.shade50,
                ),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey.shade50,
                ),
              ),
              //when i see field
              // focusedBorder: OutlineInputBorder(
              //   borderSide: BorderSide(
              //     color: ColorManager.whiteF5,
              //   ),
              //   borderRadius: BorderRadius.circular(AppSize.s30),
              // ), //when i see field
              suffixIcon:suffix,

            ),
          ),
        ),
      ],
    );
  }
}
