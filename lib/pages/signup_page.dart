import 'package:destion_mart/methods/validator.dart';
import 'package:destion_mart/pages/login_page.dart';
import 'package:destion_mart/widgets/custom_button.dart';
import 'package:destion_mart/widgets/custom_textfield_2.dart';
import 'package:destion_mart/widgets/toast_message.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController mobController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final FocusNode mobFocusNode = FocusNode();
  final FocusNode nameFocusNode = FocusNode();
  final FocusNode passFocusNode = FocusNode();
  bool _obscureText = true;

  bool hasUppercase = false;
  bool hasLowercase = false;
  bool hasNumber = false;
  bool hasMinLength = false;
  bool isPasswordValid = false;
  bool isSignupAttempted = false;

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  void _validatePassword(String password) {
    setState(() {
      hasUppercase = password.contains(RegExp(r'[A-Z]'));
      hasLowercase = password.contains(RegExp(r'[a-z]'));
      hasNumber = password.contains(RegExp(r'[0-9]'));
      hasMinLength = password.length >= 8;

      isPasswordValid = hasUppercase && hasLowercase && hasNumber;
    });
  }

  void signupFunc() {
    setState(() {
      isSignupAttempted = true;
    });

    if (!formKey.currentState!.validate() ||
        !hasMinLength ||
        !isPasswordValid) {
      return;
    }

    showCustomToastification(
      context: context,
      type: ToastificationType.success,
      title: 'Signed up successfully!',
      icon: Icons.check,
      primaryColor: Colors.green,
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
    );
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => const LoginPage(),
      ),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(
          left: 30,
          right: 30,
          top: 20,
          bottom: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const FittedBox(
              child: Text(
                "Welcome to DestionMart",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 28,
                ),
              ),
            ),
            const SizedBox(height: 20),
            _rowWidget(),
            const SizedBox(height: 20),
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
                  const SizedBox(height: 20),
                  CustomTextfield2(
                    controller: nameController,
                    focusNode: nameFocusNode,
                    keyboardType: TextInputType.name,
                    text: 'Full Name',
                    prefixIcon: Icon(
                      Icons.person,
                      color: Colors.grey.shade700,
                    ),
                    validator: validateFullName,
                    obscureText: false,
                  ),
                  const SizedBox(height: 20),
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
                        _obscureText ? Icons.visibility_off : Icons.visibility,
                        color: Colors.grey.shade700,
                      ),
                      onPressed: _togglePasswordVisibility,
                    ),
                    validator: validatePassword,
                    onChanged: _validatePassword,
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: !isPasswordValid && isSignupAttempted
                            ? Colors.red.shade900
                            : Colors.grey.shade400,
                        width: 1,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  _criteriaText('Minimum 8 Characters', hasMinLength),
                  const SizedBox(height: 10),
                  _buildPasswordCriteria(),
                  const SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: CustomButton(
                      text: 'Signup',
                      bgColor: WidgetStateProperty.all<Color>(
                        const Color(0xFF275F60),
                      ),
                      fontColor: Colors.white,
                      onPressed: signupFunc,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            _bottomText(context),
          ],
        ),
      ),
    );
  }

  Widget _buildPasswordCriteria() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        _criteriaText(
          'Uppercase, lowercase letters and one number',
          isPasswordValid,
        ),
      ],
    );
  }

  Widget _criteriaText(String text, bool isValid) {
    Color? textColor;
    if (isSignupAttempted) {
      textColor = isValid ? Colors.green : Colors.red.shade800;
    } else {
      textColor = Colors.black;
    }

    return Row(
      children: [
        Icon(
          isSignupAttempted
              ? (isValid ? Icons.check : Icons.close)
              : Icons.close,
          color: textColor,
          size: 18,
        ),
        const SizedBox(width: 5),
        Text(
          text,
          style: TextStyle(
            color: textColor,
            fontSize: 12,
          ),
        ),
      ],
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
      const Text('Create an Account'),
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
      text: "Already have an account? ",
      style: const TextStyle(
        color: Colors.grey,
        fontWeight: FontWeight.w500,
      ),
      children: [
        TextSpan(
          text: 'Login',
          style: const TextStyle(
            color: Color(0xFF275F60),
            fontWeight: FontWeight.w500,
          ),
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginPage(),
                ),
              );
            },
        ),
      ],
    ),
  );
}
