import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:projek_aplikasi/firebase_options.dart';
import 'package:projek_aplikasi/melacak_mencatat.dart';
import 'package:projek_aplikasi/page/add_catatan_page.dart';
import 'package:projek_aplikasi/page/home_page.dart';
import 'package:projek_aplikasi/page/login_page.dart';
import 'package:projek_aplikasi/page/register_page.dart';
import 'login_page.dart';
import 'registrasi_page.dart';
import 'dashbord_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Aplikasi Olahraga Mahasiswa', // Application title
        debugShowCheckedModeBanner:
            false, // Set this to false to remove the debug banner
        theme: ThemeData(
          primarySwatch: Colors.blue,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        // home: const LoginPage(), // Set the LoginPage as the initial page.
        home: LoginPage(), // Set the LoginPage as the initial page.
        routes: {
          '/login': (context) => const LoginPage(),
          '/register': (context) => const RegistrationPage(
              title: 'Register'), // Ensure this matches the constructor.
          '/dashboard': (context) => const DashboardPage(),
        });
  }
}
