import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:liftbros_mobile/constants.dart';
import 'package:liftbros_mobile/data/api_provider.dart';

class LoginFragment extends StatefulWidget {
  const LoginFragment({required this.callback, super.key});

  final Function callback;

  @override
  _LoginFragmentState createState() => _LoginFragmentState();
}

class _LoginFragmentState extends State<LoginFragment> {
  final apiProvider = GetIt.instance<ApiProvider>();

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
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

                      widget.callback(loginDto.sessionToken);
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
            )));
  }
}
