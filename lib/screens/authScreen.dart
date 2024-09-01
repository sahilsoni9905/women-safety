import 'package:flutter/material.dart';
import './tabs_screen.dart';
// import 'dart:math';

class Authscreen extends StatelessWidget {
  const Authscreen({super.key});
  static const routeName = '/log';
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(238, 231, 238, 1).withOpacity(0.5),
                  Color.fromRGBO(114, 112, 109, 1).withOpacity(0.9),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0, 2],
              ),
            ),
          ),
          SingleChildScrollView(
            child: Container(
              height: deviceSize.height,
              width: deviceSize.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 0.2 * deviceSize.height,
                  ),
                  Container(
                    width: double.infinity,
                    // margin: EdgeInsets.only(bottom: 20.0),
                    padding: EdgeInsets.symmetric(horizontal: 2.0),
                    child: Text(
                      'Welcome Back!',
                      style: TextStyle(
                        color: Color.fromARGB(187, 0, 0, 0),
                        fontSize: 60,
                        fontWeight: FontWeight.w800,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Flexible(
                    flex: deviceSize.width > 600 ? 2 : 1,
                    child: Auth(),
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

class Auth extends StatefulWidget {
  const Auth({super.key});

  @override
  State<Auth> createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  var _isLoading = false;

  var _isLogin = true;
  String _userEmail = '';
  String _userName = '';
  String _userPassword = '';
  var _hide;
  @override
  void initState() {
    _hide = true;
    super.initState();
  }

  final GlobalKey<FormState> _formKey = GlobalKey();

  void _submit() async {
    if (!_formKey.currentState!.validate()) {
      // Invalid!
      return;
    }
    _formKey.currentState!.save();
    // Use the values saved in _userEmail, _userName, and _userPassword
    Navigator.of(context).pushReplacementNamed(TabsScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            if (!_isLogin)
              Container(
                margin: EdgeInsets.only(
                  left: 12,
                ),
                padding: EdgeInsets.all(5),
                width: double.infinity,
                child: Text(
                  'Username',
                  style: TextStyle(
                      color: Color.fromARGB(187, 0, 0, 0), fontSize: 18),
                  textAlign: TextAlign.left,
                ),
              ),
            if (!_isLogin)
              Container(
                margin: EdgeInsets.only(left: 13, right: 15, bottom: 3),
                child: TextFormField(
                  key: ValueKey('Username'),
                  style: TextStyle(
                      color: Color.fromARGB(187, 0, 0, 0), fontSize: 20),
                  decoration: InputDecoration(
                    labelStyle: TextStyle(color: Color.fromARGB(187, 0, 0, 0)),
                    prefixIcon: Icon(
                      Icons.account_circle,
                      color: Color.fromARGB(187, 0, 0, 0),
                    ),
                    labelText: 'Username',
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white54,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                  ),
                  // keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value!.isEmpty || value.length < 4) {
                      return 'Please enter at least 4 characters';
                    }
                  },
                  onSaved: (value) {
                    _userName = value!;
                  },
                ),
              ),
            Container(
              margin: EdgeInsets.only(
                left: 12,
              ),
              padding: EdgeInsets.all(5),
              width: double.infinity,
              child: Text(
                'E-mail',
                style: TextStyle(
                    color: Color.fromARGB(187, 0, 0, 0), fontSize: 18),
                textAlign: TextAlign.left,
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 13, right: 15, bottom: 3),
              child: TextFormField(
                key: ValueKey('email'),
                style: TextStyle(
                    color: Color.fromARGB(187, 0, 0, 0), fontSize: 20),
                decoration: InputDecoration(
                  labelStyle: TextStyle(color: Color.fromARGB(187, 0, 0, 0)),
                  prefixIcon: Icon(
                    Icons.email_outlined,
                    color: Color.fromARGB(187, 0, 0, 0),
                  ),
                  labelText: 'E-mail',
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white54,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                ),
                // keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value!.isEmpty || value.contains('@') == false) {
                    return 'Please enter a valid e-mail';
                  }
                },
                onSaved: (value) {
                  _userEmail = value!;
                },
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                left: 12,
              ),
              padding: EdgeInsets.all(5),
              width: double.infinity,
              child: Text(
                'Password',
                style: TextStyle(
                    color: Color.fromARGB(187, 0, 0, 0), fontSize: 18),
                textAlign: TextAlign.left,
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 13, right: 15),
              child: TextFormField(
                key: ValueKey('password'),
                style: TextStyle(
                    color: Color.fromARGB(187, 0, 0, 0), fontSize: 20),
                decoration: InputDecoration(
                  labelStyle: TextStyle(color: Color.fromARGB(187, 0, 0, 0)),
                  prefixIcon: Icon(
                    Icons.key,
                    color: Color.fromARGB(187, 0, 0, 0),
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _hide = !_hide;
                      });
                    },
                    icon: _hide
                        ? Icon(
                            Icons.visibility,
                            color: Color.fromARGB(187, 0, 0, 0),
                          )
                        : Icon(
                            Icons.visibility_off,
                            color: Color.fromARGB(187, 0, 0, 0),
                          ),
                  ),
                  labelText: 'Password',
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white54,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                ),
                obscureText: _hide ? true : false,
                // controller: _passwordController,
                validator: (value) {
                  if (value!.isEmpty || value.length < 5) {
                    return 'Password is too short!';
                  }
                },
                onSaved: (value) {
                  _userPassword = value!;
                },
              ),
            ),
            SizedBox(
              height: _isLogin ? 25 : 20,
            ),
            // if (_isLoading) CircularProgressIndicator(),
            if (!_isLoading)
              Container(
                width: double.infinity,
                margin: EdgeInsets.only(left: 13, right: 15, bottom: 3),
                child: ElevatedButton(
                  onPressed: _submit,
                  child: Text(
                    _isLogin ? 'Sign In' : 'Sign Up',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(187, 0, 0, 0),
                    shadowColor: Colors.transparent,
                    padding: EdgeInsets.all(15.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    elevation: 3,
                  ),
                ),
              ),
            SizedBox(
              height: _isLogin ? 4 : 10,
            ),
            // if (!_isLoading)
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(
                  left: 13, right: 15, bottom: _isLogin ? 8 : 13),
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    _isLogin = !_isLogin;
                  });
                },
                child: Text(
                  _isLogin ? 'Sign Up' : 'Sign In',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(187, 0, 0, 0),
                  shadowColor: Colors.transparent,
                  padding: EdgeInsets.all(15.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  elevation: 3,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
