import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:iti_tasks/custom_elevated_button.dart';
import 'package:iti_tasks/custom_text_form.dart';

class RegisterBottomSheet extends StatefulWidget {
  const RegisterBottomSheet({super.key});

  @override
  State<RegisterBottomSheet> createState() => _RegisterBottomSheetState();
}

class _RegisterBottomSheetState extends State<RegisterBottomSheet> {
  bool isSecurePassword = false;

  TextEditingController email = TextEditingController();

  TextEditingController password = TextEditingController();

  TextEditingController name = TextEditingController();

  TextEditingController rpassword = TextEditingController();

  String pass = '';

  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 25.0, vertical: 10),
                    child: Text(
                      'Hello...',
                      style: TextStyle(
                        fontSize: 20,
                        color: Color(0xff1B1A40),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 250,
                  ),
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.clear_outlined,
                        color: Colors.red,
                        size: 30,
                      ))
                ],
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0),
                child: Text(
                  'Register',
                  style: TextStyle(
                      fontSize: 25,
                      color: Color(0xff1B1A40),
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: CustomTextFormField(
                    validator: (val) {
                      if (val!.isEmpty) {
                        return 'Field is Empty';
                      }
                      return null;
                    },
                    controller: name,
                    prefixIcon: const Icon(Icons.person),
                    // filled: true,
                    hint: 'user123',
                    obscureText: false),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: CustomTextFormField(
                    validator: (val) {
                      if (val!.isEmpty) {
                        return 'Field is Empty';
                      }
                      return null;
                    },
                    controller: email,
                    prefixIcon: const Icon(Icons.email),
                    // filled: true,
                    hint: 'youremail@gmail.com',
                    obscureText: false),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: CustomTextFormField(
                    maxLines: 1,
                    validator: (val) {
                      if (val!.isEmpty) {
                        return 'Field is Empty';
                      }
                      pass = val;
                      return null;
                    },
                    controller: password,
                    suffixIcon: passwordShow(),
                    // controller: search,
                    prefixIcon: const Icon(Icons.password),
                    // filled: true,
                    hint: 'Password',
                    obscureText: isSecurePassword),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: CustomTextFormField(
                    maxLines: 1,
                    validator: (val) {
                      if (val!.isEmpty) {
                        return 'Field is Empty';
                      } else if (val != pass) {
                        return 'passwords are not the same';
                      }
                      return null;
                    },
                    controller: rpassword,
                    suffixIcon: passwordShow(),
                    // controller: search,
                    prefixIcon: const Icon(Icons.password),
                    // filled: true,
                    hint: 'Repeat Password',
                    obscureText: isSecurePassword),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Center(
                child: SizedBox(
                  width: 281,
                  height: 61,
                  child: CustomElvatedButton(
                      text: const Text(
                        'Create Account',
                        style: TextStyle(
                          fontSize: 20,
                          color: Color(0xffFFDE69),
                        ),
                      ),
                      backgroundColor: const Color(0xff050522),
                      borderSideColor: const Color(0xffFFDE69),
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          log('valid');
                        }
                      }),
                ),
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already Have An Account?',
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'Login',
                    style: TextStyle(
                        fontSize: 17,
                        color: Color(0xffEF5858),
                        fontWeight: FontWeight.bold),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget passwordShow() {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSecurePassword = !isSecurePassword;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10),
        child: Icon(
          isSecurePassword ? Icons.visibility_off : Icons.visibility,
        ),
      ),
    );
  }
}
