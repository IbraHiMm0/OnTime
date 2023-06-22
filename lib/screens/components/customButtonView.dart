import 'package:flutter/material.dart';

import '../../presentation/resources/color_manager.dart';
import '../../presentation/resources/styles_manager.dart';
import '../../presentation/resources/values_manager.dart';

class customButton extends StatelessWidget {
  customButton({this.onTap,this.preIcon, required this.textColor,required this.text,required this.color}) ;
  String text;
  VoidCallback? onTap;
  Color color;
  IconData? preIcon;
  Color textColor;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: AppSize.s50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSize.s8),
          color: color,
        ),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: Padding(
                padding: const EdgeInsets.only(right: AppSize.s15),
                child: Icon(
                  preIcon,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right:AppSize.s30),
              child: Text(
                  text.toUpperCase(),
                  style:  getBoldStyle(color: textColor,fontSize: AppSize.s13)
              ),
            ),
          ],
        ),
      ),
    );
  }
}
