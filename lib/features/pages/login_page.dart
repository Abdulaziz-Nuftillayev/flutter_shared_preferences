import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  final String email;
  final String password;

  const LoginPage({super.key, required this.email, required this.password});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Counter"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Email: ${widget.email}'),
            Text('Password: ${widget.password}'),
          ],
        ),
      ),
    );
  }
}

/*
*   String _haveStarted3Times = '';

  Future<int> _getIntFromSharedPref() async {
    final pref = await SharedPreferences.getInstance();
    final starTupNumber = pref.getInt("startupNumber");
    if (starTupNumber == null) {
      return 0;
    } else {
      return starTupNumber;
    }
  }

  Future<void> _resetCounter() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('startupNumber', 0);
  }

  Future<void> _incrementStartup() async {
    final prefs = await SharedPreferences.getInstance();

    int lastStartupNumber = await _getIntFromSharedPref();
    int currentStartupNumber = ++lastStartupNumber;

    await prefs.setInt('startupNumber', currentStartupNumber);

    if(currentStartupNumber == 3){
      setState(() => _haveStarted3Times = '$currentStartupNumber Times Completed');

      await _resetCounter();
    } else {
      setState(() => _haveStarted3Times = '$currentStartupNumber Times Started the app');
    }
  }

  @override
  void initState() {
    super.initState();
    _incrementStartup();
  }

* */
