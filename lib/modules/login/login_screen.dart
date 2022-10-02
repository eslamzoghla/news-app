import 'package:first_project/modules/home/home_screen.dart';
import 'package:first_project/shared/components/components.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  static const String routeName = 'Login';

  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailAddress = TextEditingController();
  var passwordAddress = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool isPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Login',
                    style:
                        TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  defaultFormField(
                    testLabel: "Email",
                    prefix: Icons.email,
                    control: emailAddress,
                    type: TextInputType.emailAddress,
                    validate: (value) {
                      if (value!.isEmpty) {
                        return "Email must not be empty.";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  defaultFormField(
                    testLabel: "Password",
                    prefix: Icons.lock,
                    suffix:
                        isPassword ? Icons.visibility_off : Icons.visibility,
                    type: TextInputType.visiblePassword,
                    control: passwordAddress,
                    suffixPress: () {
                      setState(() {
                        isPassword = !isPassword;
                      });
                    },
                    validate: (value) {
                      if (value!.isEmpty) {
                        return "Password must not be empty.";
                      }
                      return null;
                    },
                    isPassword: isPassword,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  defaultButton(
                      text: "login",
                      background: Colors.blue,
                      radius: 35,
                      fun: () {
                        if (formKey.currentState!.validate()) {
                          print(emailAddress.text);
                          print(passwordAddress.text);
                          Navigator.pushNamed(context, home_screen.routeName);
                        }
                      }),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Don\'t have an account ?'),
                      TextButton(
                        onPressed: () {},
                        child: Text('Register now'),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
