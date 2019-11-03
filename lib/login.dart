import 'package:devfest/alert.dart';
import 'package:devfest/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _auth = FirebaseAuth.instance;

  final _formKey = GlobalKey<FormState>();

  String _user;
  String _pass;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DevFest'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(labelText: 'Email'),
                  onSaved: (value) => _user = value,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Password'),
                  obscureText: true,
                  onSaved: (value) => _pass = value,
                ),
                SizedBox(height: 30.0),
                RaisedButton(
                  child: Text('Login'),
                  onPressed: _login,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _login() async {
    final form = _formKey.currentState;

    if (!form.validate()) return;
    form.save();

    try {
      final user =
          await _auth.signInWithEmailAndPassword(email: _user, password: _pass);

      if (user != null) {
        Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (context) => Home()));
      }
    } catch (e) {
      showAlert(context, 'Error!', '$e');
    }
  }
}
