import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sahem_app/features/auth/business_logic/auth_cubit.dart';
import 'package:sahem_app/features/auth/presentation/widgets/default_button.dart';
import 'package:sahem_app/features/auth/presentation/widgets/default_text_form_field.dart';
import 'package:sahem_app/features/auth/presentation/widgets/snack_bar.dart';
import 'package:sahem_app/helper/constants/strings.dart';
import 'package:sahem_app/route/route_path.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  final GlobalKey<FormState> loginKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(listener: (context, state) {
      if (state is AuthInitialState) {
        kToken = null;
        print(kToken);
      }
      if (state is AuthSuccessState) {
        showSnackBar(context, 'Login success .');
        Navigator.pushReplacementNamed(context, appLayoutScreen);
        print('login is success');
      }
      if (state is AuthErrorState) {
        showSnackBar(context, 'Please try again latter .');
        print(state.error);
      }
    }, builder: (context, state) {
      var cubit = AuthCubit.get(context);
      return Scaffold(
        body: Form(
          key: loginKey,
          child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      'assets/images/background.png',
                    ),
                    fit: BoxFit.fill),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: 75.h,
                      ),
                      child: Image(
                        image: const AssetImage('assets/images/logo.png'),
                        width: 270.w,
                        height: 270.h,
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
                        top: 20.h,
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
                      padding: EdgeInsets.only(right: 290.w),
                      child: Text(
                        'لا تتذكر كلمة السر ؟',
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        bottom: 18.h,
                        top: 45.h,
                        left: 30.w,
                        right: 30.w,
                      ),
                      child: DefaultButton(
                        onPressed: () {
                          if (loginKey.currentState!.validate()) {
                            cubit.userLogin(
                              endPoint: kLoginEndPoint,
                              name: nameController.text,
                              password: passwordController.text,
                            );
                          }
                        },
                        childText: 'تسجيل الدخول',
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
                            iconSize: 110.sp,
                            onPressed: () {},
                          ),
                          const Spacer(),
                          IconButton(
                            icon: Image.asset('assets/images/facebook.png'),
                            iconSize: 110.sp,
                            onPressed: () {},
                          ),
                          const Spacer(),
                          IconButton(
                            icon: Image.asset('assets/images/apple.png'),
                            iconSize: 110.sp,
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
                              left: 100.w,
                            ),
                            child: TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, registerScreen);
                              },
                              child: Text(
                                'انشاء حساب جديد',
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
                              'ليس لديك حساب ؟',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12.sp,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )),
        ),
      );
    });
  }
}
