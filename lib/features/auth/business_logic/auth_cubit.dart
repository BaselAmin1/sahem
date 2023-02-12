import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sahem_app/features/auth/data/web_services/auth_web_services.dart';
import 'package:sahem_app/helper/constants/strings.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitialState());

  static AuthCubit get(context) => BlocProvider.of(context);

  Future userLogin({
    required String endPoint,
    required String name,
    required String password,
  }) async {
    emit(
      AuthLoadingState(),
    );
    try {
      await AuthWebServices.postAuthData(
        endPoint: endPoint,
        data: {
          'name': name,
          'password': password,
        },
      ).then(
        (value) {
          print('token-------------${value.data['result']}');
          kToken = value.data['result'];
          if (value.data['statusCode'] != 201) {
             print(value.data['statusCode'].toString());
            emit(
              AuthErrorState(
                value.data['statusCode'].toString(),
              ),
            );
           
          } 
          if(value.data['statusCode']==201) {
            emit(
              AuthSuccessState(),
            );
          }
        },
      );
    } catch (error) {
      print(error.toString());
      emit(
        AuthErrorState(
          error.toString(),
        ),
      );
    }
  }

  Future userRegister({
    required String endPoint,
    required String name,
    required String password,
    required String role,
    required String employeeType,
    required String phone,
  }) async {
    emit(
      AuthLoadingState(),
    );
    try {
      await AuthWebServices.postAuthData(
        endPoint: endPoint,
        data: {
          'name': name,
          'password': password,
          "role": 'Client',
          "employeeType": 'General',
          "phone": phone,
        },
      ).then(
       (value) {
          print('token-------------${value.data['result']}');
         // kToken = value.data['result'];
          if (value.data['statusCode'] != 201) {
             print(value.data['statusCode'].toString());
            emit(
              AuthErrorState(
                value.data['statusCode'].toString(),
              ),
            );
           
          } 
          if(value.data['statusCode']==201) {
            emit(
              AuthSuccessState(),
            );
          }
        },
      );
    } catch (error) {
      print("erorrrrrrrrr  ${error.toString()},");
      emit(
        AuthErrorState(
          error.toString(),
          
        ),
      );
    }
  }

  bool isPassword = true;
  IconData suffixIcon = Icons.visibility;
  void changePasswordVisibility() {
    isPassword = !isPassword;
    if (isPassword)
      suffixIcon = Icons.visibility_off;
    else
      suffixIcon = Icons.visibility;
    emit(
      AuthChangePasswordVisibilityState(),
    );
  }
}
