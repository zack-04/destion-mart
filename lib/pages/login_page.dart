import 'package:destion_mart/methods/validator.dart';
import 'package:destion_mart/pages/forgot_pass_page.dart';
import 'package:destion_mart/pages/home_page.dart';
import 'package:destion_mart/pages/signup_page.dart';
import 'package:destion_mart/widgets/custom_button.dart';
import 'package:destion_mart/widgets/custom_textfield_2.dart';
import 'package:destion_mart/widgets/toast_message.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toastification/toastification.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController mobController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final FocusNode mobFocusNode = FocusNode();
  final FocusNode passFocusNode = FocusNode();
  bool _obscureText = true;
  bool isLoading = false;

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  void loginFunc() {
    if (!formKey.currentState!.validate()) {
      return;
    }
    showCustomToastification(
      context: context,
      type: ToastificationType.success,
      title: 'Logged in successfully!',
      icon: Icons.check,
      primaryColor: Colors.green,
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
    );
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => const HomePage(),
      ),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Image.asset(
              'assets/images/background.jpg',
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
            Positioned(
              bottom: 20,
              right: 20,
              left: 20,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text(
                      'Shop Smart, Save\nBig on Groceries!',
                      style: GoogleFonts.inter(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      padding: const EdgeInsets.only(
                        left: 30,
                        right: 30,
                        top: 20,
                        bottom: 20,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(height: 5),
                          _rowWidget(),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          Form(
                            key: formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CustomTextfield2(
                                  controller: mobController,
                                  focusNode: mobFocusNode,
                                  keyboardType: TextInputType.emailAddress,
                                  text: 'Email',
                                  prefixIcon: Icon(
                                    Icons.email,
                                    color: Colors.grey.shade700,
                                  ),
                                  validator: validateEmail,
                                  obscureText: false,
                                ),
                                const SizedBox(height: 30),
                                CustomTextfield2(
                                  controller: passController,
                                  focusNode: passFocusNode,
                                  obscureText: _obscureText,
                                  text: 'Password',
                                  prefixIcon: Icon(
                                    Icons.lock,
                                    color: Colors.grey.shade700,
                                  ),
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      _obscureText
                                          ? Icons.visibility_off
                                          : Icons.visibility,
                                      color: Colors.grey.shade700,
                                    ),
                                    onPressed: _togglePasswordVisibility,
                                  ),
                                  validator: validatePassword1,
                                ),
                                const SizedBox(height: 30),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  child: CustomButton(
                                    text: 'Login',
                                    bgColor: WidgetStateProperty.all<Color>(
                                      const Color(0xFF275F60),
                                    ),
                                    fontColor: Colors.white,
                                    onPressed: loginFunc,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const ForgotPassPage(),
                                      ),
                                    );
                                  },
                                  child: Center(
                                    child: Text(
                                      'Forgot Password?',
                                      style: GoogleFonts.inter(
                                        fontSize: 14,
                                        color: Colors.grey.shade700,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    _bottomText(context),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _rowWidget() {
  return Row(
    children: [
      Expanded(
        child: Divider(
          color: Colors.grey.shade600,
          thickness: 0.5,
        ),
      ),
      const SizedBox(width: 10),
      const Text('Login to your account'),
      const SizedBox(width: 10),
      Expanded(
        child: Divider(
          color: Colors.grey.shade600,
          thickness: 0.5,
        ),
      ),
    ],
  );
}

Widget _bottomText(BuildContext context) {
  return RichText(
    text: TextSpan(
      text: "Don't have an account?   ",
      style: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w500,
      ),
      children: [
        TextSpan(
          text: 'Register',
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SignupPage(),
                ),
              );
            },
        ),
      ],
    ),
  );
}
