import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:women_safety/screens/mapScreen.dart';
import 'package:women_safety/screens/uneasyScreen.dart';

import './screens/tabs_screen.dart';

import './widgets/Widget1.dart';

import './screens/authScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'New Project',
      home: Authscreen(),
      routes: {
        Uneasyscreen.routeName: (ctx) => Uneasyscreen(),
        Mapscreen.routeName: (ctx) => Mapscreen(),
        HomePage.routeName: (ctx) => HomePage(),
        TabsScreen.routeName: (ctx) => TabsScreen(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  static const routeName = '/home';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {

    void showAlertDialog(BuildContext context) {
      Widget okButton = TextButton(
        child: Text("OK",style: TextStyle(color:Color.fromARGB(187, 0, 0, 0) ),),
        onPressed: () {
          Navigator.of(context).pop();
        },
      );

      AlertDialog alert = AlertDialog(
        title: Text("Location Sent"),
        content: Text("The details are sent to your family members,police and locals for your assistance."),
        actions: [
          okButton,
        ],
      );

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        },
      );
    }

    void assault() {
      showAlertDialog(context);
    }

    void navi() {
      Navigator.of(context).pushNamed(Uneasyscreen.routeName);
    }

    final deviceSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Container(
          margin: EdgeInsets.all(2),
          padding: EdgeInsets.all(2),
          child: Text(
            'Home',
            style: TextStyle(
              color: Color.fromARGB(187, 0, 0, 0),
              fontSize: 30,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        backgroundColor: Color.fromRGBO(238, 231, 238, 1).withOpacity(0.5),
      ),
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.all(3),
                    padding: EdgeInsets.all(5),
                    width: double.infinity,
                    child: Text(
                      'We are here for you. State your emergency!',
                      style: TextStyle(
                        color: Color.fromARGB(187, 0, 0, 0),
                        fontWeight: FontWeight.w500,
                        fontSize: 35,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 0.12 * deviceSize.height,
                  ),
                  Widget1(Icons.woman, 'Uneasy', navi),
                  SizedBox(
                    height: 30,
                  ),
                  Widget1(FontAwesomeIcons.running, 'Assault', assault),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
