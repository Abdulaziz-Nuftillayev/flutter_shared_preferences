import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../pages/login_page.dart';
import '../widgets/w_button.dart';
import '../widgets/w_sign_up.dart';
import '../widgets/w_email_check.dart';
import '../widgets/w_forget_pass.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passController = TextEditingController();

  _loadSaveDAta() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      emailController.text = prefs.getString('email') ?? '';
      passController.text = prefs.getString('password') ?? '';
    });
  }

  _saveData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('email', emailController.text);
    await prefs.setString('password', passController.text);
  }

  @override
  void initState() {
    super.initState();
    _loadSaveDAta();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 50.0),
                  Image.asset("assets/images/login.webp"),
                  const ListTile(
                    title: Text(
                      "Welcome back!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      textAlign: TextAlign.center,
                      "Log in to your exictant account of Q Allure",
                    ),
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          validator: validateEmail,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(
                              Icons.person,
                              color: Colors.blueAccent,
                            ),
                            hintText: "example@gmail.com",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        TextFormField(
                          controller: passController,
                          obscureText: true,
                          validator: (name) => name!.length < 3
                              ? "Your password must be more than 3!"
                              : null,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(
                              Icons.lock,
                              color: Colors.blueAccent,
                            ),
                            hintText: "Password",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  wForgetPass(),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.blueAccent),
                      foregroundColor: MaterialStateProperty.all(Colors.white),
                      shape: MaterialStateProperty.all<OutlinedBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    onPressed: () async {
                      if (_formKey.currentState != null &&
                          _formKey.currentState!.validate()) {
                        _saveData();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginPage(
                              email: emailController.text,
                              password: passController.text,
                            ),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("There is a flaw in your data"),
                          ),
                        );
                      }
                    },
                    child: const Text(
                      ' \t Log In \t',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  const SizedBox(height: 30.0),
                  const Text(
                    "Or connect using",
                    style: TextStyle(color: Colors.black38),
                  ),
                  const SizedBox(height: 10.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      WButton(
                        color: Colors.blueAccent,
                        onPressed: () {},
                        child: const Row(
                          children: [
                            Icon(
                              Icons.facebook_rounded,
                              color: Colors.white,
                            ),
                            SizedBox(width: 5.0),
                            Text(
                              'Facebook',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      WButton(
                        color: Colors.redAccent,
                        onPressed: () {},
                        child: const Row(
                          children: [
                            Icon(
                              Icons.g_mobiledata,
                              color: Colors.white,
                            ),
                            SizedBox(width: 5.0),
                            Text(
                              'Google',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 50.0),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account?",
                        style: TextStyle(
                          color: Colors.black38,
                          fontSize: 16,
                        ),
                      ),
                      WSignUp(),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
