/* ---------------------------------------------------------------------------
 * --  _____       _____ _______                                             -
 * -- |_   _|     |_   _|__   __|                                            -
 * --   | |  _ __   | |    | |       Institute of Computer Science           -
 * --   | | | '_ \  | |    | |       Zurich University of                    -
 * --  _| |_| | | |_| |_   | |       Applied Sciences                        -
 * -- |_____|_| |_|_____|  |_|       8401 Winterthur, Switzerland            -
 * ---------------------------------------------------------------------------
 */

// =====================================================================
// Schritt 5: Euer Profil
//
// Die Kopfzeilen sind schon ausgefüllt. Für jede Anforderung aus dem
// Aufgabenblatt steht unten eine auskommentierte Zeile mit dem Element.
// Entfernt die // und ersetzt TODO_Regel durch die Regel, die ihr
// gewählt habt. Eine Anforderung kann auch mehrere Zeilen brauchen.
//
// Wichtig: Hier stehen Regeln für alle Allergien, z. B. "criticality MS".
// Einen Wert setzt ihr im Profil nur, wenn er für jede Allergie immer
// gilt (Wert fixieren). Werte, die nur für eine bestimmte Patientin
// gelten, z. B. criticality #high, gehören ins Beispiel (beispiele.fsh).
//
// Regeltypen:
//   Kardinalität   * element 1..1
//   Must Support   * element MS
//   Binding        * element from $ValueSet (required)
//   Typ            * element[x] only dateTime
//                  * element only Reference(CHCorePractitioner)
//   Wert           * element = #code
//
// Nach jeder Änderung lokal prüfen:  sushi build .
// =====================================================================

Profile: DgMedicationAllergy
Parent: CHCoreAllergyIntolerance
Id: dg-medication-allergy
Title: "DG Arzneimittelallergie"
Description: "Arzneimittelallergie, wie sie in der Hausarztpraxis erfasst und auf der Notfallstation gelesen wird."

// Anforderung 1: nur Allergien gegen Arzneimittel
// * category TODO_Regel

// Anforderung 2: klinischer Status
// * clinicalStatus TODO_Regel

// Anforderung 3: Codes aus der Schweizer Allergieliste ($ch-allergy-vs)
// * code TODO_Regel

// Anforderung 4: Kritikalität (wie gefährlich die Allergie ist)
// * criticality TODO_Regel

// Anforderung 5: Beginn der Allergie
// * onset[x] TODO_Regel

// Anforderung 6: wer die Allergie erfasst hat
// * recorder TODO_Regel

// Anforderung 7: Reaktionen (die Symptome einer Reaktion stehen in reaction.manifestation)
// * reaction TODO_Regel
// * reaction.manifestation TODO_Regel   (nur falls ihr dafür eine Regel braucht)

// Invariante (steht schon in invarianten.fsh), nur die // entfernen:
// * obeys dg-allergy-1
