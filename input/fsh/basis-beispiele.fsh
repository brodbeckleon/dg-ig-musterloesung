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
// Basis-Beispiele: Patientin, Ärztin und Organisation
//
// Diese Datei ist fertig. Eure eigenen Beispiele können auf diese
// Instanzen verweisen, z. B.
//   * patient = Reference(AnnaMuster)
//   * recorder = Reference(DrSaraKeller)
// =====================================================================

Instance: AnnaMuster
InstanceOf: CHCorePatient
Usage: #example
Title: "Anna Muster"
Description: "Beispielpatientin nach CH Core Patient."
* name.family = "Muster"
* name.given = "Anna"
* gender = #female
* birthDate = "1985-04-12"
* address.line = "Bahnhofstrasse 12"
* address.city = "Winterthur"
* address.postalCode = "8400"
* address.country = "CH"

Instance: DrSaraKeller
InstanceOf: CHCorePractitioner
Usage: #example
Title: "Dr. med. Sara Keller"
Description: "Beispielärztin nach CH Core Practitioner."
* name.family = "Keller"
* name.given = "Sara"
* name.prefix = "Dr. med."

Instance: PraxisAmPark
InstanceOf: CHCoreOrganization
Usage: #example
Title: "Praxis am Park"
Description: "Beispiel-Hausarztpraxis nach CH Core Organization."
* name = "Praxis am Park"
* address.city = "Winterthur"
* address.postalCode = "8400"
* address.country = "CH"

Instance: DrSaraKellerPraxisAmPark
InstanceOf: CHCorePractitionerRole
Usage: #example
Title: "Dr. Sara Keller in der Praxis am Park"
Description: "Rolle der Ärztin in der Praxis nach CH Core PractitionerRole."
* practitioner = Reference(DrSaraKeller)
* organization = Reference(PraxisAmPark)
