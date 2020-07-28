[TOC]

# Vorbemerkungen

## Über die XML-Edition »Fraktionen im Deutschen Bundestag 1949 bis 2005«

Im Rahmen ihres langfristigen Editionsprogramms »Fraktionen im Deutschen Bundestag 1949–2005« erschließt die »Kommission für Geschichte des Parlamentarismus und der politischen Parteien« (KGParl) mit der Volledition aller verfügbaren Protokolle der Bundestagsfraktionen und -gruppen einen einzigartigen Quellenbestand zur Geschichte der parlamentarischen Kultur und des Parlamentarismus in der Bundesrepublik Deutschland. 

Seit der Gründung des Bundestags 1949 sind fast durchgängig Protokolle, teilweise sogar Tonbandaufzeichnungen der Fraktions- und (Landes-)Gruppensitzungen überliefert, die eine erstklassige Quellenbasis zur deutschen Geschichte nach dem Zweiten Weltkrieg und zur Funktionsweise des politischen Systems der Bundesrepublik darstellen. Kein anderes Nationalparlament in Europa verfügt über eine vergleichbar umfassende und kontinuierliche Überlieferung zu diesen zentralen parlamentarischen Organisationseinheiten. Nach derzeitigen Schätzungen wird die Edition einmal über 10.000 protokollierte Sitzungen und damit weit über 100.000 Druckseiten umfassen.

## Über Konventionen in diesem Dokument

Dieses Dokument beschreibt die Codierungs- bzw. Auszeichnungsrichtlinien (encoding guidelindes), die speziell für die Edition Fraktionsprotokolle gemacht wurden. Diese Richtlinien sind kein Ersatz für die original TEI-Guidelines, die weiterhin gültig sind. Dieses Dokument beschränkt sich auf die Beschreibung derjenigen Elemente, die für die vorliegende Edition genutzt werden. Dazu wird erklärt, was diese Elemente im Kontext unserer Edition bedeuten, und es wird anhand von Beispielen beschrieben, wie und wo wir diese Elemente nutzen.

Hinweise zum Layout der vorliegenden Dokumentation: XML-Elemente werden folgendermaßen formatiert: 
```xml
<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<Satz>
    <wort1>Hallo</wort1> 
    <wort2>Welt!</wort2>
</Satz>
```
Die meisten XML-Elemente können sog. Attribute haben, die sie näher spezifizieren (zum Beispiel einen Hinweis  darauf geben, wie die Quelle optisch formatiert war). Attribute werden gemäß TEI-Konvention mit einem @ gekennzeichnet: @Attributname. Die Attributwerte sind teilweise von der TEI vorgegeben (dann in der Regel Englisch), manchmal aber auch passend zur vorliegenden Edition selbst gewählt (dann meist in Deutsch).

Beispiel für einen Element mit dem Attribut @rend für "rendering" (Darstellung)="bold" (fett) – es könnte beispielsweise genutzt werden, um anzuzeigen, dass der Personenname im Herkunftsdokument fett gedruckt war:

```XML
<persName rend="bold">Wehner</persName>
```

Zur Terminologie: Schachteln XML-Elemente weitere Elemente ein, so handelt es sich um die »Kindelemente«. Elemente, die gleichrangig von einem »Elternelement« umschlossen werden, sind »Geschwister«

```xml
<Elternelement>
	<Kindelement1>Hans</Kindelement1>
	<Kindelement2>Rita</Kindelement2>
</Elternelement>
```

Kommentare, die nicht als Element oder XML-Code gelesen werden:

```XML
<!-- Ich bin ein Kommentar -->
```



# Grundsätzliche Richtlinien für die Edition

**Für jedes Protokoll einer Fraktions- oder sonstigen Sitzung, das von uns ediert wurde oder wird, wird ein XML-Dokument im Format TEI erstellt. **

## Dateinamen
Der Name des Protokolls setzt sich wie bisher zusammen aus *Fraktion–Wahlperiode–Sitzungsdatum (ISO-Format: Jahr-Monat-Tag)*, bei einstelligen Ziffern mit führender 0 (Null, z. B. 1972-01-01). Unterstriche wie »_« oder andere Sonderzeichen wie Klammern sind im Dateinamen nicht erlaubt. 

**<u>Vorschlag:</u>** Gibt es mehrere Sitzungen pro Tag so wird ein -s1, -s2, -s3 usf. an den Dateinamen gehängt:

```
spd07-1972-03-22-s1. 
```

------

**Sonderfall zwei Dateien für die gleiche Sitzung*:** Bei den Dateien der SPD-Bundestagsfraktion für die **6. Wahlperiode** kann es vorkommen, dass die gleiche Sitzung als Kurz- und als Tonbandprotokoll in die Edition aufgenommen wurde. In diesem Fall handelt es sich nicht um zwei Sitzungen pro Tag, sondern um zwei unterschiedliche Protokolle derselben Sitzung. Der Dateiname wird daher um ein »-A« beziehungsweise »-B« ergänzt: spd07-1972-03-22-A oder spd07-1972-03-22-. Falls es mehrere Tonbandsitzungen pro Tag gab, wird analog zu oben der Dateiname zunächst um ein »-s1« und »-s2« ergänzt.

*Beispiele*: 

- Tonbandprotokoll der ersten Sitzung am 22. März: spd07-1972-03-22-s1-A.
- Kurzprotokoll derselben ersten Sitzung am 22. März: spd07-1972-03-22-s1-B.
- Protokoll der zweiten Sitzung, für die es nur eine Version gibt, an diesem Tag dann: spd07-1972-03-22-s2.

Groß- und Kleinschreibung sollte egal, <u>aber einheitlich</u> sein.

------

## Registerdateien
Für die Daten der Namens-, Orts- und Institutionenregister werden jeweils eigene XML-Dateien erstellt. (Der Inhalt der Dateien wird separat beschrieben):
- listPerson.xml → enthält alle in den Protokollen vorkommenden und ausgezeichneten Personen auch die Namen der MitarbeiterInnen der Edition, inkl. Kurzbiographien etc. (Im Minimalfall reicht Vor- und Nachname und XML:ID.)
- listOther.xml → enthält alle weiteren in den Protokollen vorkommenden und ausgezeichneten Referenzen: 
  - Zeitungen – `<orgName type="news">`
  - …

