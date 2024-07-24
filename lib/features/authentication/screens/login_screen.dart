import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;
    final textScaleFactor = mediaQuery.textScaleFactor;
    return Scaffold(
      appBar: mainAppBar(
        title: 'Login',
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TitleOfTextFormField(
              text: 'Email',
              textScaleFactor: textScaleFactor,
            ),
            SizedBox(
              height: screenHeight*.01,
            ),
            CustomTextformfield(
              controller: _emailController,
              obscuretext: false,
              label: 'Email',

            ),
            SizedBox(
              height: screenHeight*.04,
            ),
            TitleOfTextFormField(
              text: 'Password',
              textScaleFactor: textScaleFactor,
            ),
            SizedBox(
              height: screenHeight*.01,
            ),
            CustomTextformfield(
              controller: _passwordController,
              label: 'Password',
              obscuretext: true,
            ),
            SizedBox(
              height: screenHeight*.1,
            ),
            MainButton(
              text: 'Login',
              color: Colors.blue,
              onTap: ()
              {
                context.go(Routes.kFormScreen);
              },
            ),
            SizedBox(
              height: screenHeight*.03,
            ),
            Row(
              children: [
                const Text('Don\'t have an account?'),
                TextButton(onPressed: ()
                {
                 context.go(Routes.kRegisterScreen);
                },
                    child: const Text('Sign up')),
              ],
            ),
          ],
        ),
      ),
    );
  }


}
