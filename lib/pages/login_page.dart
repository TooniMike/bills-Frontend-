import 'package:bills/utils/custom_textfield.dart';
import 'package:bills/pages/home_page.dart';
import 'package:bills/utils/progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obscurePassword = true;
  bool _obscurePassword1 = true;

  String? passwordValidationError;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void password() {
    setState(() {
      _obscurePassword1 = _obscurePassword1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 50,
        backgroundColor: Colors.black,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Text(
              'Welcome!',
              style: GoogleFonts.kanit(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 25.sp,
              ),
            ),
            SizedBox(height: 20.h),
            Text(
              'Fill in your details to login into your account',
              style: GoogleFonts.kanit(
                color: Colors.white,
                fontWeight: FontWeight.normal,
                fontSize: 12.sp,
              ),
            ),
            SizedBox(height: 20.h),
            CustomTextField(
              keyboard: TextInputType.emailAddress,
              validator: (email) {
                if (email!.isEmpty && !email.contains("@")) {
                  return 'Please provide valid email';
                } else {
                  return null;
                }
              },
              hintText: "Email",
              controller: _emailController,
            ),
            SizedBox(
              height: 20.h,
            ),
            CustomTextField(
              hintText: "Password",
              obscureText: _obscurePassword,
              controller: _passwordController,
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    _obscurePassword = !_obscurePassword;
                  });
                },
                child: Icon(
                  _obscurePassword ? Icons.visibility : Icons.visibility_off,
                  color: Colors.black,
                ),
              ),
              validator: (password) {
                if (password!.isEmpty && password.length < 7) {
                  return 'Please too weak';
                } else {
                  return null;
                }
              },
            ),
            SizedBox(height: 20.h),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                "Register",
                style: GoogleFonts.kanit(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 18.sp,
                ),
              ),
            ),
            SizedBox(height: 60.h),
            GestureDetector(
              onTap: () {
                progressIndicator(context, message: 'Authenticating');
                Future.delayed(const Duration(seconds: 3), () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                  );
                });
                // _login;
              },
              child: Container(
                height: 55.h,
                width: 300.w,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                child: Center(
                  child: Text(
                    "L O G I N",
                    style: GoogleFonts.kanit(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.sp,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
