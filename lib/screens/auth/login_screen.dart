import 'package:brightminds/screens/auth/forgot_password.dart';
import 'package:brightminds/screens/auth/selection_page.dart';
import 'package:brightminds/screens/auth/signup_screen.dart';
import 'package:brightminds/screens/main_dashboard.dart';
import 'package:brightminds/utils/colors.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Spacer(flex: 2),
            _buildBackgroundShapes(),
            Spacer(),
            Center(
              child: Text(
                'Brighty minds',
                style: TextStyle(
                  color: mainColor,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 30),
            TextField(
              decoration: InputDecoration(
                labelText: 'Enter your username',
                labelStyle: TextStyle(color: Colors.pinkAccent),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: mainColor),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.green),
                ),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: 'Enter your Password',
                labelStyle: TextStyle(color: Colors.pinkAccent),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFA0CF52)),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.green),
                ),
              ),
              obscureText: true,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (builder) => ForgotPassword()));
                },
                child: Text(
                  'Forgot Password ?',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (builder) => SelectionPage()));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: mainColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Text(
                  'Login',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
            SizedBox(height: 30),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (builder) => RegisterPage()));
              },
              child: Center(
                child: RichText(
                  text: TextSpan(
                    text: "Don’t have account ? ",
                    style: TextStyle(color: Colors.grey),
                    children: [
                      TextSpan(
                        text: 'create new',
                        style: TextStyle(color: Colors.purple),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Spacer(flex: 2),
          ],
        ),
      ),
    );
  }

  Widget _buildBackgroundShapes() {
    return Container(
      height: 120,
      child: Stack(
        children: [
          Positioned(
            left: 30,
            top: 30,
            child: Container(
              width: 80,
              height: 20,
              decoration: BoxDecoration(
                color: Color(0xFFF5FDDC),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          Positioned(
            right: 20,
            top: 20,
            child: Container(
              width: 120,
              height: 40,
              decoration: BoxDecoration(
                color: Color(0xFFF5FDDC),
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
