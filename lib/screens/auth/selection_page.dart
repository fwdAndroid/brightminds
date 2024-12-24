import 'dart:io';

import 'package:brightminds/screens/greek/main_dashboard_greek.dart';
import 'package:brightminds/screens/main_dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SelectionPage extends StatefulWidget {
  const SelectionPage({super.key});

  @override
  State<SelectionPage> createState() => _SelectionPageState();
}

class _SelectionPageState extends State<SelectionPage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          final shouldPop = await _showExitDialog(context);
          return shouldPop ?? false;
        },
        child: Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Selection Page'),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (builder) => MainDashboard()));
                },
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Container(
                    color: Color(0xfff3ffd1),
                    child: SizedBox(
                      height: 100,
                      width: 375,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ListTile(
                            title: Text(
                              "English",
                              style: TextStyle(
                                  color: Color(
                                    0xffb1cd61,
                                  ),
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600),
                            ),
                            trailing: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    fixedSize: Size(100, 43),
                                    backgroundColor: Color(0xffb1cd61)),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (builder) =>
                                              MainDashboard()));
                                },
                                child: Text(
                                  "Start",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                )),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              ///Greeek
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (builder) => MainDashboardGreek()));
                },
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Container(
                    color: Color(0xfff3ffd1),
                    child: SizedBox(
                      height: 100,
                      width: 375,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ListTile(
                            title: Text(
                              "Greek",
                              style: TextStyle(
                                  color: Color(
                                    0xffb1cd61,
                                  ),
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600),
                            ),
                            trailing: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    fixedSize: Size(100, 43),
                                    backgroundColor: Color(0xffb1cd61)),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (builder) =>
                                              MainDashboardGreek()));
                                },
                                child: Text(
                                  "Start",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                )),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  Future<bool?> _showExitDialog(BuildContext context) {
    return showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Exit App'),
        content: Text('Do you want to exit the app?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text('No'),
          ),
          TextButton(
            onPressed: () {
              if (Platform.isAndroid) {
                SystemNavigator.pop(); // For Android
              } else if (Platform.isIOS) {
                exit(0); // For iOS
              }
            },
            child: Text('Yes'),
          ),
        ],
      ),
    );
  }
}
