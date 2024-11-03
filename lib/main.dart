import 'package:bills/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360.0, 752.0),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Bills',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
                seedColor: Colors.white70, brightness: Brightness.dark),
            useMaterial3: true,
          ),
          home: LoginPage(),
        );
      },
    );
  }
}
