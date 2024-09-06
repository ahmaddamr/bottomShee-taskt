import 'package:flutter/material.dart';
import 'package:iti_tasks/custom_elevated_button.dart';
import 'package:iti_tasks/form_task/widgets/login_bottom_sheet.dart';
import 'package:iti_tasks/form_task/widgets/register_bottom_sheet.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff050522),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 100,
            ),
            Image.asset('assets/images/auth.png'),
            const Text(
              'Welcome',
              style: TextStyle(
                fontSize: 30,
                color: Color(0xffEF5858),
              ),
            ),
            const Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  overflow: TextOverflow.clip),
            ),
            const SizedBox(
              height: 60,
            ),
            SizedBox(
              width: 281,
              height: 61,
              child: CustomElvatedButton(
                  text: const Text(
                    'Create Account',
                    style: TextStyle(fontSize: 20, color: Color(0xff1B1A40)),
                  ),
                  backgroundColor: const Color(0xffFFDE69),
                  borderSideColor: Colors.transparent,
                  onPressed: () {
                    showModalBottomSheet(
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30))),
                      context: context,
                      builder: (context) {
                        return const RegisterBottomSheet();
                      },
                    );
                  }),
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              width: 281,
              height: 61,
              child: CustomElvatedButton(
                  text: const Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 20,
                      color: Color(0xffFFDE69),
                    ),
                  ),
                  backgroundColor: Colors.transparent,
                  borderSideColor: const Color(0xffFFDE69),
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return const LoginBottomSheet();
                      },
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
