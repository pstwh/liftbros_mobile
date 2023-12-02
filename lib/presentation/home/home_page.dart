import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:liftbros_mobile/constants.dart';
import 'package:liftbros_mobile/data/auth_provider.dart';
import 'package:liftbros_mobile/presentation/home/fragments/content_fragment.dart';
import 'package:liftbros_mobile/presentation/home/fragments/login_fragment.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final authProvider = GetIt.instance<AuthProvider>();
  bool authenticated = false;

  @override
  void initState() {
    authenticated = authProvider.authenticated;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: const Text('Liftbros'), backgroundColor: appbarColor),
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: authenticated
            ? ContentFragment(callback: () {
                authProvider.clearSessionToken();
                setState(() {
                  authenticated = false;
                });
              })
            : LoginFragment(callback: (sessionToken) {
                authProvider.saveSessionToken(sessionToken);
                setState(() {
                  authenticated = true;
                });
              }),
      ),
    );
  }
}
