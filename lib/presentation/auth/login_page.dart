import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:liftbros_mobile/constants.dart';
import 'package:liftbros_mobile/data/api_provider.dart';
import 'package:liftbros_mobile/data/auth_provider.dart';
import 'package:liftbros_mobile/presentation/home/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final apiProvider = GetIt.instance<ApiProvider>();
  final authProvider = GetIt.instance<AuthProvider>();

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: const Text('Liftbros'), backgroundColor: appbarColor),
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(32.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset('assets/data/liftbros.png'),
                TextFormField(
                  controller: _usernameController,
                  decoration: const InputDecoration(labelText: 'Username'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your username';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(labelText: 'Password'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 32.0),
                InkWell(
                  borderRadius: BorderRadius.circular(8.0),
                  onTap: () async {
                    if (_formKey.currentState!.validate()) {
                      final loginDto = await apiProvider.login(
                          _usernameController.text, _passwordController.text);

                      authProvider.saveSessionToken(loginDto.sessionToken);

                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                      );
                    }
                  },
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: darkerColor,
                        borderRadius: BorderRadius.circular(8.0)),
                    padding: const EdgeInsets.all(16.0),
                    child: const Center(
                      child: Text('Start Lifting',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                ),
                const SizedBox(height: 8.0),
                const Text('Join the Bros',
                    style: TextStyle(color: darkerColor))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
