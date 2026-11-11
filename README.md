# DG Lab: Euer eigenes Implementation Guide

Vorlage für das Lab im Modul Data Standards in Healthcare (ZHAW, HS26).
Die vollständige Anleitung steht im Aufgabenblatt. Hier nur das Wichtigste.

## Was passiert bei einem Push?

```
input/fsh/*.fsh  ->  SUSHI  ->  IG Publisher  ->  GitHub Pages
```

Jeder Push auf `main` startet den Workflow unter **Actions**. Nach einigen
Minuten ist euer IG unter `https://<benutzername>.github.io/<repo-name>/`
online, der QA-Report unter `.../qa.html`.

## Einmalig einrichten

1. **Settings → Pages → Build and deployment → Source: GitHub Actions** wählen.
2. Unter **Actions** den fehlgeschlagenen ersten Lauf mit **Re-run all jobs**
   neu starten.
3. In `sushi-config.yaml` die Zeilen mit `TODO` anpassen.

## Lokal prüfen (schnell)

```bash
npm install -g fsh-sushi
sushi build .
```

SUSHI meldet Syntaxfehler und falsche Pfade in Sekunden. Den vollen Build mit
dem IG Publisher macht GitHub Actions für euch.

## Dateien

| Datei | Inhalt | Ändern? |
|---|---|---|
| `sushi-config.yaml` | Name, URL, Abhängigkeit CH Core | TODOs anpassen |
| `input/fsh/aliases.fsh` | Kurznamen für CodeSystems und ValueSets | nein |
| `input/fsh/basis-beispiele.fsh` | Patientin, Ärztin, Praxis | nein |
| `input/fsh/profil.fsh` | euer Profil (Kopfzeilen vorgegeben) | ja |
| `input/fsh/invarianten.fsh` | die vorgegebene Invariante | nein |
| `input/fsh/beispiele.fsh` | euer Beispiel | ja |
| `input/pagecontent/index.md` | Startseite des IG | ja |
| `input/ignoreWarnings.txt` | begründete Warnungen | falls nötig |
| `.github/workflows/build-ig.yml` | Build und Deploy | nein |

## Hilfe

* FSH-Spezifikation: https://hl7.org/fhir/uv/shorthand/
* SUSHI-Tutorial: https://fshschool.org/docs/sushi/tutorial/
* FSH Online (ohne Installation): https://fshonline.fshschool.org/
* CH Core 6.0.0: https://fhir.ch/ig/ch-core/6.0.0/
