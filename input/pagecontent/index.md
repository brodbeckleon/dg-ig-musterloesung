<!--
  Musterlösung Schritt 7: Startseite des IG.
  Die Abschnitte Use Case, Scope, Artefakte und Autor entsprechen dem,
  was im Lab verlangt ist. Die Abschnitte ab "Designentscheidungen"
  gehen darüber hinaus und entsprechen inhaltlich dem Report (Teil D).
-->

### Use Case

Eine Hausarztpraxis erfasst Arzneimittelallergien ihrer Patientinnen und Patienten.
Eine Notfallstation liest diese Angaben und muss sich darauf verlassen können, dass
sie maschinell auswertbar sind: Um welche Substanz es geht, ob die Allergie aktiv ist,
wie gefährlich sie ist und welche Reaktionen bekannt sind. Grundlage ist die Ressource
[AllergyIntolerance](https://hl7.org/fhir/R4/allergyintolerance.html), abgeleitet von
[CH Core AllergyIntolerance](https://fhir.ch/ig/ch-core/6.0.0/StructureDefinition-ch-core-allergyintolerance.html).

### Scope

Abgedeckt:

* Allergien gegen Arzneimittel (`category = #medication`)
* Codierung mit der Schweizer Allergieliste aus CH Term
* Beginn als Datum oder als ungefähres Alter
* Reaktionen mit ihren Symptomen

Bewusst nicht abgedeckt:

* Nahrungsmittel-, Umwelt- und andere Allergien
* Intoleranzen ohne Allergiebezug, Nebenwirkungen im Allgemeinen
* der Austausch selbst (Dokument, Nachricht oder API)

### Artefakte

| Artefakt | Wofür |
|---|---|
| [DG Arzneimittelallergie](StructureDefinition-dg-medication-allergy.html) | **Musterlösung (Variante A).** Das Profil, das im Lab verlangt ist. |
| [DG Arzneimittelallergie (Variante B, streng)](StructureDefinition-dg-medication-allergy-streng.html) | Strengere Lesart der offenen Anforderungen 3 bis 6, zum Vergleich. |
| [Bestätigte Penicillinallergie](AllergyIntolerance-PenicillinAllergieAnna.html) | **Musterlösung Schritt 6.** Gültig nach Variante A und B. |
| [Unbestätigter Verdacht auf Benzylpenicillinallergie](AllergyIntolerance-BenzylpenicillinVerdachtAnna.html) | Zeigt, was nur Variante A erlaubt: Beginn als Alter, Erfasserin in ihrer Rolle, keine Reaktion (unbestätigt). |
| [Bestätigte Penicillinallergie (Variante B)](AllergyIntolerance-PenicillinAllergieAnnaStreng.html) | Dasselbe Beispiel, validiert gegen Variante B. |
{:.grid}

Die vorgegebenen Basis-Beispiele (Anna Muster, Dr. med. Sara Keller, Praxis am Park und
die PractitionerRole dazu) stehen unter [Artefakte](artifacts.html).

### Designentscheidungen

Die Anforderungen 1, 2 und 7 sind eindeutig. Bei 3 bis 6 lässt die Fachperson bewusst
mehrere Lösungen zu. Die Tabelle zeigt Variante A, die als Musterlösung dient, und die
verworfene Alternative. Variante B setzt genau diese Alternativen um.

| Nr. | Element | Regel (Variante A) | Begründung | Alternative (Variante B) |
|---|---|---|---|---|
| 1 | `category` | `1..1 MS`<br/>`= #medication` | Das Profil gilt nur für Arzneimittel. Der fixe Wert schliesst andere Kategorien aus, `1..1` verhindert mehrere Kategorien. | gleich |
| 2 | `clinicalStatus` | `1..1 MS` | „Muss immer angegeben sein“ heisst Kardinalität. Die Notfallstation muss wissen, ob die Allergie aktiv ist. | gleich |
| 3 | `code` | `1..1 MS`<br/>`from $ch-allergy-vs (extensible)` | Codes aus der Schweizer Allergieliste, aber es soll auch etwas erfasst werden können, wenn kein Code passt. Genau das erlaubt `extensible`. | `(required)`, fehlender Code nur über `code.text` |
| 4 | `criticality` | `MS` | Die Notfallstation muss das Element verarbeiten können. In der Praxis ist die Kritikalität nicht immer bekannt, deshalb nicht Pflicht. | `1..1 MS`, die Notfallstation soll sich darauf verlassen können |
| 5 | `onset[x]` | `only dateTime or Age`<br/>`MS` | Datum als Normalfall, Alter für Patientinnen, die nur noch das ungefähre Alter wissen. Alle anderen Typen (Period, Range, string) sind ausgeschlossen. | `only dateTime`, einheitlich auswertbar, aber das Alter geht verloren |
| 6 | `recorder` | `MS`<br/>`only Reference(CHCorePractitioner or CHCorePractitionerRole)` | Patientin und Angehörige (in CH Core erlaubt) fallen weg. Die Ärztin darf allein oder in ihrer Rolle in der Praxis referenziert werden. | `1..1 MS`, `only Reference(CHCorePractitioner)` |
| 7 | `reaction`, `reaction.manifestation` | `MS` auf beiden | „Erfasst werden können, wenn bekannt“ heisst Must Support ohne Pflicht. Ob eine Reaktion nötig ist, regelt die Invariante. | zusätzlich `manifestation from $ch-allergy-manifestation-vs (required)` |
| – | Profil | `obeys dg-allergy-1` | Vorgegebene Invariante, siehe unten. | gleich |
{:.grid}

Bewertet wird im Lab nicht, welche Variante gewählt wurde, sondern ob die Regel zur
Anforderung passt und begründet ist. Auch Mischformen sind vertretbar, z. B. Variante A
mit `criticality 1..1 MS`.

#### Was CH Core schon festlegt

Ein Profil darf CH Core nur enger machen. Die Regeln oben tun das:

* `code` ist in CH Core `preferred` an dieselbe Allergieliste gebunden. `extensible` und
  `required` sind beide stärker und damit erlaubt.
* `reaction.manifestation` ist in CH Core `preferred` gebunden. Variante A lässt das so,
  Variante B verschärft auf `required`.
* `recorder` erlaubt in CH Core Practitioner, PractitionerRole, Patient und RelatedPerson.
  Beide Varianten schränken auf eine Teilmenge ein.

### Terminologie

Für `code` wählt Variante A **extensible**:

* **Nicht stärker (required):** Dann müsste jede Allergie mit einem Code aus der Liste
  erfasst werden. Anforderung 3 verlangt aber ausdrücklich, dass auch ohne passenden Code
  etwas erfasst werden kann. Mit `required` bleibt dafür nur `code.text`, was bei
  einem required Binding nicht sauber vorgesehen ist.
* **Nicht schwächer (preferred, example):** Das wäre nur eine Empfehlung bzw. sogar
  schwächer als CH Core. Die Notfallstation könnte sich nicht darauf verlassen, dass ein
  vorhandener passender Code aus der Liste stammt.
* **extensible** heisst: Wenn ein passender Code in der Liste steht, muss er verwendet
  werden. Nur wenn keiner passt, ist ein anderer Code oder Freitext erlaubt.

Die Codes im Beispiel (`91936005`, `294499007`, `126485001`) sind alle in den
ValueSets aus CH Term 3.3.0 enthalten.

### Invariante

```
Invariant: dg-allergy-1
Description: "Eine bestätigte Allergie muss mindestens eine Reaktion dokumentieren."
Severity: #error
Expression: "verificationStatus.coding.where(code = 'confirmed').exists() implies reaction.exists()"
```

**In eigenen Worten:** Wenn der Verifikationsstatus „confirmed“ ist, muss mindestens eine
Reaktion vorhanden sein. Bei jedem anderen Status (unconfirmed, refuted, ...) oder ohne
Status ist die Regel immer erfüllt, weil `implies` mit falscher Bedingung `true` ergibt.

**Warum nicht mit Kardinalität oder Binding:** Kardinalität gilt für ein Element
unabhängig vom Inhalt der übrigen Elemente. `reaction 1..*` würde auch für unbestätigte
Allergien eine Reaktion verlangen, `0..*` gar keine. Ein Binding schränkt nur ab, welche
Codes in einem Element stehen dürfen. Die Regel verknüpft aber zwei Elemente
(`verificationStatus` und `reaction`) mit einer Bedingung. Das geht nur mit einer
Invariante in FHIRPath.

Das Beispiel [BenzylpenicillinVerdachtAnna](AllergyIntolerance-BenzylpenicillinVerdachtAnna.html)
zeigt die andere Seite: unbestätigt, ohne Reaktion, trotzdem gültig.

SUSHI prüft Invarianten nicht. Ein Verstoss zeigt sich erst im QA-Report. In
`input/fsh/beispiele.fsh` steht dafür ein auskommentiertes, absichtlich ungültiges
Testbeispiel (bestätigt, ohne Reaktion).

### QA-Report

Die aktuellen Zahlen stehen im [QA-Report](qa.html). Für den Pflichtumfang des Labs zählt:
keine Errors. Warnungen werden entweder behoben oder in `input/ignoreWarnings.txt`
eingetragen und begründet.

### Abhängigkeiten

Dieses IG baut auf [CH Core 6.0.0](https://fhir.ch/ig/ch-core/6.0.0/) auf. Die ValueSets
für `code` und `reaction.manifestation` kommen aus
[CH Term 3.3.0](https://fhir.ch/ig/ch-term/3.3.0/).

### Autor

Léon Brodbeck, ZHAW

<p style="font-size:smaller">Musterlösung zum Lab des Moduls Data Standards in Healthcare, ZHAW, HS26. Kein offizieller Standard.</p>
