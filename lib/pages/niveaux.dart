// Importation du package Flutter pour utiliser les widgets Material Design
import 'package:flutter/material.dart';

// Importation de la page du quiz facile/moyen/difficile
import 'quiz_facile_page.dart';
import 'quiz_moyen_page.dart';
import 'quiz_difficile_page.dart';

// Définition de la page des niveaux
class LevelPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Scaffold fournit la structure de base (barre d'app, corps, etc.)
    return Scaffold(
      appBar: AppBar(
        title: Text('Connaissez-vous Jésus?'), // Titre de la barre d'app
        backgroundColor: Colors.blue[900],        // Couleur de fond de l'app bar
        foregroundColor: Colors.white,      // couleur du texte
        elevation: 4,                          // Ombre sous la barre
      ),
      body: Container(
        // Fond dégradé violet/bleu
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.blue.shade900,     // Bleu foncé
              Colors.indigo.shade700,   // Indigo profond
              Colors.lightBlue.shade400 // Bleu clair
            ],
            begin: Alignment.topLeft,   // Début du dégradé
            end: Alignment.bottomRight, // Fin du dégradé
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(32.0), // Marges internes
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center, // Centrage vertical
              children: [
                // Icône décorative
                Icon(Icons.school, size: 80, color: Colors.white),
                SizedBox(height: 20), // Espacement vertical

                // Texte principal (titre de la page)
                Text(
                  'Sélectionnez un niveau de quiz ✨',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        blurRadius: 10, // Flou de l'ombre
                        color: Colors.black45,
                        offset: Offset(2, 2),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),

                SizedBox(height: 40), // Espacement avant les boutons

                // 🔹 Bouton Facile
                ElevatedButton(
                  onPressed: () {
                    // Navigation vers la page QuizFacilePage
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const QuizFacilePage()),
                    );
                  },
                  child: Text('Facile'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green.shade400, // Vert
                    foregroundColor: Colors.white,          // Texte blanc
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                    textStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16), // Coins arrondis
                    ),
                    elevation: 8, // Ombre du bouton
                  ),
                ),

                SizedBox(height: 20),

                // 🔹 Bouton Moyen (à compléter)
                ElevatedButton(
                  onPressed: () {
                    // TODO: Navigation vers QuizPage avec niveau Moyen
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const QuizMoyenPage()),
                    );
                  },
                  child: Text('Moyen'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange.shade400, // Orange
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                    textStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 8,
                  ),
                ),

                SizedBox(height: 20),

                // 🔹 Bouton Difficile (à compléter)
                ElevatedButton(
                  onPressed: () {
                    // TODO: Navigation vers QuizPage avec niveau Difficile
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const QuizDifficilePage()),
                    );
                  },
                  child: Text('Difficile'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red.shade400, // Rouge
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                    textStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 8,
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