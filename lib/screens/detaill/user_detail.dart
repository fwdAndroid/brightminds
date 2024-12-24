import 'package:brightminds/screens/main_dashboard.dart';
import 'package:brightminds/utils/colors.dart';
import 'package:flutter/material.dart';

class UserDetail extends StatefulWidget {
  const UserDetail({super.key});

  @override
  State<UserDetail> createState() => _UserDetailState();
}

class _UserDetailState extends State<UserDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Select Avatar',
                style: TextStyle(
                  color: Color(0xFFA0CF52),
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/brown.png",
                  height: 81,
                  width: 81,
                ),
                Image.asset(
                  "assets/green.png",
                  height: 81,
                  width: 81,
                ),
                Image.asset(
                  "assets/yellow.png",
                  height: 81,
                  width: 81,
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/purple.png",
                  height: 81,
                  width: 81,
                ),
                Image.asset(
                  "assets/parrot.png",
                  height: 81,
                  width: 81,
                ),
                Image.asset(
                  "assets/blue.png",
                  height: 81,
                  width: 81,
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Select Age',
                style: TextStyle(
                  color: Color(0xFFA0CF52),
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Image.asset("assets/Frame 111.png"),
            SizedBox(height: 30),
            Center(
              child: ElevatedButton(
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
                    'Submit',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
