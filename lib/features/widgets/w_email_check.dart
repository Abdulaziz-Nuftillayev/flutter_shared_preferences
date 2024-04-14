String? validateEmail(String? email) {
  RegExp emailRegex = RegExp(r'^[\w\..-]+@[\w-]+\.\w{2,3}(\.\w{2, 3})?$');
  final isEmailValid = emailRegex.hasMatch(email ?? '');
  if (!isEmailValid) {
    return "Please enter a valid email.";
  }
  return null;
}