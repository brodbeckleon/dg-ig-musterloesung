# DG Lab: Musterlösung Implementation Guide Arzneimittelallergie

Musterlösung zum Lab „Ein eigenes Implementation Guide mit FSH“ im Modul
Data Standards in Healthcare (ZHAW, HS26). Das Repository ist die ausgefüllte
Vorlage `dg-ig.zip`: Profil, Beispiel, Konfiguration und Startseite sind so
umgesetzt, wie es das Aufgabenblatt verlangt.

* IG: https://brodbeckleon.github.io/dg-ig-musterloesung/
* QA-Report: https://brodbeckleon.github.io/dg-ig-musterloesung/qa.html

## Use Case

Eine Hausarztpraxis erfasst Arzneimittelallergien so, dass eine Notfallstation
sie zuverlässig auswerten kann. Ressource `AllergyIntolerance`, Parent
CH Core AllergyIntolerance (CH Core 6.0.0, CH Term 3.3.0).

## Zwei Varianten

Die Anforderungen 3 bis 6 lassen bewusst mehrere Lösungen zu. Das IG enthält
deshalb zwei Profile:

| | Variante A (Musterlösung) | Variante B (streng) |
|---|---|---|
| Profil | `DgMedicationAllergy` | `DgMedicationAllergyStreng` |
| Datei | `input/fsh/profil.fsh` | `input/fsh/profil-variante-b.fsh` |
| 3 `code` | `extensible` | `required` |
| 4 `criticality` | `MS` | `1..1 MS` |
| 5 `onset[x]` | `dateTime or Age` | nur `dateTime` |
| 6 `recorder` | Practitioner oder PractitionerRole | `1..1`, nur Practitioner |
| 7 `reaction.manifestation` | `MS` | `MS`, `required` an CH Term |

Variante A entspricht dem, was Studierende abgeben: ein Profil mit dem Namen
`DgMedicationAllergy`. Variante B hat hier einen eigenen Namen, damit beide im
selben IG gebaut werden können. Bewertet wird nicht die Variante, sondern ob
die Regel zur Anforderung passt und begründet ist. Die vollständige Begründung
pro Anforderung, zur Binding-Stärke und zur Invariante steht auf der
Startseite des IG (`input/pagecontent/index.md`).

## Beispiele

| Instanz | Profil | Zweck |
|---|---|---|
| `PenicillinAllergieAnna` | A (gültig auch nach B) | Musterlösung Schritt 6: bestätigt, mit Reaktion |
| `BenzylpenicillinVerdachtAnna` | A | unbestätigt, Beginn als Alter, Erfasserin als PractitionerRole, keine Reaktion |
| `PenicillinAllergieAnnaStreng` | B | dieselbe Allergie wie oben, gegen Variante B |
| `TestBestaetigtOhneReaktion` | A | **auskommentiert.** Verletzt `dg-allergy-1`, zum Testen des QA-Reports |

Um zu zeigen, dass die Invariante greift: in `input/fsh/beispiele.fsh` die `//`
vor `TestBestaetigtOhneReaktion` entfernen und pushen. SUSHI meldet nichts, der
QA-Report zeigt einen Error zu `dg-allergy-1`. Danach wieder auskommentieren.

## Dateien

| Datei | Inhalt | Gegenüber der Vorlage |
|---|---|---|
| `sushi-config.yaml` | Name, URL, Abhängigkeiten | TODOs ausgefüllt |
| `input/fsh/aliases.fsh` | Kurznamen für CodeSystems und ValueSets | unverändert |
| `input/fsh/basis-beispiele.fsh` | Patientin, Ärztin, Praxis, PractitionerRole | unverändert |
| `input/fsh/invarianten.fsh` | Invariante `dg-allergy-1` | unverändert |
| `input/fsh/profil.fsh` | Profil Variante A | Musterlösung |
| `input/fsh/profil-variante-b.fsh` | Profil Variante B | neu |
| `input/fsh/beispiele.fsh` | Beispiele | Musterlösung plus Zusatzbeispiele |
| `input/pagecontent/index.md` | Startseite mit Designentscheidungen | Musterlösung, erweitert |
| `input/ignoreWarnings.txt` | begründete Warnungen | unverändert |
| `.github/workflows/build-ig.yml` | Build und Deploy | unverändert |

## Bauen

Lokal prüfen (nur SUSHI):

```bash
npm install -g fsh-sushi
sushi build .
```

Erwartet: `0 Errors  0 Warnings`, 2 Profile, 7 Instanzen.

Den vollen Build mit IG Publisher und QA-Report macht GitHub Actions bei jedem
Push auf `main` (`SUSHI → IG Publisher → GitHub Pages`). Einmalig unter
**Settings → Pages → Source: GitHub Actions** einstellen.

## Hilfe

* FSH-Spezifikation: https://hl7.org/fhir/uv/shorthand/
* SUSHI-Tutorial: https://fshschool.org/docs/sushi/tutorial/
* CH Core 6.0.0: https://fhir.ch/ig/ch-core/6.0.0/
* CH Term 3.3.0: https://fhir.ch/ig/ch-term/3.3.0/
