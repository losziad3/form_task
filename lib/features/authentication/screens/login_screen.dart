import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_task/cubits/login_cubit/cubit.dart';
import 'package:form_task/cubits/login_cubit/states.dart';
import 'package:go_router/go_router.dart';
import '../../../components/custom_text_form_field.dart';
import '../../../components/main_app_bar.dart';
import '../../../components/main_button.dart';
import '../../../components/title_of_text_form_field.dart';
import '../../../core/utiles/routes.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenHeight = mediaQuery.size.height;
    final textScaleFactor = mediaQuery.textScaleFactor;

    return Scaffold(
      appBar: mainAppBar(title: 'Login'),
      body: BlocProvider(
        create: (context) => LoginCubit(),
        child: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state is AuthSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Login Successfully')),
              );
              context.go(Routes.kFormScreen);
            } else if (state is AuthFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.error)),
              );
            }
          },
          builder: (context, state) {
            return SingleChildScrollView(
             physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TitleOfTextFormField(
                        text: 'Email',
                        textScaleFactor: textScaleFactor,
                      ),
                      SizedBox(height: screenHeight * .01),
                      CustomTextformfield(
                        controller: _emailController,
                        obscuretext: false,
                        label: 'Email',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }
                          final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
                          if (!emailRegex.hasMatch(value)) {
                            return 'Please enter a valid email address';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: screenHeight * .04),
                      TitleOfTextFormField(
                        text: 'Password',
                        textScaleFactor: textScaleFactor,
                      ),
                      SizedBox(height: screenHeight * .01),
                      CustomTextformfield(
                        controller: _passwordController,
                        label: 'Password',
                        obscuretext: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          if (value.length < 6) {
                            return 'Password should be at least 6 characters';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: screenHeight * .1),
                      state is AuthLoading
                          ? const Center(child: CircularProgressIndicator())
                          : MainButton(
                        text: 'Login',
                        color: Colors.blue,
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            BlocProvider.of<LoginCubit>(context).login(
                              _emailController.text,
                              _passwordController.text,
                            );
                          }
                        },
                      ),
                      SizedBox(height: screenHeight * .03),
                      Row(
                        children: [
                          const Text('Don\'t have an account?'),
                          TextButton(
                            onPressed: () {
                              context.go(Routes.kRegisterScreen);
                            },
                            child: const Text('Sign up'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
