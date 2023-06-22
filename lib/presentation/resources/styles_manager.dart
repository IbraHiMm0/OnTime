
import 'package:flutter/material.dart';
import 'package:ontimeapp/presentation/resources/values_manager.dart';

import 'font_manager.dart';

TextStyle _getTextStyle(double fontSize,FontWeight fontWeight,Color color){
  return TextStyle(
      fontSize: fontSize,
      fontFamily: FontConstants.fontFamily,
      color: color,
      fontWeight: fontWeight
  );
}

TextStyle getRegularStyle({double fontSize=AppSize.s22,required Color color}){
  return _getTextStyle(fontSize, FontWeightManager.regular, color);
}

TextStyle getExtraLightStyle({double fontSize=AppSize.s18,required Color color}){
  return _getTextStyle(fontSize, FontWeightManager.extraLight, color);
}

TextStyle getLightStyle({double fontSize=AppSize.s18,required Color color}){
  return _getTextStyle(fontSize, FontWeightManager.light, color);
}

TextStyle getBoldStyle({double fontSize=AppSize.s22,required Color color}){
  return _getTextStyle(fontSize, FontWeightManager.bold, color);
}
TextStyle getSemiBoldStyle({double fontSize=AppSize.s22,required Color color}){
  return _getTextStyle(fontSize, FontWeightManager.semiBold, color);
}
