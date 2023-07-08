
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'AuthState.dart';


class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(InitialState());

  static AuthCubit get(context) => BlocProvider.of(context);

  String? selectedDepartment;
  bool isPass = true;
  bool isPass2 = true;

  bool option=false;
  bool option1=false;

  IconData suffix =Icons.visibility_off_outlined;
  IconData suffix2 =Icons.visibility_off_outlined;

  void forgotPassOption(){
    option=!option;
    option1=!option;
    emit(ChangeOptionForgotPassState());
  }

  void forgotPass2Option(){
    option1=!option1;
    option=!option1;
    emit(ChangeOptionForgotPassState());
  }
  void changePass (){
    isPass = !isPass;
    suffix =isPass? Icons.visibility_off_outlined:Icons.visibility_outlined;
    emit(ChangePassState());
  }
  void changePass2 (){
    isPass2 = !isPass2;
    suffix2 =isPass2? Icons.visibility_off_outlined:Icons.visibility_outlined;
    emit(ChangePassState());
  }

  void changeOption(newValue){
     selectedDepartment =newValue;
    emit(ChangeOptionState());
  }
}
