/* ---------------------------------------------------------------------------
 * --  _____       _____ _______                                             -
 * -- |_   _|     |_   _|__   __|                                            -
 * --   | |  _ __   | |    | |       Institute of Computer Science           -
 * --   | | | '_ \  | |    | |       Zurich University of                    -
 * --  _| |_| | | |_| |_   | |       Applied Sciences                        -
 * -- |_____|_| |_|_____|  |_|       8401 Winterthur, Switzerland            -
 * ---------------------------------------------------------------------------
 */

// Musterlösung Variante B: die strengere Lesart der offenen Anforderungen 3 bis 6.
//
// Inhaltlich identisch mit profil-variante-b.fsh aus den Lösungsunterlagen.
// Damit beide Varianten im selben IG nebeneinander stehen können, hat das
// Profil hier einen eigenen Namen und eine eigene Id. Im Lab heisst das
// Profil der Studierenden immer DgMedicationAllergy.

Profile: DgMedicationAllergyStreng
Parent: CHCoreAllergyIntolerance
Id: dg-medication-allergy-streng
Title: "DG Arzneimittelallergie (Variante B, streng)"
Description: "Strengere Lesart der Musterlösung: Code nur aus der Schweizer Allergieliste, Kritikalität Pflicht, Beginn nur als Datum, Erfasser nur als Ärztin oder Arzt."

// Anforderung 1: nur Arzneimittel
* category 1..1 MS
* category = #medication

// Anforderung 2: klinischer Status immer
* clinicalStatus 1..1 MS

// Anforderung 3: required, fehlende Codes nur über code.text
* code 1..1 MS
* code from $ch-allergy-vs (required)

// Anforderung 4: Pflicht, die Notfallstation soll sich darauf verlassen können
* criticality 1..1 MS

// Anforderung 5: nur Datum, einheitlich auswertbar
* onset[x] only dateTime
* onset[x] MS

// Anforderung 6: nur die Ärztin oder der Arzt selbst
* recorder 1..1 MS
* recorder only Reference(CHCorePractitioner)

// Anforderung 7: Reaktionen verarbeiten können, Symptome aus CH Term
* reaction MS
* reaction.manifestation MS
* reaction.manifestation from $ch-allergy-manifestation-vs (required)

* obeys dg-allergy-1
