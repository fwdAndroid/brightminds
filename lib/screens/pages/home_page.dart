import 'package:brightminds/screens/categories/category_page_3.dart';
import 'package:brightminds/screens/extras/extra_class.dart';

import 'package:flutter/material.dart';

class HomePAges extends StatefulWidget {
  const HomePAges({super.key});

  @override
  State<HomePAges> createState() => _HomePAgesState();
}

class _HomePAgesState extends State<HomePAges> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Pick your grade",
          style: TextStyle(
            color: Colors.green,
            fontWeight: FontWeight.bold,
            fontSize: 17,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Select the academic grade level your child is currently in.",
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
              SizedBox(height: 17),
              //Pre Kind
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (builder) => CategoryPage3(
                                level: "Pre-Kindergarden",
                              )));
                },
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Container(
                    color: Color(0xfff3ffd1),
                    child: SizedBox(
                      height: 140,
                      width: 375,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ListTile(
                            title: Text(
                              "Pre-Kindergarden",
                              style: TextStyle(
                                  color: Color(
                                    0xffb1cd61,
                                  ),
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600),
                            ),
                            subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "(Ages 2 - 4)",
                                    style: TextStyle(
                                        color: Color(
                                          0xffb1cd61,
                                        ),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ]),
                            trailing: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    fixedSize: Size(140, 43),
                                    backgroundColor: Color(0xffb1cd61)),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (builder) => CategoryPage3(
                                                level: "Pre-Kindergarden",
                                              )));
                                },
                                child: Text(
                                  "Resume",
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
              // Kind
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (builder) => CategoryPage3(
                                level: "Kindergarden",
                              )));
                },
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Container(
                    color: Color(0xfff3ffd1),
                    child: SizedBox(
                      height: 140,
                      width: 375,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ListTile(
                            title: Text(
                              "Kindergarden",
                              style: TextStyle(
                                  color: Color(
                                    0xffb1cd61,
                                  ),
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "(Ages 4 - 5)",
                                  style: TextStyle(
                                      color: Color(
                                        0xffb1cd61,
                                      ),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700),
                                ),
                              ],
                            ),
                            trailing: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    fixedSize: Size(140, 43),
                                    backgroundColor: Color(0xffb1cd61)),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (builder) => CategoryPage3(
                                                level: "Kindergarden",
                                              )));
                                },
                                child: Text(
                                  "Resume",
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
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (builder) => CategoryPage3(
                                level: "Level 1",
                              )));
                },
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Container(
                    color: Color(0xfff3ffd1),
                    child: SizedBox(
                      height: 140,
                      width: 375,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ListTile(
                            title: Text(
                              "Level 1",
                              style: TextStyle(
                                  color: Color(
                                    0xffb1cd61,
                                  ),
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600),
                            ),
                            subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "(Ages 6 - 7)",
                                    style: TextStyle(
                                        color: Color(
                                          0xffb1cd61,
                                        ),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (builder) =>
                                                    ExtraClass(
                                                      level: "Level 1",
                                                    )));
                                      },
                                      child: Text("Extra"))
                                ]),
                            trailing: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    fixedSize: Size(140, 43),
                                    backgroundColor: Color(0xffb1cd61)),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (builder) => CategoryPage3(
                                                level: "Level 1",
                                              )));
                                },
                                child: Text(
                                  "Resume",
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
              //2nd Grad
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (builder) => CategoryPage3(
                                level: "Level 2",
                              )));
                },
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Container(
                    color: Color(0xfff3ffd1),
                    child: SizedBox(
                      height: 140,
                      width: 375,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ListTile(
                            title: Text(
                              "Level 2",
                              style: TextStyle(
                                  color: Color(
                                    0xffb1cd61,
                                  ),
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600),
                            ),
                            subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "(Ages 7 - 8)",
                                    style: TextStyle(
                                        color: Color(
                                          0xffb1cd61,
                                        ),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (builder) =>
                                                    ExtraClass(
                                                      level: "Level 2",
                                                    )));
                                      },
                                      child: Text("Extra"))
                                ]),
                            trailing: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    fixedSize: Size(140, 43),
                                    backgroundColor: Color(0xffb1cd61)),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (builder) =>
                                              CategoryPage3(level: "Level 2")));
                                },
                                child: Text(
                                  "Resume",
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
              //2nd Grad
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (builder) =>
                              CategoryPage3(level: "Level 3")));
                },
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Container(
                    color: Color(0xfff3ffd1),
                    child: SizedBox(
                      height: 140,
                      width: 375,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ListTile(
                            title: Text(
                              "Level 3",
                              style: TextStyle(
                                  color: Color(
                                    0xffb1cd61,
                                  ),
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600),
                            ),
                            subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "(Ages 8 - 9)",
                                    style: TextStyle(
                                        color: Color(
                                          0xffb1cd61,
                                        ),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (builder) =>
                                                    ExtraClass(
                                                      level: "Level 3",
                                                    )));
                                      },
                                      child: Text("Extra"))
                                ]),
                            trailing: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    fixedSize: Size(140, 43),
                                    backgroundColor: Color(0xffb1cd61)),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (builder) =>
                                              CategoryPage3(level: "Level 3")));
                                },
                                child: Text(
                                  "Resume",
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
              //4th Grade
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (builder) => CategoryPage3(
                                level: "Level 4",
                              )));
                },
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Container(
                    color: Color(0xfff3ffd1),
                    child: SizedBox(
                      height: 140,
                      width: 375,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ListTile(
                            title: Text(
                              "Level 4",
                              style: TextStyle(
                                  color: Color(
                                    0xffb1cd61,
                                  ),
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600),
                            ),
                            subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "(Ages 9 - 10)",
                                    style: TextStyle(
                                        color: Color(
                                          0xffb1cd61,
                                        ),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (builder) =>
                                                    ExtraClass(
                                                      level: "Level 4",
                                                    )));
                                      },
                                      child: Text("Extra"))
                                ]),
                            trailing: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    fixedSize: Size(140, 43),
                                    backgroundColor: Color(0xffb1cd61)),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (builder) => CategoryPage3(
                                                level: "Level 4",
                                              )));
                                },
                                child: Text(
                                  "Resume",
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
              //5th Grade
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (builder) => CategoryPage3(
                                level: "Level 5",
                              )));
                },
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Container(
                    color: Color(0xfff3ffd1),
                    child: SizedBox(
                      height: 140,
                      width: 375,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ListTile(
                            title: Text(
                              "Level 5",
                              style: TextStyle(
                                  color: Color(
                                    0xffb1cd61,
                                  ),
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600),
                            ),
                            subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "(Ages 10 -11)",
                                    style: TextStyle(
                                        color: Color(
                                          0xffb1cd61,
                                        ),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (builder) =>
                                                    ExtraClass(
                                                      level: "Level 5",
                                                    )));
                                      },
                                      child: Text("Extra"))
                                ]),
                            trailing: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    fixedSize: Size(140, 43),
                                    backgroundColor: Color(0xffb1cd61)),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (builder) => CategoryPage3(
                                                level: "Level 5",
                                              )));
                                },
                                child: Text(
                                  "Resume",
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
              //5th Grade
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (builder) => CategoryPage3(
                                level: "Level 6",
                              )));
                },
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Container(
                    color: Color(0xfff3ffd1),
                    child: SizedBox(
                      height: 140,
                      width: 375,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ListTile(
                            title: Text(
                              "Level 6",
                              style: TextStyle(
                                  color: Color(
                                    0xffb1cd61,
                                  ),
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600),
                            ),
                            subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "(Ages 11 - 12)",
                                    style: TextStyle(
                                        color: Color(
                                          0xffb1cd61,
                                        ),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (builder) =>
                                                    ExtraClass(
                                                      level: "Level 6",
                                                    )));
                                      },
                                      child: Text("Extra"))
                                ]),
                            trailing: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    fixedSize: Size(140, 43),
                                    backgroundColor: Color(0xffb1cd61)),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (builder) =>
                                              CategoryPage3(level: "Level 6")));
                                },
                                child: Text(
                                  "Resume",
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
        ),
      ),
    );
  }
}
