import 'package:brightminds/screens/extras/extra_detail.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ExtraClass extends StatefulWidget {
  String level;
  ExtraClass({super.key, required this.level});

  @override
  State<ExtraClass> createState() => _ExtraClassState();
}

class _ExtraClassState extends State<ExtraClass> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Extra Subject"),
        ),
        body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection("extras")
              .where("level", isEqualTo: widget.level)
              .snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            // Error handling
            if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }

            // Loading state
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            // If no data is found
            var data = snapshot.data!.docs;
            if (data.isEmpty) {
              return const Center(
                child: Text('No extras clases Available'),
              );
            }

            return LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                // Dynamically calculate the number of columns based on screen width
                int columns = (constraints.maxWidth / 300).floor();

                return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: columns,
                    crossAxisSpacing: 8.0,
                    mainAxisSpacing: 8.0,
                  ),
                  itemCount: data.length,
                  itemBuilder: (BuildContext context, int index) {
                    // Safely parse Firestore document data
                    var documentData =
                        data[index].data() as Map<String, dynamic>;
                    var categoryName = documentData['categoryName'] ?? 'N/A';
                    var photoURL = documentData['photoURL'] ?? '';
                    var level = documentData['level'] ?? 'N/A';
                    var audioUrl = documentData['audioURL'] ?? '';

                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (builder) => ExtraDetail(
                                    audioUrl: audioUrl,
                                    categoryName: categoryName,
                                    level: level)));
                        // Handle navigation or actions here
                        print('Category Selected: $categoryName');
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 4,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Display image if available, otherwise show a placeholder
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: photoURL.isNotEmpty
                                  ? Image.network(
                                      photoURL,
                                      height: 120,
                                      width: 120,
                                      fit: BoxFit.cover,
                                    )
                                  : const Icon(
                                      Icons.image,
                                      size: 120,
                                      color: Colors.grey,
                                    ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              categoryName,
                              style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 4),
                            Text(
                              "Level: $level",
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}
