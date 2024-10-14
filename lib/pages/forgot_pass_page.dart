import 'package:destion_mart/methods/validator.dart';
import 'package:destion_mart/pages/login_page.dart';
import 'package:destion_mart/widgets/custom_button.dart';
import 'package:destion_mart/widgets/custom_textfield_2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgotPassPage extends StatelessWidget {
  const ForgotPassPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController mobController = TextEditingController();
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    final FocusNode mobFocusNode = FocusNode();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: Center(
          child: AppBar(
            backgroundColor: const Color(0xFF275F60),
            centerTitle: true,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
            ),
            title: Text(
              'Forgot Password',
              style: GoogleFonts.inter(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Text(
                  'Enter your email address to reset your password.',
                  style: GoogleFonts.inter(
                    fontSize: 15,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 20),
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
                const SizedBox(height: 40),
                CustomButton(
                  bgColor: WidgetStateProperty.all<Color>(
                    const Color(0xFF275F60),
                  ),
                  fontColor: Colors.white,
                  text: 'Reset Password',
                  onPressed: () {
                    if (!formKey.currentState!.validate()) {
                      return;
                    }
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
          ),
        ),
      ),
    );
  }
}
