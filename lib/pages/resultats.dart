// =====================
// Page Résultat
// =====================
import 'package:flutter/material.dart';
import 'quiz_facile_page.dart';
import 'niveaux.dart';


class ResultPage extends StatelessWidget {
  final int score;
  final int total;

  const ResultPage({
    super.key,
    required this.score,
    required this.total,
  });

  String appreciation() {
    if (score >= 9) return 'Excellent 👏';
    if (score >= 7) return 'Bien joué 👍';
    if (score >= 5) return 'Pas mal 🙂';
    return 'À améliorer 🙏';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Résultats'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Score
              Text(
                'Score : $score / $total',
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 12),

              // Appréciation
              Text(
                appreciation(),
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 40),

              // 🔄 Rejouer
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.refresh),
                  label: const Text('Rejouer'),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    textStyle: const TextStyle(fontSize: 18),
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const QuizFacilePage(),
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 16),

              // 🔁 Changer de niveau
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.menu),
                  label: const Text('Changer de niveau'),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    textStyle: const TextStyle(fontSize: 18),
                    backgroundColor: Colors.deepPurple,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (_) => LevelPage(),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
