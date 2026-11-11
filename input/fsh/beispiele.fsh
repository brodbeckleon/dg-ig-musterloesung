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
// Schritt 6: Beispiel
//
// Erstellt ein gültiges Beispiel zu eurem Profil. Patientin, Ärztin und
// Praxis gibt es schon (basis-beispiele.fsh). Entfernt die // und ersetzt
// die TODOs. Das Beispiel muss alle Regeln aus eurem Profil erfüllen,
// auch die Invariante: Ist die Allergie bestätigt (confirmed), braucht
// sie eine Reaktion.
// =====================================================================

// Instance: TODO_Name                        // z. B. PenicillinAllergieAnna
// InstanceOf: DgMedicationAllergy
// Usage: #example
// Title: "TODO Titel"
// Description: "TODO: Was zeigt dieses Beispiel?"
// * patient = Reference(AnnaMuster)
// * category = TODO
// * clinicalStatus = $allergy-clinical#TODO
// * verificationStatus = $allergy-verification#TODO
// * code = $sct#TODO "TODO Display"
// * criticality = TODO
// * onsetDateTime = "TODO"
// * recorder = Reference(TODO)
// * reaction.manifestation = $sct#TODO "TODO Display"
