import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iti_tasks/custom_elevated_button.dart';
import 'package:iti_tasks/custom_text_form.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  bool isSecurePassword = false;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController rpassword = TextEditingController();
  String pass = '';

  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.09,
              ),
              // Center(
              //   child: Shimmer.fromColors(
              //     highlightColor: Colors.red,
              //     baseColor: Colors.purple,
              //     period: const Duration(seconds: 5),
              //     child: const Padding(
              //       padding: EdgeInsets.all(5.0),
              //       child: Text(
              //         'Smart Shop',
              //         style:
              //             TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              //       ),
              //     ),
              //   ),
              // ),
              const SizedBox(
                height: 25,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  'Welcome ',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),

              const SizedBox(
                height: 30,
              ),
              // ImagePickerWidget(),
              const SizedBox(
                height: 25,
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
                    filled: true,
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
                    filled: true,
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
                    filled: true,
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
                    filled: true,
                    hint: 'Repeat Password',
                    obscureText: isSecurePassword),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 240.0),
                child: InkWell(
                  onTap: () {},
                  child: const Text(
                    'Forget Password?',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontSize: 20,
                      // fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Center(
                child: SizedBox(
                  width: 400,
                  child: CustomElvatedButton(
                      text: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.app_registration,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Register',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ],
                      ),
                      backgroundColor: Colors.blue,
                      borderSideColor: Colors.black,
                      style: const TextStyle(color: Colors.black, fontSize: 20),
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          log('valid');
                        }
                      }),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     const Text(
              //       'Already An Account?',
              //       style: TextStyle(color: Colors.black, fontSize: 18),
              //     ),
              //     const SizedBox(
              //       width: 15,
              //     ),
              //     InkWell(
              //       onTap: () {
              //         Navigator.pushReplacement(
              //           context,
              //           MaterialPageRoute(
              //             builder: (context) {
              //               return const LoginScreen();
              //             },
              //           ),
              //         );
              //       },
              //       child: const Text(
              //         'Login',
              //         style: TextStyle(
              //           decoration: TextDecoration.underline,
              //           fontSize: 20,
              //           // fontWeight: FontWeight.bold,
              //           color: Colors.black,
              //         ),
              //       ),
              //     ),
              //   ],
              // )
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
