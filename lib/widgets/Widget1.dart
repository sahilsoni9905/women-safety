import 'package:flutter/material.dart';

class Widget1 extends StatelessWidget {
  IconData i;
  String text;
  Function fn;
  Widget1(this.i, this.text, this.fn);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        fn();
      },
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.all(2),
   
        child: Card(
            color: Color.fromARGB(187, 0, 0, 0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            elevation: 8.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  text,
                  style: TextStyle(color: Colors.white70, fontSize: 40),
                ),
                SizedBox(width: 3.5,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    i,
                    color: Colors.white70,
                    size: 100,
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
