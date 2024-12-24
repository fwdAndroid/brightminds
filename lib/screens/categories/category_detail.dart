import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class CategoryDetail extends StatefulWidget {
  final String categoryName;
  final String level;
  final String audioUrl;

  const CategoryDetail({
    super.key,
    required this.categoryName,
    required this.level,
    required this.audioUrl,
  });

  @override
  State<CategoryDetail> createState() => _CategoryDetailState();
}

class _CategoryDetailState extends State<CategoryDetail> {
  late List<AudioPlayer> _audioPlayers; // List of audio players for preloading
  late List<Map<String, dynamic>> exercises; // Filtered and sorted exercises
  bool isPlaying = false;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _audioPlayers = [];
    exercises = [];
    fetchAndPreloadData();
  }

  @override
  void dispose() {
    // Dispose of all preloaded audio players
    for (var player in _audioPlayers) {
      player.dispose();
    }
    super.dispose();
  }

  Future<void> fetchAndPreloadData() async {
    var snapshot = await FirebaseFirestore.instance.collection("letters").get();
    var data = snapshot.docs;

    if (data.isNotEmpty) {
      var tempExercises = <Map<String, dynamic>>[];
      for (var document in data) {
        var documentData = document.data() as Map<String, dynamic>;
        var documentExercises = documentData['exercises'] as List<dynamic>;

        var filtered = documentExercises.where((exercise) {
          return exercise['levelSubCategory'] == widget.categoryName;
        }).map((e) => e as Map<String, dynamic>);

        tempExercises.addAll(filtered);
      }

      if (tempExercises.isEmpty) {
        return;
      }

      // Sort exercises
      tempExercises.sort((a, b) {
        int parseOrder(String? characterName) {
          final numberMatch = RegExp(r'^\d+').firstMatch(characterName ?? '');
          if (numberMatch != null) {
            return int.parse(numberMatch.group(0)!);
          }
          return double.maxFinite.toInt();
        }

        String parseString(String? characterName) {
          return characterName?.toLowerCase() ?? '';
        }

        int orderA = parseOrder(a['characterName']);
        int orderB = parseOrder(b['characterName']);

        if (orderA != orderB) {
          return orderA.compareTo(orderB);
        }

        return parseString(a['characterName'])
            .compareTo(parseString(b['characterName']));
      });

      setState(() {
        exercises = tempExercises;
      });

      // Preload audio for sorted exercises
      for (var exercise in exercises) {
        var player = AudioPlayer();
        if (exercise['audioURL'] != null) {
          try {
            await player.setUrl(exercise['audioURL']);
          } catch (e) {
            print("Error preloading audio: $e");
          }
        }
        _audioPlayers.add(player);
      }
    }
  }

  void navigateToIndex(int index) async {
    if (_audioPlayers.isEmpty || index >= _audioPlayers.length) return;

    // Stop the current audio if playing
    if (isPlaying) {
      await _audioPlayers[currentIndex].stop();
      await _audioPlayers[currentIndex]
          .seek(Duration.zero); // Reset to the beginning
      setState(() {
        isPlaying = false;
      });
    }

    // Update the index
    setState(() {
      currentIndex = index;
    });

    // Play the new audio at the updated index
    playCurrentAudio();
  }

  void playCurrentAudio() async {
    if (_audioPlayers.isEmpty || currentIndex >= _audioPlayers.length) return;

    final currentPlayer = _audioPlayers[currentIndex];

    // Stop all other players to ensure only one sound is playing
    for (var i = 0; i < _audioPlayers.length; i++) {
      if (i != currentIndex && _audioPlayers[i].playing) {
        await _audioPlayers[i].stop();
      }
    }

    // Toggle playback for the current index
    if (isPlaying) {
      // Pause the current audio
      await currentPlayer.pause();
      setState(() {
        isPlaying = false;
      });
    } else {
      // Play the current sound
      await currentPlayer.seek(Duration.zero); // Reset to the beginning
      await currentPlayer.play();
      setState(() {
        isPlaying = true;
      });

      // Listen for when the audio finishes
      currentPlayer.playerStateStream.listen((state) {
        if (state.processingState == ProcessingState.completed) {
          setState(() {
            isPlaying = false;
          });
        }
      });
    }
  }

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
      body: exercises.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image.network(
                      exercises[currentIndex]['photoURL'] ?? '',
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
                    exercises[currentIndex]['characterName'] ?? 'Unknown',
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
                            ? () {
                                navigateToIndex(currentIndex - 1);
                              }
                            : null,
                        icon: const Icon(Icons.skip_previous,
                            color: Colors.black),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFB1CD61),
                        ),
                        onPressed: playCurrentAudio,
                        child: Text(
                          isPlaying ? "Pause" : "Play",
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                      IconButton(
                        onPressed: currentIndex < exercises.length - 1
                            ? () {
                                navigateToIndex(currentIndex + 1);
                              }
                            : null,
                        icon: const Icon(Icons.skip_next, color: Colors.black),
                      ),
                    ],
                  ),
                ],
              ),
            ),
    );
  }
}
