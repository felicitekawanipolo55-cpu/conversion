import 'dart:io';

void main() {
  print("CONVERTISSEUR ARABE | ROMAIN");

  // Conversion des nombres arabe vers le nombre romain
  print("\nEntrez un nombre arabe (1 à 3999) : ");
  String? saisie = stdin.readLineSync();

  int? nombreArabe = int.tryParse(saisie ?? "");

  if (nombreArabe == null) {
    print("Erreur : veuillez entrer un nombre valide !");
  } else if (nombreArabe <= 0 || nombreArabe > 3999) {
    print("Erreur : le nombre doit être compris entre 1 et 3999.");
  } else {
    print("En romain : ${arabeRomain(nombreArabe)}");
  }

  // Conversion des nombres romains vers Arabe {Les entrees de l'utilisateur}
  print("\nEntrez un nombre romain : ");
  String? nombreRomain = stdin.readLineSync();

  if (nombreRomain == null || nombreRomain.isEmpty) {
    print("Erreur : entrée invalide !");
  } else {
    print("En arabe : ${romainArabe(nombreRomain)}");
  }
}

// Fonction qui convertit un nombre arabe en nombre romain
String arabeRomain(int nombre) {
  Map<int, String> correspondance = {
    1000: 'M',
    900: 'CM',
    500: 'D',
    400: 'CD',
    100: 'C',
    90: 'XC',
    50: 'L',
    40: 'XL',
    10: 'X',
    9: 'IX',
    5: 'V',
    4: 'IV',
    1: 'I',
  };

  String resultat = '';

  correspondance.forEach((valeur, symbole) {
    while (nombre >= valeur) {
      resultat += symbole;
      nombre -= valeur;
    }
  });

  return resultat;
}

// Fonction qui convertit un nombre romain en nombre arabe
int romainArabe(String romain) {
  romain = romain.toUpperCase();

  Map<String, int> correspondance = {
    'I': 1,
    'V': 5,
    'X': 10,
    'L': 50,
    'C': 100,
    'D': 500,
    'M': 1000,
  };

  int total = 0;

  for (int i = 0; i < romain.length; i++) {
    if (!correspondance.containsKey(romain[i])) {
      print("[Erreur]: Le nombre maximum a convertir est 3999");
      return 0;
    }

    int valeur = correspondance[romain[i]]!;

    if (i + 1 < romain.length && valeur < correspondance[romain[i + 1]]!) {
      total -= valeur;
    } else {
      total += valeur;
    }
  }

  return total;
}
