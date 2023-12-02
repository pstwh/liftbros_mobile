import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:liftbros_mobile/data/api_provider.dart';
import 'package:liftbros_mobile/data/auth_provider.dart';
import 'package:liftbros_mobile/presentation/auth/login_page.dart';

final getIt = GetIt.instance;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final provider = AuthProvider();
  await provider.retrieveSessionToken();

  getIt.registerLazySingleton<AuthProvider>(() => provider);
  getIt.registerLazySingleton<ApiProvider>(() => ApiProvider());
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Liftbros',
      home: const LoginPage(),
      theme: ThemeData(primarySwatch: Colors.blue),
      debugShowCheckedModeBanner: false,
    );
  }
}
