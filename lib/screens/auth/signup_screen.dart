import 'package:brightminds/screens/auth/login_screen.dart';
import 'package:brightminds/screens/main_dashboard.dart';
import 'package:brightminds/utils/colors.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String selectedGender = ''; // To track selected gender

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Spacer(flex: 2),
              Text(
                'Create Account',
                style: TextStyle(
                  color: Color(0xFFA0CF52),
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 30),
              _buildTextField('Name', 'Enter your full Name'),
              SizedBox(height: 20),
              _buildTextField('Email Address', 'Enter your email'),
              SizedBox(height: 20),
              _buildTextField('Password', 'Enter your password',
                  obscureText: true),
              SizedBox(height: 30),
              Text(
                'Creating Account For',
                style: TextStyle(
                  color: Color(0xFFA0CF52),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildGenderButton('Girl', selectedGender == 'Girl'),
                  SizedBox(width: 20),
                  _buildGenderButton('Boy', selectedGender == 'Boy'),
                ],
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  // Handle Next button logic
                  Navigator.push(context,
                      MaterialPageRoute(builder: (builder) => MainDashboard()));
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
                    'Next',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
              SizedBox(height: 30),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (builder) => LoginPage()));
                },
                child: Center(
                  child: RichText(
                    text: TextSpan(
                      text: "Already have account ? ",
                      style: TextStyle(color: Colors.grey),
                      children: [
                        TextSpan(
                          text: 'Login',
                          style: TextStyle(color: Colors.purple),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              _buildBackgroundShapes(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, String hintText,
      {bool obscureText = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8),
        TextField(
          obscureText: obscureText,
          decoration: InputDecoration(
            hintText: hintText,
            contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildGenderButton(String gender, bool isSelected) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedGender = gender;
        });
      },
      child: Container(
        width: 100,
        height: 40,
        decoration: BoxDecoration(
          color: isSelected ? Color(0xFFF5FDDC) : Colors.transparent,
          border: Border.all(
            color: isSelected ? Colors.transparent : Colors.orange,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        alignment: Alignment.center,
        child: Text(
          gender,
          style: TextStyle(
            color: isSelected ? Colors.green : Colors.orange,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildBackgroundShapes() {
    return Container(
      height: 100,
      child: Stack(
        children: [
          Positioned(
            left: 30,
            bottom: 30,
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
            bottom: 20,
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
