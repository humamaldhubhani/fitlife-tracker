import 'package:flutter/material.dart';
  
  void showErrorSnackBar(BuildContext context, String massage) {
    final snackBar = SnackBar(
      content: Container(
        //padding: EdgeInsets.only(left: 10),
        height: 50,
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 192, 56, 56),
            borderRadius: BorderRadius.all(Radius.circular(50))),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.only(left: 10),
              child: Icon(
                Icons.error_outline,
                color: Colors.white,
                size: 30,
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              "Error : ",
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            ),
            Expanded(
                child: Text(
              massage,
              style: TextStyle(color: Colors.white),
            )),
          ],
        ),
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }