import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('À propos'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // 🔹 Logo en haut
            Image.asset(
              'assets/images/logo_apk.png',
              width: 120,
              height: 120,
            ),
            const SizedBox(height: 24),

            // 🔹 Texte principal
            const Text(
              'Cette application est un quiz interactif sur la vie, les enseignements et les valeurs de Jésus. '
              'Elle a été conçue pour permettre à chacun, quel que soit son niveau de connaissance, de découvrir ou de renforcer sa compréhension des Évangiles, tout en s’amusant.\n\n'
              'Grâce à des questions variées et progressives, vous pouvez tester vos connaissances, apprendre de nouvelles choses et méditer sur des passages importants de la Bible. '
              'Chaque niveau vous offre un défi stimulant et enrichissant, encourageant l’apprentissage continu et la réflexion personnelle.\n\n'
              'Que vous soyez débutant ou connaisseur, cette application vous accompagne dans un voyage ludique et spirituel à travers la vie et les paroles de Jésus, alliant éducation, divertissement et inspiration.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, color: Colors.black87),
            ),

            const SizedBox(height: 40), // espace avant footer

            // 🔹 Footer à la fin du scroll
            const Text(
              'Quiz Jésus',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Version 1.0.0',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            const Text(
              'Développée par Styven IRADUKUNDA\n© 2026',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
