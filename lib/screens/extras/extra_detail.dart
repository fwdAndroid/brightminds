import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class ExtraDetail extends StatefulWidget {
  final String categoryName;
  final String level;
  final String audioUrl;

  const ExtraDetail({
    super.key,
    required this.categoryName,
    required this.level,
    required this.audioUrl,
  });

  @override
  State<ExtraDetail> createState() => _ExtraDetailState();
}

class _ExtraDetailState extends State<ExtraDetail> {
  late AudioPlayer _audioPlayer;
  bool isPlaying = false;
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  int currentIndex = 0; // Add this line

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.categoryName,
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFFB1CD61),
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: StreamBuilder(
        stream:
            FirebaseFirestore.instance.collection("extraletters").snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          var data = snapshot.data!.docs;
          if (data.isEmpty) {
            return const Center(child: Text('No Exercises Available'));
          }

          // Fetch exercises filtered by categoryName
          var exercises = <Map<String, dynamic>>[];
          for (var document in data) {
            var documentData = document.data() as Map<String, dynamic>;
            var documentExercises = documentData['exercises'] as List<dynamic>;

            var filtered = documentExercises.where((exercise) {
              return exercise['levelSubCategory'] == widget.categoryName;
            }).map((e) => e as Map<String, dynamic>);

            exercises.addAll(filtered);
          }

          if (exercises.isEmpty) {
            return const Center(child: Text('No Exercises Found'));
          }

          // Sort exercises in sequence: numbers first, then extraletters alphabetically
          exercises.sort((a, b) {
            int parseOrder(String? characterName) {
              // Extract number from the beginning of the string
              final numberMatch =
                  RegExp(r'^\d+').firstMatch(characterName ?? '');
              if (numberMatch != null) {
                return int.parse(
                    numberMatch.group(0)!); // Return the number if found
              }
              // For non-numeric strings, treat them as a very large number for sequence ordering
              return double.maxFinite.toInt();
            }

            String parseString(String? characterName) {
              // If no number is found, return the string part in lowercase for sorting
              return characterName?.toLowerCase() ?? '';
            }

            int orderA = parseOrder(a['characterName']);
            int orderB = parseOrder(b['characterName']);

            // First compare numbers
            if (orderA != orderB) {
              return orderA.compareTo(orderB);
            }

            // If both are not numbers, compare alphabetically
            return parseString(a['characterName'])
                .compareTo(parseString(b['characterName']));
          });

          var currentExercise = exercises[currentIndex];

          // UI for the current exercise
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image.network(
                    currentExercise['photoURL'] ?? '',
                    height: 300,
                    width: 300,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(
                        Icons.image_not_supported,
                        size: 200,
                        color: Colors.grey,
                      );
                    },
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  currentExercise['characterName'] ?? 'Unknown',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: currentIndex > 0
                          ? () async {
                              // Go to previous exercise
                              setState(() {
                                currentIndex--;
                                isPlaying = false;
                              });
                              await _audioPlayer.stop();
                            }
                          : null,
                      icon:
                          const Icon(Icons.skip_previous, color: Colors.black),
                    ),
                    isLoading
                        ? const Text(
                            "Sound is loading...",
                            style: TextStyle(color: Colors.black),
                          )
                        : ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFB1CD61),
                            ),
                            onPressed: () async {
                              if (isPlaying) {
                                await _audioPlayer.pause();
                                setState(() {
                                  isPlaying = false;
                                });
                              } else {
                                try {
                                  setState(() {
                                    isLoading = true; // Start loading
                                  });

                                  // Load the audio URL
                                  await _audioPlayer
                                      .setUrl(currentExercise['audioURL']);

                                  // Listen for changes in the player state
                                  _audioPlayer.playerStateStream
                                      .listen((state) {
                                    if (state.processingState ==
                                        ProcessingState.ready) {
                                      // When audio is ready, start playing
                                      _audioPlayer.play();
                                      setState(() {
                                        isPlaying = true;
                                        isLoading = false; // Stop loading
                                      });
                                    } else if (state.processingState ==
                                        ProcessingState.completed) {
                                      // When audio finishes playing
                                      setState(() {
                                        isPlaying = false;
                                      });
                                    }
                                  });
                                } catch (e) {
                                  print("Error playing audio: $e");
                                  setState(() {
                                    isLoading = false; // Stop loading on error
                                  });
                                  // ScaffoldMessenger.of(context).showSnackBar(
                                  //   const SnackBar(
                                  //     content: Text(
                                  //         'Error: Could not play the audio'),
                                  //   ),
                                  // );
                                }
                              }
                            },
                            child: const Text(
                              "Play",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                    IconButton(
                      onPressed: currentIndex < exercises.length - 1
                          ? () async {
                              // Go to next exercise
                              setState(() {
                                currentIndex++;
                                isPlaying = false;
                              });
                              await _audioPlayer.stop();
                            }
                          : null,
                      icon: const Icon(Icons.skip_next, color: Colors.black),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
