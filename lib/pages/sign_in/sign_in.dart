import 'package:bloc_flutter/pages/sign_in/bloc/sign_in_blocs.dart';
import 'package:bloc_flutter/pages/sign_in/bloc/sign_in_events.dart';
import 'package:bloc_flutter/pages/sign_in/bloc/sign_in_states.dart';
import 'package:bloc_flutter/pages/sign_in/sign_in_controller.dart';
import 'package:bloc_flutter/pages/sign_in/widgets/sign_in_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBloc, SignInState>(
      builder: (context, state) {
        return Container(
          color: Colors.white,
          child: SafeArea(
              child: Scaffold(
            backgroundColor: Colors.white,
            appBar: buildAppBar("Log in"),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildThirdPartyLogin(context),
                  Center(
                      child:
                          reusableText("Or use your email account to login")),
                  Container(
                    margin: EdgeInsets.only(top: 36.h),
                    padding: EdgeInsets.only(left: 25.w, right: 25.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        reusableText("Email"),
                        SizedBox(
                          height: 5.h,
                        ),
                        buildTextField(
                            "Enter your email address", "email", "user",
                            (value) {
                          context.read<SignInBloc>().add(EmailEvent(value));
                        }),
                        reusableText("Password"),
                        SizedBox(
                          height: 5.h,
                        ),
                        buildTextField(
                            "Enter your password", "password", "lock", (value) {
                          context.read<SignInBloc>().add(PasswordEvent(value));
                        }),
                        forgotPassword(),
                        SizedBox(
                          height: 70.h,
                        ),
                        buildLogAndRegButton("Log In", "login", () {
                          SignInController(context: context)
                              .handleSingIn("email");
                        }),
                        buildLogAndRegButton("Sign Up", "register", () {
                          Navigator.of(context).pushNamed("/register");
                        }),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )),
        );
      },
    );
  }
}
