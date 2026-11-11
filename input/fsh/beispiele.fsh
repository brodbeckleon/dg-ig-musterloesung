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
// Musterlösung Schritt 6: Beispiele
//
// PenicillinAllergieAnna ist die Musterlösung für Schritt 6. Sie erfüllt
// Variante A und Variante B. Die weiteren Beispiele zeigen, was die
// offenen Entscheidungen in Variante A erlauben und wie Variante B aussieht.
// =====================================================================

// ---- Musterlösung (erfüllt Variante A und Variante B) ----------------

Instance: PenicillinAllergieAnna
InstanceOf: DgMedicationAllergy
Usage: #example
Title: "Bestätigte Penicillinallergie"
Description: "Anna Muster reagierte 2019 auf Penicillin mit Urtikaria."
* patient = Reference(AnnaMuster)
* category = #medication
* clinicalStatus = $allergy-clinical#active
* verificationStatus = $allergy-verification#confirmed
* code = $sct#91936005 "Allergy to penicillin (finding)"
* criticality = #high
* onsetDateTime = "2019-06-02"
* recorder = Reference(DrSaraKeller)
* reaction.manifestation = $sct#126485001 "Urticaria (disorder)"

// ---- Zusatzbeispiel Variante A ----------------------------------------
// Zeigt, was nur Variante A erlaubt: Beginn als Alter, Erfasserin in ihrer
// Rolle in der Praxis. Die Allergie ist unbestätigt, deshalb verlangt die
// Invariante keine Reaktion. Gültig nach Variante A, ungültig nach B.

Instance: BenzylpenicillinVerdachtAnna
InstanceOf: DgMedicationAllergy
Usage: #example
Title: "Unbestätigter Verdacht auf Benzylpenicillinallergie"
Description: "Anna Muster weiss nur noch, dass die Allergie etwa mit 30 Jahren aufgetreten ist. Die Reaktion ist nicht bekannt."
* patient = Reference(AnnaMuster)
* category = #medication
* clinicalStatus = $allergy-clinical#active
* verificationStatus = $allergy-verification#unconfirmed
* code = $sct#294499007 "Allergy to benzylpenicillin (finding)"
* criticality = #unable-to-assess
* onsetAge = 30 'a' "Jahre"
* recorder = Reference(DrSaraKellerPraxisAmPark)

// ---- Beispiel Variante B ----------------------------------------------
// Dieselbe Allergie wie PenicillinAllergieAnna, geprüft gegen das strenge
// Profil.

Instance: PenicillinAllergieAnnaStreng
InstanceOf: DgMedicationAllergyStreng
Usage: #example
Title: "Bestätigte Penicillinallergie (Variante B)"
Description: "Wie PenicillinAllergieAnna, validiert gegen Variante B."
* patient = Reference(AnnaMuster)
* category = #medication
* clinicalStatus = $allergy-clinical#active
* verificationStatus = $allergy-verification#confirmed
* code = $sct#91936005 "Allergy to penicillin (finding)"
* criticality = #high
* onsetDateTime = "2019-06-02"
* recorder = Reference(DrSaraKeller)
* reaction.manifestation = $sct#126485001 "Urticaria (disorder)"

// ---- Nur zum Testen des QA-Reports, nicht Teil der Aufgabe ------------
// Verletzt die Invariante dg-allergy-1 (bestätigt, aber ohne Reaktion).
// SUSHI baut das ohne Fehler, erst der IG Publisher meldet einen Error.
// Zum Ausprobieren die // entfernen und pushen. Danach wieder
// auskommentieren, sonst hat der QA-Report einen Error.
//
// Instance: TestBestaetigtOhneReaktion
// InstanceOf: DgMedicationAllergy
// Usage: #example
// Title: "Test: absichtlich ungültig, bestätigt ohne Reaktion"
// * patient = Reference(AnnaMuster)
// * category = #medication
// * clinicalStatus = $allergy-clinical#active
// * verificationStatus = $allergy-verification#confirmed
// * code = $sct#294499007 "Allergy to benzylpenicillin (finding)"
// * criticality = #low
// * onsetDateTime = "2020-01-01"
// * recorder = Reference(DrSaraKeller)
