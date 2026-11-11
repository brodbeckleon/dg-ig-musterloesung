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
// Invariante (fertig vorgegeben)
//
// Diese Invariante ist fertig. Ihr müsst sie nicht ändern.
// Ihr wendet sie in profil.fsh mit "* obeys dg-allergy-1" an.
//
// SUSHI prüft Invarianten nicht. Ob euer Beispiel die Regel erfüllt,
// zeigt erst der QA-Report des IG Publishers.
// =====================================================================

Invariant: dg-allergy-1
Description: "Eine bestätigte Allergie muss mindestens eine Reaktion dokumentieren."
Severity: #error
Expression: "verificationStatus.coding.where(code = 'confirmed').exists() implies reaction.exists()"