Jedes entsprechende Element in einem Protokoll verweist dann über dateiname#xml:id auf diese Registerdateien, die ihrerseits sofern vorhanden mit Normdaten angereichert sind, und enthält selbst keine Registerdaten. Struktur und Inhalt der Registerdateien wird im entsprechenden Abschnitt unten beschrieben. 

**Uncertain**

*Unklar ist noch, ob der Verweis in Form einer URI auf den relativen Dateipfad oder schlicht mit #xxxx erfolgen kann (und die URI dann bei der Auswertung/Umformung Richtung HTML dann entsprechend ergänzt würde).*

## XML:ID

Die XML-IDs werden vom Entwicklerteam festgelegt, dennoch wird an dieser Stelle erwähnt, dass eine ID nicht mit einer Zahl beginnen und keine Unterstriche enthalten darf. Außerdem ist die ID empfindlich für Groß- und Kleinschreibung: **MeineID ≠ MeineiD**.

Wird auf einen Eintrag in einer Registerdatei via xml:id verwiesen, so steht vor jeder ID die Raute "#". Die Raute signalisiert der späteren Verarbeitung, dass hier ein Hyperlink gesetzt werden soll.

Beispiel:

```XML
<persName key="#WehnerH">Herbert</persName>, du bist echt lustig.
```

`xml:id` in div-Elementen:  Eine XML-ID ist ein eindeutiger Identifikator eines Elements. Dieser Identifikator kann nicht mehrmals pro Datei vorkommen. Es kann aber natürlich mehrfach auf ihn verwiesen werden. Die XML:ID wird genutzt, a) um ein Element eindeutig identifizieren zu können (bspw. unterschiedliche Personen, die den gleichen Namen tragen) und um b) später Verweise zu erzeugen bzw. bei der HTML-Ausgabe URLs. 

