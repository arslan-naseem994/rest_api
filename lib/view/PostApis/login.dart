import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class LoginScreenPostApi extends StatefulWidget {
  const LoginScreenPostApi({super.key});

  @override
  State<LoginScreenPostApi> createState() => _LoginScreenPostApiState();
}

class _LoginScreenPostApiState extends State<LoginScreenPostApi> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  login(String email, String password) async {
    try {
      // ignore: prefer_typing_uninitialized_variables
      var data;
      Response response = await post(Uri.parse('https://reqres.in/api/login'),
          body: {'email': email, 'password': password});

      data = jsonDecode(response.body.toString());
      if (response.statusCode == 200) {
        debugPrint('Account successfully login');
        debugPrint(data.toString());
      } else {
        debugPrint('Failed');
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(centerTitle: true, title: const Text('Login Screen Screen ')),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(hintText: 'Email'),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: passwordController,
              decoration: const InputDecoration(hintText: 'Password'),
            ),
            const SizedBox(
              height: 40,
            ),
            InkWell(
              onTap: () {
                login(emailController.text.toString(),
                    passwordController.text.toString());
              },
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadiusDirectional.circular(20)),
                child: const Center(
                  child: Text(
                    'Login',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
