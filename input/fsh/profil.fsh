/* ---------------------------------------------------------------------------
 * --  _____       _____ _______                                             -
 * -- |_   _|     |_   _|__   __|                                            -
 * --   | |  _ __   | |    | |       Institute of Computer Science           -
 * --   | | | '_ \  | |    | |       Zurich University of                    -
 * --  _| |_| | | |_| |_   | |       Applied Sciences                        -
 * -- |_____|_| |_|_____|  |_|       8401 Winterthur, Switzerland            -
 * ---------------------------------------------------------------------------
 */

// Musterlösung Variante A (eine von mehreren vertretbaren Lösungen)
// Alternativen stehen jeweils als Kommentar dabei.

Profile: DgMedicationAllergy
Parent: CHCoreAllergyIntolerance
Id: dg-medication-allergy
Title: "DG Arzneimittelallergie"
Description: "Arzneimittelallergie, wie sie in der Hausarztpraxis erfasst und auf der Notfallstation gelesen wird."

// Anforderung 1 (klar): nur Arzneimittel
* category 1..1 MS
* category = #medication

// Anforderung 2 (klar): klinischer Status immer
* clinicalStatus 1..1 MS

// Anforderung 3 (offen): extensible, weil auch ohne passenden Code erfasst werden soll.
// Alternative: (required) und code.text für Freitext, wenn man die Liste erzwingen will.
* code 1..1 MS
* code from $ch-allergy-vs (extensible)

// Anforderung 4 (offen): nur MS, weil die Kritikalität nicht immer bekannt ist.
// Alternative: 1..1 MS, wenn die Notfallstation sich darauf verlassen muss.
* criticality MS

// Anforderung 5 (offen): Datum oder Alter, weil manche Patientinnen nur das Alter wissen.
// Alternative: only dateTime für einheitliche Daten.
* onset[x] only dateTime or Age
* onset[x] MS

// Anforderung 6 (offen): Ärztin allein oder in ihrer Rolle in der Praxis.
// Alternative: only Reference(CHCorePractitioner).
* recorder MS
* recorder only Reference(CHCorePractitioner or CHCorePractitionerRole)

// Anforderung 7: Reaktionen verarbeiten können
* reaction MS
* reaction.manifestation MS

* obeys dg-allergy-1
