import 'package:flutter/material.dart';
import 'package:flutter_mvvm/helper/Validation.dart';
import 'package:flutter_mvvm/list_product/view/ProductView.dart';
import 'package:flutter_mvvm/login/LoginViewModel.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: BodyWidget(),
    );
  }
}

class BodyWidget extends StatefulWidget {
  @override
  _BodyWidgetState createState() => _BodyWidgetState();
}

class _BodyWidgetState extends State<BodyWidget> {
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final loginViewModel = LoginViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    emailController.addListener(() {
      loginViewModel.emailSink.add(emailController.text);
    });

    passController.addListener(() {
      loginViewModel.passSink.add(passController.text);
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    loginViewModel.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 40, right: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          StreamBuilder<String>(
              stream: loginViewModel.emailStream,
              builder: (context, snapshot) {
                return TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    icon: Icon(Icons.email),
                    hintText: 'example@gmail.com',
                    labelText: 'Email *',
                    errorText: snapshot.data,
                  ),
                );
              }),
          SizedBox(
            height: 20,
          ),
          StreamBuilder<String>(
              stream: loginViewModel.passStream,
              builder: (context, snapshot) {
                return TextField(
                  controller: passController,
                  obscureText: true,
                  decoration: InputDecoration(
                    icon: Icon(Icons.lock),
                    labelText: 'Password *',
                    errorText: snapshot.data,
                  ),
                );
              }),
          SizedBox(
            height: 40,
          ),
          SizedBox(
            height: 45,
            width: 200,
            child: StreamBuilder<bool>(
                stream: loginViewModel.btnStream,
                builder: (context, snapshot) {
                  return RaisedButton(
                    color: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    onPressed: snapshot.data == true
                        ? () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ProductView()));
                          }
                        : null,
                    child: Text(
                      'Login',
                      style: TextStyle(color: Colors.white, fontSize: 17),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
