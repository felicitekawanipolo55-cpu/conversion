import 'dart:io';

//Une fonction qui recoit un texte ex: IX, et retourne un entier ex: 9
int convertirRomainEnArabe(String romain) {
  romain = romain.toUpperCase();

  // Map est un dictionnaire (cle : lettre romaine et valeur est Nombre Arabe)
  Map<String, int> correspondance = {
    'I': 1,
    'V': 5,
    'X': 10,
    'L': 50,
    'C': 100,
    'D': 500,
    'M': 1000,
  };
  //Variable totale qui ici, accumule le resulat
  int total = 0;

  // La boucle for parcourt chaque lettre du mot romain
  for (int i = 0; i < romain.length; i++) {
    int valeur = correspondance[romain[i]]!;

    // On verifie si Est-ce qu’il y a une lettre après ?, ou est-ce que la valeur actuelle est plus petite que la suivante ? pour maintenant appliquer les regles de la coversions de romain en arabe (Soustraction ou addition)
    if (i + 1 < romain.length && valeur < correspondance[romain[i + 1]]!) {
      total -= valeur;
    } else {
      total += valeur;
    }
  }

  return total;
}

// Une autre fonction qui reçoit un nombre et retournr un texte
String convertirArabeEnRomain(int nombre) {
  //On commence par les grandes valeurs
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
    //Tant que le nombre est plus grand que la valeur : on ajoute le symbole ou on soustrait la valeur
    while (nombre >= valeur) {
      resultat += symbole;
      nombre -= valeur;
    }
  });

  return resultat;
}

void main() {
  // pour lire maintenant ce que l'utlisateur ecrit
  print("Entrez un nombre romain (ex: IX) : ");
  String romain = stdin.readLineSync()!;
  print("En arabe : ${convertirRomainEnArabe(romain)}");

  print("\nEntrez un nombre arabe (ex: 9) : ");
  int nombre = int.parse(stdin.readLineSync()!);
  print("En romain : ${convertirArabeEnRomain(nombre)}");
}
