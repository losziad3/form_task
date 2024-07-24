import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:form_task/components/main_app_bar.dart';
import 'package:form_task/components/title_of_text_form_field.dart';
import '../../../components/custom_text_form_field.dart';
import '../../../components/main_button.dart';
import '../../../components/number_input_field.dart';
import '../../../core/utiles/routes.dart';
import '../../../cubits/form_cubit/cubit.dart';
import '../../../cubits/form_cubit/states.dart';

class FormScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController commentsController = TextEditingController();

  FormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenHeight = mediaQuery.size.height;
    final textScaleFactor = mediaQuery.textScaleFactor;

    return Scaffold(
      appBar: mainAppBar(title: 'Form'),
      body: BlocProvider(
        create: (context) => FormCubit(),
        child: BlocConsumer<FormCubit, FormDataState>(
          listener: (context, state) {
            if (state is FormSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                    content: Text('The data was uploaded successfully')),
              );
            } else if (state is FormFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.error)),
              );
            }
          },
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.all(12.0),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TitleOfTextFormField(
                        text: 'Name',
                        textScaleFactor: textScaleFactor,
                      ),
                      SizedBox(height: screenHeight * .01),
                      CustomTextformfield(
                        controller: nameController,
                        obscuretext: false,
                        label: 'Name',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your name';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: screenHeight * .04),
                      TitleOfTextFormField(
                        text: 'Email',
                        textScaleFactor: textScaleFactor,
                      ),
                      SizedBox(height: screenHeight * .01),
                      CustomTextformfield(
                        controller: emailController,
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
                        text: 'Phone Number',
                        textScaleFactor: textScaleFactor,
                      ),
                      SizedBox(height: screenHeight * .01),
                      NumberInputField(
                        maxLength: 13,
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              value.length < 10) {
                            return 'The phone number is not correct';
                          }
                          return null;
                        },
                        controller: phoneController,
                        labelText: 'Phone number',
                      ),
                      SizedBox(height: screenHeight * .04),
                      TitleOfTextFormField(
                        text: 'Address',
                        textScaleFactor: textScaleFactor,
                      ),
                      SizedBox(height: screenHeight * .01),
                      CustomTextformfield(
                        controller: addressController,
                        label: 'Address',
                        obscuretext: false,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your address';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: screenHeight * .04),
                      TitleOfTextFormField(
                        text: 'Comments',
                        textScaleFactor: textScaleFactor,
                      ),
                      SizedBox(height: screenHeight * .01),
                      CustomTextformfield(
                        controller: commentsController,
                        maxLines: 5,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your comments';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: screenHeight * .1),
                      state is FormLoading
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : MainButton(
                              text: 'Submit',
                              color: Colors.blue,
                              onTap: () {
                                if (formKey.currentState!.validate()) {
                                  BlocProvider.of<FormCubit>(context)
                                      .submitForm(
                                    name: nameController.text,
                                    email: emailController.text,
                                    phone: phoneController.text,
                                    address: addressController.text,
                                    comments: commentsController.text,
                                  );
                                }
                              },
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
