String? validateEmail(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter an email address';
  }
  final RegExp emailRegex = RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
  );
  if (!emailRegex.hasMatch(value)) {
    return 'Enter a valid email address';
  }
  return null;
}


String? validatePassword1(String? value) {
  if (value == null || value.isEmpty) {
    return 'Password is required';
  }

 

  return null;
}

String? validatePassword(String? value) {
  if (value == null || value.isEmpty) {
    return '';
  }

  // List<String> validationErrors = [];

  // if (value.length < 6) {
  //   validationErrors.add('Must contain at least 6 characters long');
  // }

  // final RegExp hasAlpha = RegExp(r'[a-zA-Z]');
  // if (!hasAlpha.hasMatch(value)) {
  //   validationErrors.add('Must contain at least one alphabetic character');
  // }

  // final RegExp hasDigit = RegExp(r'\d');
  // if (!hasDigit.hasMatch(value)) {
  //   validationErrors.add('Must contain at least one digit');
  // }

  // final RegExp hasSpecialChar = RegExp(r'[!@#$%^&*(),.?":{}|<>]');
  // if (!hasSpecialChar.hasMatch(value)) {
  //   validationErrors.add('Must contain at least one special character');
  // }

  // if (validationErrors.isNotEmpty) {
  //   return validationErrors.join('\n');
  // }

  return null;
}

String? validateFullName(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter your full name';
  }

  final RegExp nameRegex = RegExp(r'^[a-zA-Z\s]+$');

  if (!nameRegex.hasMatch(value)) {
    return 'Name can only contain letters and spaces';
  }

  return null;
}
