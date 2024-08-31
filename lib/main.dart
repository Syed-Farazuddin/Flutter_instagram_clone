import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram_clone/core/colors.dart';
import 'package:instagram_clone/core/firebase_options.dart';
import 'package:instagram_clone/responsive/mobile_screen.dart';
import 'package:instagram_clone/responsive/responsive_screen.dart';
import 'package:instagram_clone/responsive/web_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: Options.apiKey,
        appId: Options.appId,
        messagingSenderId: Options.messagingSenderId,
        projectId: Options.projectId,
        storageBucket: Options.storageBucket,
      ),
    );
  } else {
    await Firebase.initializeApp();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: mobileBackgroundColor,
        ),
        home: const Scaffold(
          backgroundColor: mobileBackgroundColor,
          // appBar: AppBar(
          //   title: const Text(
          //     "Insta Clone",
          //     style: TextStyle(
          //       color: Colors.white,
          //     ),
          //   ),
          //   backgroundColor: mobileBackgroundColor,
          // ),
          body: ResponsiveScreenLayout(
            webScreenLayout: WebScreenLayout(),
            mobileScreenLayout: MobileScreenLayout(),
          ),
        ),
      ),
    );
  }
}
