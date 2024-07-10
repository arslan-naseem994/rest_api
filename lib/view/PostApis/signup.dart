import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class SignupScreenPostApi extends StatefulWidget {
  const SignupScreenPostApi({super.key});

  @override
  State<SignupScreenPostApi> createState() => _SignupScreenPostApiState();
}

class _SignupScreenPostApiState extends State<SignupScreenPostApi> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  login(String email, String password) async {
    try {
      // ignore: prefer_typing_uninitialized_variables
      var data;
      Response response = await post(
          Uri.parse('https://reqres.in/api/register'),
          body: {'email': email, 'password': password});

      data = jsonDecode(response.body.toString());
      if (response.statusCode == 200) {
        debugPrint('Account Created');
        debugPrint(data.toString());
        debugPrint(data['id'].toString());
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
      appBar: AppBar(centerTitle: true, title: const Text('Signup Screen ')),
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
                    'SignUp',
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