(**uncertain:** Es können aber in unterschiedlichen Dateien derselbe Identifikator vorkommen; die Adressierung dieser Identifikatoren erfolgt dann in Kombination mit dem Dateinamen. Als in Dok. 1 "SVP-A" und in Dok. 2 auch "SVP-A". Will ich in Dok. 2 auf SVP A in Dok. 1 verweisen liefe das über ref target="Dok. 1#SVP-A". #Anmerkung SJ: Genau Syntax ist mir noch unklar.) 

`XML:ID` werden bei folgenden Elementen genutzt:  `div`, `persName`, `rs`, `orgName`, `settlement`, `placeName`, `note`.

## Sonderzeichen und Formatierungen

Grundsätzlich sind alle Zeichen aus dem Unicode-Zeichensatz erlaubt. Ausdrücklich verboten sind jedoch Zeichen, die innerhalb der XML-Syntax eine Funktion haben: `<> # "`. Bei der Eingabe von fremdsprachigen, Namen mit anderen als lat. Zeichen (z. B. Lê Đức Thọ) sollte es normalerweise keine Probleme geben, wenn diese um Unicode-Bereich liegen. Weiteres zu Namen etc. unter dem entsprechenden Element-Eintrag.

Ein Protokoll im TEI-XML soll überschüssige Leerzeichen ignorieren und ist nicht umbruchsensitiv! Das heißt, die Formatierung im oXygen-Editor repräsentiert also in keinem Fall ein späteres Aussehen. Die Formatierung der Protokolle wird erst im Ausgabeprozess (XML→HTML oder XML→PDF) festgelegt! Daher kann es sein, dass nicht jedes erfasste Element später auch optisch herausgehoben angezeigt wird.

In Ausnahmefällen (Sitzungsverlauf, Listen, bestimmte Sprecher) sind im XML bereits semantische Formatierungshinweise wie bold, italics etc. vorhanden. 

# Der `<teiHeader>` - Metadaten zu den Protokollen

Ein TEI-XML-Dokument besteht immer aus zwei Teilen: den Metadaten und dem edierten Text. Die Metadaten befinden sich im `<teiHeader-Teil>` einer Datei. Im `<text>`-Teil befindet sich der textuelle Inhalt des edierten Dokuments, sprich: das eigentliche edierte Protokoll mit allen seinen zusätzlichen Informationen wie SVP oder Listen.

Beschreibung des Metadatenteils: Im TEI-Header werden alle relevanten Metadaten zum elektronischen Dokument erfasst. Insbesondere fallen darunter: Name des Dokuments, Name der Edition, beteiligte Personen und Institutionen (Editoren, KGParl, ev. Kooperationspartner), Herkunft und Form des Originals (Parteiarchive), Art und Weise der Transkription, Urheberrechtsvermerke oder technische Verarbeitungsanweisungen für die spätere Anzeige. 

Der `<teiHeader>` ist vom Entwicklerteam in weiten Teilen bereits ausgefüllt worden und muss von den EditorInnen nur an den wenigen Stellen selbst ausgefüllt werden, die für jedes Protokoll unterschiedlich sind: Name des Dokuments, beteiligte Personen, Archivinformationen, Informationen über die Quelle. 

Der Header besteht in erster Linie aus der Beschreibung der vorliegenden Datei (Protokoll, Herkunft, EditorInnen, Herausgeberorganisation, Adresse, Name, Archive, Signaturen etc.) - `<fileDesc>` - und der Beschreibung, wie die vorliegende Datei bearbeitet, transkribiert, erfasst, gespeichert etc. wurde - `<encodingDesc>`.

Beispiel für einen minimalen`<teiHeader>`:

```xml
 <teiHeader>
      <fileDesc>
         <titleStmt>
            <title>Title</title>
         </titleStmt>
         <publicationStmt>
            <p>Publication Information</p>
         </publicationStmt>
         <sourceDesc>
            <p>Information about the source</p>
         </sourceDesc>
      </fileDesc>
  </teiHeader>
```



## `<fileDesc>`  - Beschreibung des digitalen Protokolls 

`<fileDesc>` enthält Metadaten über das elektronische Dokument (im Unterschied zu den Metadaten über die Quelle – diese werden an anderer Stelle untergebracht). Vergleichbar dem Dokumentenkopf der alten Edition. Die Dateibeschreibung ist untergliedert in:

### `<titleStmt>` - Informationen zur Benennung des Dokuments

Der Elementblock enthält alle Informationen zur Bezeichnung des vorliegenden Protokolls und nennt die BearbeiterInnen wie ihre Rollen im Editionsprozess. 

Anmerkung: Irgendwie müssen das **Sitzungsdatum**, die **Organisationseinheit**, die für das Protokoll verantwortlich ist und das Sitzungsdatum in den Header bzw. ins titleStmt codiert werden. Dies dient später der Zuordnung zu bestimmten Facetten, die man an- oder abwählen kann (vgl. die aktuelle Edition unter fraktionsprotkolle.de).

#### Titel der Edition und des Protokolls

Der Haupttitel `<title type="main">`  besteht aus dem Namen unserer Internet-Edition, siehe Beispiel:

```xml
<title type="main">Digitale Edition der Protokolle der Fraktionen im Deutschen Bundestag
               1949–2005</title>
```

 Der Untertitel `<title type="sub">` enthält den Namen des vorliegenden Protokolls. Es kann bereits die Zugehörigkeit zu einer Fraktion oder Landesgruppe sowie Datum und Nummer der Wahlperiode im Element enthalten. Beispiel:

```XML
<title type="sub" when-iso="1976-12-13" key="#CSU-LG" n="6">Sitzung der CSU-Landesgruppe am 13. Dezember 1976</title>
```

Andere Möglichkeit, unterhalb des Sub-Titels ein Author-Element mit entsprechendem Attribut, um es von anderen Autoren bzw. den dann folgenden Editorinnen und Editoren zu unterscheiden.

```XML
<author role="Fraktion" key="#CSU-LG" n="7">CSU-Landesgruppe</author>
```

#### An der Edition beteiligte MitarbeiterInnen

Verantwortliche Editorinnen und Editoren sowie sonstige Mitarbeiterinnen und Mitarbeiter an der Edition des Protokolls werden wie folgt ausgezeichnet:

`<editor role="xxxx" key="#ID">` Namen der verantwortlichen EditorInnen des vorliegenden Dokuments.  Es kann durchaus mehrere EditorInnen geben. Das Attribut `@key` verweist auf den Eintrag im Namensregister listNames.xml. 

```XML
<editor  key="#HindenburgB">
	<forename>Barbabra</forename> 
	<surname>Hindenburg</surname>
	<roleName>von</roleName>
	<email>hindenburg@kgparl.de</email>
</editor>
```

Für weitere Beteiligte an der Edition des Dokuments wird das "responsability statement" `<respStmt>` mit `<resp>` `<name>` genutzt. Hier kann weitgehend frei beschrieben werden kann, wer noch beteiligt war. Die @key-Attribute verweisen wiederum auf listNames.xml.

```xml
<respStmt>	
	<resp>Texterfassung und das OCR wurden unterstützt von</resp>
	<name key="#StalmannB">Benita Stalmann</name>
	<name key="#RabusS">Simon Rabus</name>
    <resp>Für die digitale Infrastruktur ist zuständig:</resp>
    <name key="GatesB"> Bill Gates</name>
    <resp>Die ursprügnliche PDF-Edition geht zurück auf eine Idee von</resp>
    <name key="HölscherW">Wolfgang Hölscher</name>
</respStmt

```

*Weitere Informationen und Beispiele zum Titel folgen.*

### `<editionStmt>` - Informationen zur Edition

Das Element enthält alle Informationen über die Version oder die Auflage oder das Veröffentlichungsdatum des vorliegenden Dokuments. 

*[Genaue Parameter werden noch spezifiziert. Da kann rein die Version und das Datum des Protokolls. Oder aber auch dynamisch das Download-Datum, bspw. wie es die Weber-GA macht. ]*

Dieses Element füllen die BearbeiterInnen in Absprache mit der Projektleitung aus.

Die Informationen werden ohne Formatierung etc. in einfache Absatz-Elemente geschrieben.

Beispiel:

```xml
<editionStmt>
     <p>Version 1.0 der Digitalen Edition fraktionsprotokolle.de</p>
     <p>Veröffentlicht am 20. Januar 2019</p>
</editionStmt>
```

*Möglicherweise wird dieser Abschnitt durch einen formalisierten und maschinenlesbaren Abschnitt ersetzt.*

### `<publicationStmt>` - Angaben zu Veröffentlichung und Vertrieb des elektronischen Textes

**uncertain**

Das Element ist bereits ausgefüllt und muss bis auf wenige Elemente nicht mehr bearbeitet werden!

Es enthält Informationen:

-  zum Herausgeber `<publisher>` (in weiteren Elementen Name und Adresse spezifiziert)
- zur ISBN `<idno>`
- zur Lizenz und den Regeln zur Nutzung `<availability>`
- zum Veröffentlichungsdatum `<date>`

Beispiel:

```xml
<publicationStmt>
      <publisher>
          <orgName key="#KGParl">Kommission für Geschichte des Parlamentarismus 					und der politischen Parteien e. V. (KGParl)</orgName>
           <address>
              <street>Schiffbauerdamm 40</street>
              <postCode>10117</postCode>
               <placeName>
           	      <country>Deutschland</country>
                  <settlement type="town">Berlin</settlement>
               </placeName>
             </address>
        </publisher>
        <idno type="isbn">0-00-0000000</idno>
         <availability>
            <licence target="https://www.fraktionsprotokolle.de/nutzung">Alle 					Rechte vorbehalten!</licence>
          </availability>
        <date when-iso="2020-02-18">18. Februar 2020</date>
 </publicationStmt>
```

### `<seriesStmt>` -  Generelle Angaben zur Publikationsreihe fraktionsprotokolle.de

**uncertain**

Dieser Abschnitt ist bereits vorausgefüllt und muss in der Regel von den EditorInnen nicht mehr bearbeitet werden. Er enthält derzeit einer generische Aussage zu Art und Charakter der digitalen Edition.

Beispiel:

```xml
<seriesStmt>
   <p>Maschinenlesbare Transkriptionen von Protokollen und Audiomitschnitten der 	      Fraktionen und Gruppen des Deutschen Bundestags von 1949 bis 2005</p>
   <p>Machine-Readable Transcriptions of Protocols and Audio Recordings of the German    Bundestags Parliamentary Groups from 1949 to 2005</p>
</seriesStmt>   
```

### `<sourceDesc>` - Beschreibung der Quelle/Archvalie/des Originalprotokolls

In diesem Teil werden **Charakter und Herkunft der Quelle**, die dem elektronischen Dokument zugrunde liegt. Dies müssen die BearbeiterInnen weitgehend selbst ausfüllen.

Das wichtigste Element unter `<sourceDesc>` ist `<msDesc>`. Dieses Element wurde ursprünglich zur **Beschreibung eines (handschriftlichen) Manuskripts** genutzt. Wir nutzen es, um die Vorlage bzw. die Quelle zu beschreiben (also entweder die schriftliche Vorlage aus dem Archiv oder die Audiodatei).

 `<msIdentifier>` : Informationen zum Archiv und zur Archivstück. Wichtigstes Element ist hier sicherlich `<idno type="shelf">`, das die Signatur der Quelle codiert. das Attribut und sein Inhalt "shelf" sorgen dabei in erster Linie für Unterscheidbarkeit, da es noch andere Typen an idno gibt (ISSN, ISBN, GND, URL usf.).

 `<physDesc>`: Beschreibung der Vorlage (Papier, Tonband, Umfang etc.). **uncertain**

`<additional>`: Kann genutzt werden, um bei unkommentierten Protokollen (Rück-)Bezüge zu anderen Protokollen herzustellen. Bspw. wenn im Protokoll eine ältere Sitzung erwähnt wird oder auf eine zukünftige Sitzung verwiesen wird. So könnte ein Beziehungsgeflecht/linked-data zwischen den Protokollen hergestellt werden. In kommentierten Protokollen wären solche Bezüge ja in den kommentierenden Anmerkungen nachgewiesen (dies müsste für die Anzeige entsprechend berücksichtigt werden.) 

Das bedeutet aber auch, dass diese Informationen beim ersten Korrekturlesen während der Texterfassung notiert werden müssen. Bspw. wenn der Fraktionsvorsitzende erklärt, er habe in der letzten Sitzung ja xy erzählt usf. **uncertain**

Beispiel:

```XML
<sourceDesc>
	<msDesc>
		<msIdentifier>
        	<country>Deutschland</country>
            <settlement ref="http://d-nb.info/gnd/4069594-3">Bonn-Bad 		       
            Godesberg</settlement>
            <repository key="#AdsD">Archiv der sozialen Demokratie (AdsD)</repository>
            <idno type="shelf">SPD-BT-Fraktion 6. WP, 01</idno>
            <msName>Protokoll der Fraktionssitzung vom 20. Oktober 1969</msName>
                  <!-- Name aus dem Findbuch -->
         </msIdentifier>
         <physDesc>
            <objectDesc form="Protokoll">
                 <supportDesc>
                     <support>Maschinenschriftliches Typoskript (Papier) Art der 						 Quelle</support>
                     <extent>10 Seiten/Umfang</extent>
                 </supportDesc>
            </objectDesc>
            <handDesc>
                <p>Protokollant und Datum der Niederschrift <date
                 when-iso="1969-10-23">23. Oktober 1969</date></p>
            </handDesc>
         </physDesc>
         <additional>
             <listBibl>
             <!-- Liste aller Sitzungen, auf die in der vorliegenden Sitzung bezug                   genommen wurde. Von den Erfassenden bei der ersten Durchsicht zu                       erstellen. -->
                 <bibl>
                     <title ref="#spd07-1972-10-12">SPD-Fraktionssitzung am 12. 							 Oktober 1972</title>
                      <title ref="#AndereID">Eine andere Sitzung</title>
                 </bibl>
             </listBibl>
         </additional>
    </msDesc>
</sourceDesc>
```

## `<encodingDesc>` - Informationen zur Normalisierung der edierten Protokolle

**uncertain**

Alle generellen Informationen über die Bearbeitung der Quelle durch die EditorInnen liegen unterhalb des Elements `<encodingDesc>` .

`<correction>` erfasst **generelle Informationen**, in einfachem Text, über die den Umfang der korrigierenden Eingriffe. Man kann das auch maschinenlesbarer über über Attribute wie  @status und Werte, beispielsweise „medium“, machen.

`<normalization>` beschreibt die Normalisierung des Textes. Wie wird mit unterschiedlichen Schreibweisen, Namen usf. umgegangen wird. In unserem Fall: In der Regel stillschweigend. Daher erhält das Attribut @method den Wert „silent“.

`<listPrefixDef>` Definition von Präfixen, die die Referenz auf externe Dokumente vereinfachen. Beispiel, der String „PERS“ wird zum Verweis auf die Datei ../listPerson.xml erweitert.

Beispiel:

```
nachtragen
```

## `<revisionDesc>` - Revisionshistorie der vorliegenden Datei

Das Element `<revisionDesc>` fasst die gesamte Revisionshistorie des edierten Protokolls zusammen. Jede (substantielle) Veränderung wird von den bearbeitenden Personen in einem `<change>`-Element festgehalten werden. 

*[Wie das genau aussehen wird und welche Schritte festgehalten werden, muss noch geklärt werden. Sinnvollerweise werden aber nur substantielle Veränderungen am Text oder in der Auszeichnungstiefe ausgewiesen. Bspw. wenn am Dokumententext Fehler (FPD – FDP) behoben werden oder wenn etwas ausgezeichnet wurde, was vorher nicht ausgezeichnet war.]*

Das `<change>`-Element hat die Attribute `@when-iso` für das Datum der Änderung und `@who` für die Identifikation der verändernden Person. (Die ID der Person sollte via xml:id auf listPersons.xml erfolgen.) 

Beispiel:

```xml
<change when-iso="2020-03-04" who="#sjuengerkes">Einfügung des Abschnitts 3.3. in der vorliegenden Dokumentation.</change>
```



# Der `<text>`-Teil des Dokuments

In diesem Teil des TEI-Dokuments befindet sich der transkribierte und edierte Text des Protokolls:

- (eventuell erneut der Titel des Dokuments.)
- Edierte Tagesordnung (**uncertain**)
- Anwesenheits- oder Gästelisten
- Informationen zu Sprechern, Protokollform, Vorsitz der Sitzung etc., sofern es **ein integraler Teil** des zu edierenden Dokumententextes ist (und nicht in die Metadaten des teiHeaders gehört)
- Protokolltext mit den textkritischen und kommentierenden Anmerkungen

Das `<text>`-Element kann in zwei (oder drei) Bereich unterteilt werden:

- `<front>`: "front matter" – Entsprich in etwa dem bisherigen Dokumentenkopf inkl. Anwesenheitslisten und Sitzungsverlaufspunkten.
- `<body>`: Text des Protokolls. 
- `<back>` "back matter", Nachsatz. (Wird in unserer Edition derzeit nicht genutzt.)

Beispiel:

```XML
<text>
	<front>
		<p>Anwesenheitslisten etc.</p>
	</front>
     <body>
        <p>Protokolltext</p>
      </body>
      <back>
      	<p>Ungenutzt</p>
      </back>
</text>
```



## `<front>` – Vorspann vor Protokoll (SVP & Anwesenheitslisten)

Das  `<front>`- Element enthält folgende Teile des Protokolls:

- Teilnehmer- oder Anwesenheitslisten, sofern es die Edition erfordert oder diese  im Protokolltext vorhanden sind (Beispiel: CSU-Landesgruppe). Im Allgemeinen werden aber **keine** Anwesenheitslisten ediert. 
- Sitzungsverlaufspunkte, die entweder von den EditorInnen eigens erstellt werden (Beispiel: CDU/CSU-Fraktion) oder sich an den überlieferten Tagesordnungen anlehnen (Beispiel: SPD-Fraktion). Der Sitzungsverlauf wird wie bisher mit Buchstaben A, B, C und so weiter gegliedert. 

### Teilnehmerliste

Die Anwesenheitsliste besteht aus einer ungegliederten und flachen Liste.

`<div type="Anwesenheitsliste">` klammert die Liste ein und sorgt dafür, dass die Liste später im HTML oder PDF entsprechend formatiert werden kann.

`<head style="bold">Anwesend:</head>` Überschrift der Liste (ob da nun "Anwesend" oder "Anwesenheitsliste" steht hängt natürlich vom Protokoll ab.)

`<list rend="simple">` definiert eine simple Listenumgebung. (Wie diese später im HTML oder Druck aussieht, ist damit nicht festgelegt.) `<item>` klammert schließlich die Personennamen ein, wobei jedes Personennamen-Element als zwingendes Attribut einen Verweis auf die Personendatenbank via key haben muss. 

```xml
<div type="Anwesenheitsliste">
         <head style="bold">Anwesend:</head>
         <list rend="simple">
            <item><persName key="#XXX">Althammer</persName></item>
            <item><persName key="#XXX">Becher</persName></item>
            <item><persName key="#XXX">Biehle</persName></item>
            <item><persName key="#XXX">Bötsch</persName></item>
            <item><persName key="#XXX">Dollinger</persName></item>
         </list>
      </div>
```



### Sitzungsverlauf -Übersicht

Die Abbildung des Sitzungsverlaufs orientiert sich an den bisherigen Editionen – bei allen Editionen, die bereits im Druck oder als PDF existieren wird der Sitzungsverlauf entsprechend übernommen. Für alle kommenden digitalen Editionen/Protokolle sollte er weniger "grob" gegliedert sein. Die Gliederungseinheiten sollten kleiner sein, damit die späteren Sprungmarken/URL/Links weniger auf kürzere Sinneinheiten verweisen (es ist sehr nutzerunfreundlich, wenn zwischen einzelnen Gliederungspunkten zehntausende von Wörtern oder ein halbes Dutzend Tagesordnungspunkte liegen).

Analog zur Anwesenheitsliste wird die SVP-Liste mit fast den gleichen Elementen gestaltet. Siehe Beispiel. Einzige Ausnahme: Die BearbeiterInnen vergeben xml:id im Stil von SVP-A, SVP-B usf. Die damit versehene Elemente haben mehrere Funktionen: 

- Bei der Darstellung des Protokoll dienen sie dazu daraus die SVP-Gliederungen zu erzeugen ("A:", "B:" usf.)
- Technisch werden das die Anker sein, auf die später aus anderen Protokollen verwiesen werden kann (das heißt wir verweisen, wenn wir "Vgl. Sitzung vom 01. Januar 1975, SVP A" nicht direkt auf auf die Protokolltext, sondern auf den Sitzungsverlauf; das hat technische Gründe, weil wir im Print nicht alle Protokolle abdrucken, jedoch alle SVP-Übersichten, so laufen Verweise dort nicht ins Leere).
- Technisch dienen die ID im Protokoll auch dazu aus den SVP-Übersichten Hyperlinks zu erzeugen, mit denen in den Protokolltext gesprungen werden kann.

```XML
<front>
     <div type="SVP">
        <head style="bold">Sitzungsverlauf:</head>
        <list rend="simple">
           <item xml:id="SVP-A">TOP 1: Informationen.</item>
           <item xml:id="SVP-B">TOP 2: Fragen.</item>
           <item xml:id="SVP-B">Gesetze und Initiativen: TOP 4: Gesetz zum Lastenausgleich. - TOP 5: Antrag der Opposition zum Lastenausgleich. -- TOP 6: usf. usf. </item>
           <item xml:id="SVP-C">Vermischtes usf.</item>
        </list>
     </div>
   </front>
```

## `<body>`– Protokolltext

Im Body-Abschnitt befindet sich der gesamte Protokolltext nebst Anmerkungen (vergleichbar dem als epf-Grundtext formatierte Haupttext in den alten Protokollen).

Jeder Absatz steht in einem eigenen `<p>`-Element ("paragraph", dieses Element ist also die kleinste Texteinheit in den Protokollen. Beispiel:

```xml
<p>Ich bin ein Absatz.</p>
<p>Und ich bin ein viel längerer Absatz!</p>
```

### Elemente, um den Haupttext zu edieren

#### `<div>` – Größer Abschnitte (mehrere Absätze, zB ein Sitzungsverlaufs-Punkt im Protokoll)

Dieses Element markiert einzelne Abschnitte oder Kapitel, die zu jeweils einem Sitzungsverlaufspunkt gehören. Zu jedem `<div>` gehört mindestens das Attribut `xml:id`.

Beispiele:

```XML
<div key="#SVP-A">
	<p>Hier ist der Text zu SVP A. Viel Gerede und so fort.</p>
    <p>Hier noch mehr Text in einem neuen Absatz.</p>
</div>
<div type="Haupt-SVP" xml:id="SVP-B"> ... </div>
```

------

#### `<p>` – Absätze

Jeder (!) eigene Absatz muss in ein `<p>`-Element (paragraph) gepackt werden. 

```xml
<p>Ich bin ein gewöhnlicher Absatz!</p>
```



------

#### `<persName>` – Personen

Dient der eindeutigen **Identifizierung von Personen**, die in einer externen Datei geführt werden. Das Element enthält zwei Attribute `@key` und gegebenenfalls `@role`. 

Das Key-Attribut dient der eindeutigen Identifizierung der Person über die externe Personendatei. Es muss **immer** gesetzt sein. Die gewünschte ID ist jeweils der externen Personendatei listPerson.xml zu entnehmen. Personen, die nicht in der listPerson.xml-Datei geführt werden, sind dem Digitalteam zu nennen. Dieses setzt dann die entsprechende ID fest.

Das Attribut `@role` besitzt zwei mögliche Werte:

- "speaker" →  `<persName key="#ID" role "speaker">` → Personen, die an der Sitzung teilnehmen und sprechen. Auch bei den Sprechern der SPD-Transkriptionen
- "interjection" →  `<persName key="#ID" role "interjection">` → Personen, die bei SPD-Tonbändern dazwischen rufen.

Beispiele:

```XML
<div xml:id="SVP-A">
	<p><persName key="#WehnerH" role="speaker">Wehner</persName>: Genosse 		           <persName key="#BrandtW">Brandt</persName> betritt gerade den Raum, willkommen. Genosse <persName key="#SchmidtHH">Schmidt</persName> ist heute nicht da, das ist schade.</p>
    <p></p>
</div>
```

------

#### `<rs>` – Allgemeine Benennung oder auf etwas (Person, Amt) verweisende Zeichenkette

Dient der eindeutigen Identifizierung von Personen, die nur mit einer Amts- oder Funktionsbezeichnung ("der Bundeskanzler", "der Fraktionsvorsitzende", "unser Chef") in den Protokollen geführt werden- Die Verwendung bei Personen erfolgt analog zur Verwendung von `<persName>`. Das Attribut type="person" legt für die spätere Auswertung fest, dass es sich hier um eine dezidierte Person handelt, also, wie im Beispiel, und nicht das Amt etc. gemeint ist.

Personen, die nicht in der listPerson.xml-Datei geführt werden, sind dem Digitalteam zu nennen. Dieses setzt dann die entsprechende ID fest.

```XML
<p>Wir werden dazu den <rs key="SchmidtHH" type="person">Bundeskanzler</rs> hören. </p>
<p><rs key="SchmidtL" type="person">Seine Frau</rs> kommt auch mit in's <rs key="Kanzleramt" type="place">Amt</rs>.</p>
```

Das Attribut type="person" legt für die spätere Auswertung fest, dass es sich hier um eine dezidierte Person handelt, also, wie im Beispiel, und nicht das Amt etc. gemeint ist.

`<rs>` kann auch genutzt werden, um andere Anaphern 

------

#### `<orgName>` – Organisationen

***Muss noch entschieden werden, was wir auszeichnen wollen!***

```
Dient der eindeutigen Identifizierung von Organisationen, Unternehmen, Zeitungen, Verlagen, Institutionen, Gewerkschaften etc. über eine externe Organisationsdatei listOrg.xml.

Das Element hat nur zwei Attribute: `xml:id`, um die Eindeutigkeit herzustellen. (Die ID muss in der externen Datei gesucht werden.) `type`, um zu differenzieren, um welche Organisationen es sich handelt:

- "news" für Zeitungen, Zeitschriften etc.
- "pol" für alle politischen, gewerkschaftlichen Einrichtungen, Organisationen
- "com" für alle Unternehmen, Firmen, wirtschaftlichen Organisationen
- "soc" für Kirchen, zivilgesellschaftliche Einrichtungen                                 
```



```xml
<p>Der <orgName type="pol" key="#DGB">Gewerkschaftsdachverband</orgName> will das nicht.</p>
```



#### `<seg>` – Kennzeichnung von Segmenten in Texten, auf die sich Anmerkungen beziehen

Das `<seg>`-Element legt nur fest, auf welche Wörter sich eine kommentierende oder kritische Anmerkung bezieht. Es hat in diesem Fall immer ein Attribut mit dem Wert "note". Die Anmerkung wird anschließend direkt hinter diese Wörter gesetzt.

```xml
<p>Ich kann es erklären, <seg type="note">heute ist Schützenfest<note type="comment" xml:id="FN001">Gemeint ist das Schützenfest der Schützenbruderschaft St. Kunibert in Büderich 1976.</note></seg></p>
```

Das Attribut wurde aufgenommen, falls `<seg>` noch in anderen Fällen zur Anwendung kommt. Bei der Darstellung für den Druck wird es keine Rolle spielen, sondern das Element `<note>` wird ein Fußnotenzeichen hinter dem letzten Buchstaben oder Satzzeichen erzeugen – wie bisher schon in Word.

#### `<note>` – Anmerkungen/"Fußnoten"

Fußnoten bzw. Anmerkungen jeder Art, die von den Bearbeitenden gemacht werden und die einen kommentierenden oder textkritischen Inhalt haben. Im `<note>`-Element  können sich dann weitere Elemente befinden, die den Inhalt der Anmerkung präziser erfassen. 

Die `<note>`-Elemente haben mehrere Attribute:

1. @xml:id in der Form xml:id="Fn1", "Fn2" usf., um später (im selben wie auch in anderen Dokumenten) auf die Fußnote referenzieren zu können.
2. @n in der Form n="1", "2" usf. als Zähler, um der Fußnote später (in der HTML-Darstellung etc.) eine Nummer geben zu können. 
3. @role mit zwei Werten, "critical" und "comment":
   - "critical" für eine textkritische Anmerkung (zum Beispiel Auflösung einer Anmerkung oder Hinweis zur Korrektur des Textes)
   - "comment" für eine inhaltliche und kommentierende Anmerkung (zum Beispiel Nachweis von Bezugsdokumenten, Literatur Erläuterungen usf.).

Beispiel:

```XML
<p>Wir können<note xml:id="Fn1" n="1" type="critical">Vom Bearbeiter ersetzt. Im Original »könnt«.</note> froh sein.</p>

<p>Der Ostblock ist uns nicht wohlgesonnen.<note xml:id="Fn2" n="2" type="comment">Brandts widerspricht sich hier, da er sich zuvor ausschließlich auf die UdSSR bezog und Polen explizit ausnahm. Vgl. Blabla.</note></p>
```

**uncertain:**

Um genau zu klären, worauf sich die Anmerkung bezieht, gibt es zwei Möglichkeiten:

1. Wie bisher bezieht sich die Anmerkung entweder direkt auf das Wort, das vor den "Anmerkungszeichen" (in diesem Fall das öffnenden `<note>`-Element), oder auf den Satz/Absatz, an dessen Ende das `<note>`-Element steht. Dies ist Vergleichbar der bisherigen Handhabung mit Fußnotenzeichen.
2. XML-Variante: Der Textteil, auf den sich eine Anmerkung bezieht, wird zuvor durch `<seg>`-Elemente definiert. Das `<seg>`-Element erhält dabei, wie die Fußnote, ein Attribut, @role, dass beschreibt, ob es sich um eine textkritische oder kommentierende Fußnote handelt, also "note-critical" oder "note-comment". So kann später bei der Darstellung zB in HTML das Textstück, auf das sich die Anmerkung bezieht, optisch etc. herausgehoben oder anders als der restliche Text dargestellt werden. (*#Anm. SJ: In diesem Fall, vermute ich, kann man das entsprechende critical- oder comment-Attribut im note-Element auch weglassen, oder?*)</u>

Beispiel zu 2:

```XML
<p>Wir <seg role="note-critical">können<note xml:id="Fn1" n="1" type="critical">Vom Bearbeiter ersetzt. Im Original »könnt«.</note> froh sein.</p>

<p> <seg role="note-comment">Der Ostblock ist uns nicht wohlgesonnen.<note xml:id="Fn2" n="2" type="comment">Brandts widerspricht sich hier, da er sich zuvor ausschließlich auf die UdSSR bezog und Polen explizit ausnahm. Vgl. Blabla.</note></seg>
    </p>
```



#### `<ref>` – Verweise innerhalb und außerhalb des Protokolls

*Verweise auf SVP und Anmerkungen im gleichen wie in anderen Protokollen*: Das Element ref bekomt ein Attribut `@target` in dem der Verweis auf die anderen anderen Stellen steht. Die Verweise werden über `xml:id` realisiert und später zu URI/URL umgewandelt.

Beispiel: Verweis im selben Dokument.

```XML
<note xml:id="FN001">Dies ist eine Anmerkung</note>

Zur Erklärung des Sachverhalts, vgl. die entsprechende <ref target="#FN001">Anmerkung oben</ref>
```

Der Inhalt im `<ref>`-Element würde bspw. im HTML oder PDF als Link dargestellt. 

**uncertain:** *Für den Druck ist diese Lösung ungeeignet. Entweder müssen Setzer und Autoren hier manuell eingreifen oder die Gestaltung des Elements muss verändert werden/mit Alternativen bzw. Druckanweisungen versehen werden. Letzteres würde die Komplexität des Codes allerdings erhöhen.*

Beispiel: Verweis auf ein Element in einem anderen Dokument (vorzugsweise auf SVP/TOP, bitte nur sehr sparsam auf Anmerkungen verweisen.)

```xml
Die CDU/CSU-Fraktion besprach den Sachverhalt in ihrer <ref target="07cducsu-1973-05-12-s1#SVP-A">ersten Sitzung am 12. Mai 1973, SVP A</ref>
```

*Verweise auf externe Quellen:*

- BT Plenarprotokolle: VGl. BT Plenarprotokolle `<ref target="BT-Plenar">`08/1`</ref>`. Die 08/1 können so Richtung einer URI aufgelöst werden
- BT Drucksachen:  `<ref target="BT-Druck">`
- BR Plenarprotokoll:
- BR Drucksache:
- Kabinettsprotokolle Bundesregierung:
- Bundesgesetzblatt:
- 

#### `<abbr>` – Abkürzungen

Umgang mit Abkürzungen: Das Element `<choice>` markiert, dass an dieser Stelle eine Wahl vom Editor getroffen wurde. Nämlich zwischen der originalen Abkürzung `<abbr type="original">` und deren Erweiterung `<expan>`. Das Attribut `@type="original"` beim Element `<abbr>` ist streng genommen nicht notwendig, markiert aber an dieser Stelle nochmals, dass die Abkürzung im Original vorhanden war.

Diese drei Elemente also können genutzt werden, um ungewöhnliche Abkürzungen bereits bei der Erfassung oder Kommentierung aufzulösen.

Beispiel:

```xml
<choice><expan>Multi-Role Combat Aircraft</expan><abbr type="original">MBFR</abbr></choice>
```

#### `<bibl>` – Bibliographien

Größere bibliographische Hinweise in Anmerkungen oder anderswo müssen so formatiert werden, dass Autor, Titel, Ort usf. technisch erkennbar sind. 

Werden die bibliographischen Angaben erstmals gemacht, so erhält das umschließende `<bibl>`-Element eine xml:id als Attribut, auf die sich später alle Kurztitel (`<title type="short" key="#ID"`>).

```xml
<note>Vgl. dazu <bibl xm:id="StalGross">
    <author>Stalmann, Volker</author>: <title>Die große Geschichte des großen Vorsitzenden Strauß</title>, <pubplace>Berlin</pubplace> <date iso-when="2020">2020</date>.</bibl>
</note>
```

Handelt es sich um Herausgeber statt Autor: `<editor>`. 

Der Titel des (Zeitschriften-)Aufsatzes etc. wird dann im Element `<title level="a">`untergebracht ;"a" steht für "analytic" (oder "Artikel/Aufsatz"). 

Der Name der Zeitschrift steht dann unter `<title level="j">`; "j" für "Journal". 

Bei anderen Formen, Sammelband bspw. `<title level="m">`; "m" für "monograpic".

Beispiel für eine Monographie (#Ank. SJ: *Ich würde Titel und Untertitel nicht separat behandeln und auch keine Reihentitel direkt in den Editionsprotokollen aufnehmen; ob wir daneben noch separat eine Bibliographie führen, wie einmal von Hölscher vorgeschlagen, müssen wir entscheiden; ev. wäre es ja möglich, die xml:id bereits als URI zu führen und direkt auf OPAC der DNB etc. zu verlinken*):

```XML
<note>Vgl. dazu <bibl xml:id="ID">
    <author>Stalmann, Volker</author>: <title>Die große Geschichte des großen Vorsitzenden Strauß</title>, <pubplace>Berlin</pubplace> <date when-iso
</note>
```

Beispiel für einen Zeitschriftenaufsatz:

```xml
<note>Vgl. dazu <bibl xml:id="ID">
    <author>Stalmann, Volker</author>: <title level="a">Der größte Politiker aller Zeiten!</title>,in: <title level="j">Zeitschrift für die Geschichte der CSU</title> <date when-iso="2020">2020</date> <biblScope unit="volume">4</biblScope>.<biblScope unit="page">12-120</biblScope></bibl>
</note>
```

#### `<title>` – Kurztitel Bibliographie oder Archivalie

`<title type="short" key="ID">` Kurztitel, der auf eine ID in einer Bibliographie verweist. 

`<title type="shelf" key="ID">` Kurztitel, der auf eine Archivalie in einem Archiv verweist. Archiv wird durch ID identifiziert.

```XML
###
```



#### `<sound>` – Besonderheit Tonband SPD

Beschreibt ein nonverbales oder nicht verständliches ("Zwischenruf")  Geräusch in Sprechsituationen. Das Element wird ausschließlich für die SPD-Zwischenrufe etc. genutzt, die bisher in runden Klammern standen ("(Vereinzelter Beifall)"). Die runden Klammern sind dann unnötig, können bei der HTML- oder PDF-Darstellung aber leicht automatisch ergänzt werden. 

Das Element `<sound>` kann über das Attribut @type näher spezifiziert werden, z.B. könnte zwischen "Zwischenruf" ("interjection") und "Beifall"  ("applause") unterschieden werden. 

Beispiel:

```xml
<p>Wir werden in diesem Wahlkampf wirklich alles geben -
<sound type="applause">Starker Beifall.</sound>
   und dem Gegner keine Schwäche, keine 
    <sound type="interjection">Bravo!!</sound>
    einzige Schwäche zeigen!</p>

```



# Externe Register

## Personenregister - listPerson.xml

```xml
<text>
      <body>
         <listPerson>
            <!-- Identifikationsstring als xml-id. Das Attribut @role unterscheidet nur zwei Varianten "edition" für alle Personen, die in der Edition vorkommen. Und "staff" für alle Personen, die an der Edition mitgearbeitet haben.-->
            <person xml:id="BrandtW" role="edition">
               <!--   Das persName-Element enthält den Namen. Vor- und Nachname, nameLink Namenszusatz, ggf Adelsprädikat            -->
               <persName>
                  <!-- Das reg-Element ist noch ungewiss, eventuell kann man es nehmen, um eine Art normalisierten Namen anzuzeigen. Ansonsten kann man sagen, das sich der Name immer aus Nach-, Vorname und ev. roleName bei Adligen zusammensetzt. -->
                  <reg>Brandt, Willy</reg>
                  <forename>Willy</forename>
                  <surname>Brandt</surname>
                  <!-- addName enthält den Städtezusatz aus den Protokollen bei Namen mit Namensgleichheit. Frage: Städte gleich einklammern oder dies für die Transformation/Anzeige übrig lassen? -->
                  <addName type="town">Berlin</addName>
               </persName>

               <sex type="1">männlich</sex>
               <!-- Das @type-Attribut ist eigentlich nicht notwendig, erleichtert aber ev. die Sortierung später. -->

               <occupation from-iso="1949" to-iso="1992">Politiker (SPD)</occupation>
               <!-- Das Occupation-Element beschreibt die Funktion, die eine Person innerhalb der Edition hatte. Sie sollte sehr grundlegend und einfach sein, also Politiker,                        Industrieller etc. Oder eben auch Hilfskraft, EditorIn usf. Das muss noch standardisiert werden. Das Element sollte genutzt werden, um in bestimmten Ansichten ein Maus-Over zu erzeugen. -->

               <birth when="1913-12-18">1913 in <placeName ref="http://d-nb.info/gnd/4036483-5"
                     >Lübeck</placeName></birth>
               <death when="1992-10-08">1992 in <placeName ref="http://d-nb.info/gnd/4061836-5"
                     >Unkel</placeName></death>

               <affiliation type="Erwerbsarbeit">Journalist</affiliation>
               <affiliation type="Legislative">1949–1957 MdB (SPD); 1950–1966 Mitglied des Abgeordnetenhauses von Berlin (SPD); Oktober 1961–Dezember 1961 MdB (SPD);
1969–1992 MdB (SPD); 1983, 1987 und 1990 Alterspräsident des Deutschen
Bundestages. </affiliation>
               <affiliation type="Exekutive">1957–1966 Regierender Bürgermeister von Berlin; 1966–1969 Bundesminister des Auswärtigen u. Vizekanzler; 1969–1974 Bundeskanzler. 				</affiliation>
              <affiliation type="Partei">1954–1958 stellv. Landesvorsitzender der SPD Berlin; 1958–1962 Landesvorsitzender der SPD Berlin; 1962–1964 stellv. Bundesvorsitzender; 1964–1987 Bundesvorsitzender der SPD. 
                </affiliation>
               <affiliation type="Sonstiges">1976–1992 Präsident der Sozialistischen Internationale; 1987–1992 Ehrenvorsitzender der SPD. ~ (5) 1979–1983 MdEP.
                </affiliation>
              
               <!-- Das idno-Element enthält einen frei wählbaren Identifikator, der ein beliebiges Objekt, z. B. eine bibliografische Einheit, eine Person, einen Titel, eine Organisation, in standardisierter Weise identifiziert -->
               
           <idno type="WP">https://de.wikipedia.org/wiki/Willy_Brandt</idno>
            <idno type="GND">http://d-nb.info/gnd/11851444X</idno>
            <idno type="NDB"> https://www.deutschebiographie.de/pnd11851444X.html</idno>
  </person>
            
             
  <person xml:id="Barzel-R">
             Blabla
   </person>

<!-- all the same info for the editoring staff -->
  
   <person xml:id="StalmannBenita" role="staff">
        <sex type="0">weiblich</sex>
         <occupation from-iso="2017" to-iso="2019">
          <orgName ref="http://d-nb.info/gnd/2015995-X">KGParl</orgName> (Studentische	 			Hilfskraft)</occupation>
  <!-- Der orgName-Verweis könnte natürlich auch gleich auf die KGParl.de-Seite gehen.  -->
           <persName>
                  <reg>Stalmann, Benita</reg>
                  <forename>Benita</forename>
                  <surname>Stalmann</surname>
               </persName>
            </person>

    <person xml:id="HindenburgB" role="staff">
               <sex value="0">Weiblich</sex>
               <occupation from-iso="2019">
                  <orgName ref="http://d-nb.info/gnd/2015995-X">KGParl</orgName> (Wiss.
                  Mitarbeiterin) </occupation>
               <persName>
                  <roleName type="honorific" full="abb">Dr. phil.</roleName>
                  <forename>Barbara</forename>
                  <surname>Hindenburg</surname>
                  <roleName>von</roleName>
                  <surname type="birth">Wedding</surname>
               </persName>
               <idno type="GND">http://d-nb.info/gnd/1139395726</idno>

            </person>
         </listPerson>
      </body>
   </text>
```



# Versionierung 

Warum Versionierung?

Herangehensweise

