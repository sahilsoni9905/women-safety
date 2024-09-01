import 'package:flutter/material.dart';

class Uneasyscreen extends StatefulWidget {
  static const routeName = '/uneasy';

  @override
  State<Uneasyscreen> createState() => _UneasyscreenState();
}

class _UneasyscreenState extends State<Uneasyscreen> {
  final _form = GlobalKey<FormState>();
  String _vehicleNo = '';
  String _description = '';
  final _descriptionFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Uneasy',
          style: TextStyle(
            color: Color.fromARGB(187, 0, 0, 0),
            fontSize: 30,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: Color.fromRGBO(238, 231, 238, 1).withOpacity(0.5),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus(); // Close the keyboard on tap
        },
        child: Stack(
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
            Container(
              height: deviceSize.height,
              width: deviceSize.width,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Form(
                      key: _form,
                      child: Column(
                        // Changed from ListView to Column
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                              left: 4,
                            ),
                            padding: EdgeInsets.all(8),
                            width: double.infinity,
                            child: Text(
                              'Enter the vehicle number. If following. (Optional)',
                              style: TextStyle(
                                  color: Color.fromARGB(187, 0, 0, 0),
                                  fontSize: 23,
                                  fontWeight: FontWeight.w400),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              left: 4,
                            ),
                            padding: EdgeInsets.all(8),
                            width: double.infinity,
                            child: TextFormField(
                              onFieldSubmitted: (_) {
                                FocusScope.of(context)
                                    .requestFocus(_descriptionFocusNode);
                              },
                              textInputAction: TextInputAction.next,
                              key: const ValueKey('Vehicle No.'),
                              style: TextStyle(
                                  color: Color.fromARGB(187, 0, 0, 0),
                                  fontSize: 20),
                              decoration: InputDecoration(
                                labelStyle: TextStyle(
                                    color: Color.fromARGB(187, 0, 0, 0)),
                                labelText: 'Vehicle No.',
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                  ),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                              ),
                              validator: (value) {
                                if (value!.isEmpty || value.length < 10) {
                                  return 'Please enter at least 10 characters';
                                }
                                return null; // Added to indicate valid input
                              },
                              onSaved: (value) {
                                _vehicleNo = value!;
                              },
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              left: 4,
                            ),
                            padding: EdgeInsets.all(8),
                            width: double.infinity,
                            child: Text(
                              'Please describe your situation. (Optional)',
                              style: TextStyle(
                                  color: Color.fromARGB(187, 0, 0, 0),
                                  fontSize: 23,
                                  fontWeight: FontWeight.w400),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              left: 4,
                            ),
                            padding: EdgeInsets.all(8),
                            width: double.infinity,
                            child: TextFormField(
                              minLines: 1,
                              maxLines: 5,
                              focusNode: _descriptionFocusNode,
                              key: const ValueKey('situation'),
                              style: TextStyle(
                                  color: Color.fromARGB(187, 0, 0, 0),
                                  fontSize: 20),
                              decoration: InputDecoration(
                                labelStyle: TextStyle(
                                    color: Color.fromARGB(187, 0, 0, 0)),
                                labelText: 'Description ',
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                  ),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                              ),
                              validator: (value) {
                                if (value!.isEmpty || value.length < 25) {
                                  return 'Should be atleast 25 characters long';
                                }
                                return null; // Added to indicate valid input
                              },
                              onSaved: (value) {
                                _description = value!;
                              },
                            ),
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Color.fromARGB(187, 0, 0, 0)),
                            onPressed: () {
                              FocusScope.of(context).unfocus();
                              // Validate the form and save the data
                              if (_form.currentState!.validate()) {
                                _form.currentState!.save();
                                // Perform any further actions (like sending the data)
                              }
                            },
                            child: Text(
                              'Alert',
                              style: TextStyle(
                                  color: Color.fromRGBO(238, 231, 238, 1)
                                      .withOpacity(0.5),
                                  fontSize: 26),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
