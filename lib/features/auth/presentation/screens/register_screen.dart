import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sahem_app/features/auth/business_logic/auth_cubit.dart';
import 'package:sahem_app/features/auth/presentation/widgets/default_button.dart';
import 'package:sahem_app/features/auth/presentation/widgets/default_text_form_field.dart';
import 'package:sahem_app/features/auth/presentation/widgets/snack_bar.dart';
import 'package:sahem_app/helper/constants/strings.dart';
import 'package:sahem_app/route/route_path.dart';

class RegisterScreen extends StatelessWidget {
   RegisterScreen({super.key});
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
   final phoneController = TextEditingController();
  final GlobalKey<FormState> registerKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit,AuthState>
    (
      listener: (context, state) {
        
      if (state is AuthSuccessState) {
        showSnackBar(context, 'Register success .');
        Navigator.pushReplacementNamed(context,loginScreen );
        print('register is success');
      } 
       if (state is AuthErrorState) {
        showSnackBar(context, 'Please try again latter .');
        print(state.error);
      }
    
      },
      builder: (context, state) {
           var cubit = AuthCubit.get(context);
        return  Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: registerKey,
          child: Container(
            height: 950.h,
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      'assets/images/background.png',
                    ),
                    fit: BoxFit.fill),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: 75.h,
                    ),
                    child: Image(
                      image: const AssetImage('assets/images/logo.png'),
                      width: 240.w,
                      height: 240.h,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 5.h,
                      bottom: 15.h,
                      left: 25.w,
                      right: 25.w,
                    ),
                    child: Text(
                      '.خدماتك البلدية، الان رقمية',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 15.w,
                    ),
                    child: DefaultTextFormField(
                      controller: nameController,
                      label: 'رقم البطاقة القومية',
                      suffixIcon: Icons.person,
                       validation: (value) {
                          if (value!.isEmpty) return 'email must be filled';
                        },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 30.h,
                      left: 15.w,
                      right: 15.w,
                      bottom: 10.h,
                    ),
                    child: DefaultTextFormField(
                      controller: passwordController,
                      label: 'كلمة المرور',
                      suffixIcon: Icons.lock,
                       validation: (value) {
                          if (value!.isEmpty) return 'password must be filled';
                        },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 20.h,
                      left: 15.w,
                      right: 15.w,
                      bottom: 10.h,
                    ),
                    child: DefaultTextFormField(
                      controller: phoneController,
                      label: ' رقم الهاتف',
                      suffixIcon: Icons.phone,
                       validation: (value) {
                          if (value!.isEmpty) return 'password must be filled';
                        },
                    ),
                  ),
                 
                  Padding(
                    padding: EdgeInsets.only(
                      bottom: 18.h,
                      top: 40.h,
                      left: 30.w,
                      right: 30.w,
                    ),
                    child: DefaultButton(
                      onPressed: () {
                        if (registerKey.currentState!.validate()) {
                         cubit.userRegister(
                          endPoint:kRegisterEndPoint ,
                          name: nameController.text,
                           password: passwordController.text,
                            role: 'Client',
                             employeeType: 'General',
                              phone: phoneController.text,
                              );
                        }
                        
                      },
                      childText:'انشاء حساب جديد',
                      color: Colors.white,
                      textColor: const Color(0xFF2BB9D8),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                            margin:
                                EdgeInsets.only(left: 20.0.w, right: 20.0.w),
                            child: Divider(
                              color: Colors.white,
                              height: 25.h,
                              thickness: 1.sp,
                            )),
                      ),
                      Text(
                        'او بأستخدام',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                      Expanded(
                        child: Container(
                            margin:
                                EdgeInsets.only(left: 20.0.w, right: 20.0.w),
                            child: Divider(
                              color: Colors.white,
                              height: 25.h,
                              thickness: 1.sp,
                            )),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 11.w),
                    child: Row(
                      children: [
                        IconButton(
                          icon: Image.asset('assets/images/google.png'),
                          iconSize: 100.sp,
                          onPressed: () {},
                        ),
                        const Spacer(),
                        IconButton(
                          icon: Image.asset('assets/images/facebook.png'),
                          iconSize: 100.sp,
                          onPressed: () {},
                        ),
                        const Spacer(),
                        IconButton(
                          icon: Image.asset('assets/images/apple.png'),
                          iconSize: 100.sp,
                          onPressed: () {},
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            left: 120.w,
                          ),
                          child: TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, loginScreen);
                            },
                            child: Text(
                              'تسجيل الدخول',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 16.sp),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              //  left: 100.w,
                              ),
                          child: Text(
                            ' لديك حساب ؟',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15.sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )),
        ),
      ),
    );

      }
      
     );
  }
}