import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:audioplayers/audioplayers.dart';

import '../data/questions_difficile.dart';
import 'niveaux.dart';
import 'resultats.dart';
import 'bible_view.dart'; // 🔹 Import WebView Bible

class QuizDifficilePage extends StatefulWidget {
  const QuizDifficilePage({super.key});

  @override
  State<QuizDifficilePage> createState() => _QuizDifficilePageState();
}

class _QuizDifficilePageState extends State<QuizDifficilePage> {
  late final AudioPlayer _audioPlayer;
  late List<Map<String, dynamic>> selectedQuestions;
  int currentIndex = 0;
  int score = 0;
  String? selectedOption;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

    selectedQuestions = List<Map<String, dynamic>>.from(questionsDifficile)..shuffle();
    selectedQuestions = selectedQuestions.take(10).toList();
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    super.dispose();
  }

  Future<void> checkAnswer(String option) async {
    final bool isCorrect = option == selectedQuestions[currentIndex]['answer'];
    setState(() {
      selectedOption = option;
      if (isCorrect) score++;
    });

    await _audioPlayer.stop();
    await _audioPlayer.play(
      AssetSource(isCorrect ? 'sounds/correct.mp3' : 'sounds/wrong.mp3'),
    );
  }

  void nextQuestion() {
    if (currentIndex < selectedQuestions.length - 1) {
      setState(() {
        currentIndex++;
        selectedOption = null;
      });
    }
  }

  // 🔹 Ouvrir la référence biblique dans la WebView intégrée
  void openReference(String ref) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => BibleViewPage(reference: ref),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final question = selectedQuestions[currentIndex];
    final questionText = question['question'] as String;
    final options = List<String>.from(question['options'] ?? []);
    final correct = question['answer'] as String;
    final isLast = currentIndex == selectedQuestions.length - 1;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Niveau Difficile'),
        foregroundColor: Colors.white,
        backgroundColor: Colors.deepPurple,
      ),
      body: MediaQuery.removePadding(
        context: context,
        removeBottom: true,
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/cross.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: SafeArea(
            top: true,
            bottom: false,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'Question ${currentIndex + 1} / ${selectedQuestions.length}',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 12),
                        Card(
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16)),
                          color: Colors.white.withOpacity(0.9),
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Text(
                              questionText,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.deepPurple,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),

                        ...options.map((o) {
                          final bool isCorrectOption = o == correct;
                          final bool isSelected = selectedOption == o;
                          Color baseColor = Colors.deepPurple.shade500;
                          IconData? icon;
                          if (selectedOption != null) {
                            if (isCorrectOption) {
                              baseColor = Colors.green.shade600;
                              icon = Icons.check;
                            } else if (isSelected && !isCorrectOption) {
                              baseColor = Colors.red.shade600;
                              icon = Icons.close;
                            }
                          }
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 6),
                            child: Container(
                              decoration: BoxDecoration(
                                color: baseColor.withOpacity(
                                  (selectedOption != null &&
                                          !isCorrectOption &&
                                          !isSelected)
                                      ? 0.4
                                      : 1.0,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.transparent,
                                  foregroundColor: Colors.white,
                                  padding: const EdgeInsets.symmetric(vertical: 12),
                                  textStyle: const TextStyle(fontSize: 18),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                onPressed: selectedOption == null
                                    ? () => checkAnswer(o)
                                    : null,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(o),
                                    if (icon != null) ...[
                                      const SizedBox(width: 8),
                                      Icon(icon, color: Colors.white)
                                    ]
                                  ],
                                ),
                              ),
                            ),
                          );
                        }).toList(),

                        if (selectedOption != null)
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            child: Column(
                              children: [
                                Text(
                                  selectedOption == correct
                                      ? "Bonne réponse ✅"
                                      : "Mauvaise réponse ❌",
                                  style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: selectedOption == correct
                                        ? Colors.green
                                        : Colors.red,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: 8),
                                GestureDetector(
                                  onTap: () {
                                    final ref = question['reference'] ?? '';
                                    if (ref.isNotEmpty) {
                                      openReference(ref); // 🔹 ouverture WebView
                                    }
                                  },
                                  child: Text(
                                    question['reference'] ?? '',
                                    style: const TextStyle(
                                      fontSize: 18,
                                      color: Colors.yellowAccent,
                                      fontWeight: FontWeight.bold,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
                if (selectedOption != null)
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: isLast
                            ? () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => ResultPage(
                                      score: score,
                                      total: selectedQuestions.length,
                                    ),
                                  ),
                                );
                              }
                            : nextQuestion,
                        child: Text(isLast ? 'Voir les résultats' : 'Suivant'),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
