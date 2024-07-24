import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';


import '../../../components/custom_text_form_field.dart';
import '../../../components/main_app_bar.dart';
import '../../../components/main_button.dart';
import '../../../components/title_of_text_form_field.dart';
import '../../../core/utiles/routes.dart';
import '../../../cubits/register_cubit/cubit.dart';
import '../../../cubits/register_cubit/states.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenHeight = mediaQuery.size.height;

    return Scaffold(
      appBar: mainAppBar(title: 'Register'),
      body: BlocProvider(
        create: (context) => AuthCubit(),
        child: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthSuccess) {
              context.go(Routes.kFormScreen);
            } else if (state is AuthFailure) {
              print("ERROR: ${state.error}");
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.error)),
              );
            }
          },
          builder: (context, state) {
            if (state is AuthLoading) {
              return const Center(child: CircularProgressIndicator());
            }

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
                        text: 'User Name',
                        textScaleFactor: mediaQuery.textScaleFactor,
                      ),
                      SizedBox(height: screenHeight * .01),
                      CustomTextformfield(
                        controller: _userNameController,
                        obscuretext: false,
                        label: 'User Name',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a username';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: screenHeight * .04),
                      TitleOfTextFormField(
                        text: 'Email',
                        textScaleFactor: mediaQuery.textScaleFactor,
                      ),
                      SizedBox(height: screenHeight * .01),
                      CustomTextformfield(
                        controller: _emailController,
                        obscuretext: false,
                        label: 'Email',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter an email';
                          }
                          if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                            return 'Please enter a valid email address';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: screenHeight * .04),
                      TitleOfTextFormField(
                        text: 'Password',
                        textScaleFactor: mediaQuery.textScaleFactor,
                      ),
                      SizedBox(height: screenHeight * .01),
                      CustomTextformfield(
                        controller: _passwordController,
                        label: 'Password',
                        obscuretext: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a password';
                          }
                          if (value.length < 6) {
                            return 'Password must be at least 6 characters long';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: screenHeight * .1),
                      MainButton(
                        text: 'Register',
                        color: Colors.blue,
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            final email = _emailController.text;
                            final password = _passwordController.text;
                            print(email);
                            print(password);

                            // Call the signup method from the cubit
                            context.read<AuthCubit>().signUp(email, password);
                          }
                        },
                      ),
                      SizedBox(height: screenHeight * .03),
                      Row(
                        children: [
                          const Text('Do you have an account?'),
                          TextButton(
                            onPressed: () {
                              context.go(Routes.kLoginScreen);
                            },
                            child: const Text('Sign in'),
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
