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
// Aliase: Kurznamen für lange URLs
//
// Diese Datei ist fertig. Ein Alias beginnt mit $ und wird überall im
// Projekt erkannt.
// =====================================================================

// ---- CodeSystems (für Codes im Beispiel) ----------------------------
Alias: $sct = http://snomed.info/sct
Alias: $allergy-clinical = http://terminology.hl7.org/CodeSystem/allergyintolerance-clinical
Alias: $allergy-verification = http://terminology.hl7.org/CodeSystem/allergyintolerance-verification

// ---- ValueSets aus CH Term (für Bindings im Profil) -----------------
Alias: $ch-allergy-vs = http://fhir.ch/ig/ch-allergyintolerance/ValueSet/CHAllergyIntoleranceValueSet
Alias: $ch-allergy-manifestation-vs = http://fhir.ch/ig/ch-allergyintolerance/ValueSet/CHAllergyIntoleranceReactionManifestationValueSet
