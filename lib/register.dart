import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'email_screen.dart';
import 'emailnpassword.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class RegisterEmailSection extends StatefulWidget {
  final String title = 'Registration';
  @override
  State<StatefulWidget> createState() => _RegisterEmailSectionState();
}

class _RegisterEmailSectionState extends State<RegisterEmailSection> {
  @override
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _success;
  String _userEmail;
  String percobaan = "belum";
  Widget build(BuildContext context) {
    return Scaffold(
      //key: _scaffoldKey,
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 5, left: 15, right: 15),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: 'Email'),
                validator: (String value) {
                  if (value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(labelText: 'Password'),
                obscureText: true,
                validator: (String value) {
                  if (value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                alignment: Alignment.center,
                child: ElevatedButton(
                  onPressed: () async {
                    SignInSignUpResult result = await createUser(
                        email: _emailController.text,
                        pass: _passwordController.text);
                    if (result.user != null) {
                      //Go to Profile Page
                       Navigator.push(
                           context,
                           MaterialPageRoute(
                              builder: (context) => EmailScreen(
                                user: result.user,
                              )));
                      setState(() {
                        percobaan = "berhasil formkey";
                      });
                    } else {
                      // Show Dialog
                      showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                                title: Text("Error"),
                                content: Text(result.message),
                                actions: <Widget>[
                                  FlatButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text("OK"),
                                  )
                                ],
                              ));
                    }
                  },
                  child: const Text('Submit'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
