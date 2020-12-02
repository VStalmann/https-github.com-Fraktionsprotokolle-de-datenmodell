<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2">
<ns prefix="tei" uri="http://www.tei-c.org/ns/1.0"/>
	<!--Prüfungen im teiHeader-->
	<!--Angaben zur protokollierten Sitzung-->
	<!--Fraktionen-->
	<pattern id="fraktionen">
		<rule context="tei:idno[@type='Fraktion-Landesgruppe']">
			<assert test="text() = 'CDU/CSU'
				or text() = 'CDU'
				or text() = 'CSU'
				or text() = 'CSU-LG'
				or text() = 'SPD'
				or text() = 'FDP'
				or text() = 'Grüne'
				or text() = 'PDS'" role="ERROR">Fraktions-Landesgruppenname entspricht nicht den Vorgaben (Mögliche Werte: CDU/CSU; CSU-LG; SPD; FDP; Grüne; PDS)</assert>
		</rule>
	</pattern>
	<!--Wahlperioden-->
	<pattern id="wahlperioden">
		<rule context="tei:idno[@type='wp']">
			<assert test="text() = '01'
				or text() = '02'
				or text() = '03'
				or text() = '04'
				or text() = '05'
				or text() = '06'
				or text() = '07'
				or text() = '08'
				or text() = '09'
				or text() = '10'
				or text() = '11'
				or text() = '12'
				or text() = '13'
				or text() = '14'
				or text() = '15'" role="ERROR">Wahlperiode entspricht nicht den Vorgaben (Mögliche Werte: 01 bis 15)</assert>
		</rule>
	</pattern>
	<!--Fraktionen-Wahlperioden-Kombinationen-->
	<pattern id="wahlperioden-fraktionen-01-06-08-09">
		<rule context="tei:idno[@type='wp'][text() = '01' or text() = '02' or text() = '03' or text() = '04' or text() = '05' or text() = '06' or text() = '08' or text() = '09']">
			<assert test="following-sibling::tei:idno[@type='Fraktion-Landesgruppe'][text() = 'SPD' or text() = 'CDU/CSU' or text() = 'FDP' or text() = 'CSU-LG']" role="ERROR">Fraktion passt nicht in Wahlperiode</assert>
		</rule>
	</pattern>
	<pattern id="wahlperioden-fraktionen-07">
		<rule context="tei:idno[@type='wp'][text() = '07']">
			<assert test="following-sibling::tei:idno[@type='Fraktion-Landesgruppe'][text() = 'SPD' or text() = 'CDU/CSU' or text() = 'FDP' or text() = 'CSU-LG' or text() = 'CDU' or text() = 'CSU']" role="ERROR">Fraktion passt nicht in Wahlperiode</assert>
		</rule>
	</pattern>
	<pattern id="wahlperioden-fraktionen-10">
		<rule context="tei:idno[@type='wp'][text() = '10']">
			<assert test="following-sibling::tei:idno[@type='Fraktion-Landesgruppe'][text() = 'SPD' or text() = 'CDU/CSU' or text() = 'FDP' or text() = 'CSU-LG' or text() = 'CDU' or text() = 'CSU' or text() = 'Grüne']" role="ERROR">Fraktion passt nicht in Wahlperiode</assert>
		</rule>
	</pattern>
	<pattern id="wahlperioden-fraktionen-11-15">
		<rule context="tei:idno[@type='wp'][text() = '11' or text() = '12' or text() = '13' or text() = '14' or text() = '15']">
			<assert test="following-sibling::tei:idno[@type='Fraktion-Landesgruppe'][text() = 'SPD' or text() = 'CDU/CSU' or text() = 'FDP' or text() = 'CSU-LG' or text() = 'Grüne' or text() = 'PDS']" role="ERROR">Fraktion passt nicht in Wahlperiode</assert>
		</rule>
	</pattern>
	<!--Sitzungsabfolge-->
	<pattern id="sitzungsabfolge">
		<rule context="tei:idno[@type='sitzungsabfolge']">
			<assert test="text() = '1'
				or text() = '2'
				or text() = '3'
				or text() = '4'
				or text() = '5'" role="ERROR">Sitzungsabfolge entspricht nicht den Vorgaben (Mögliche Werte: 1-5)</assert>
		</rule>
	</pattern>
	<!--Angaben zur Archivalie-->
	<pattern id="institution">
		<rule context="tei:institution">
			<assert test="text() = 'Archiv der sozialen Demokratie (AdsD)' or text() = 'Archiv des Liberalismus (AdL)' or text() = 'Archiv für Christlich-Demokratische Politik (ACDP)' or text() = 'Archiv Grünes Gedächtnis (AGG)' or text() = 'Archiv für Christlich-Soziale Politik (ACSP)' or text() = 'Archiv Demokratischer Sozialismus (ADS)'" role="ERROR">Archivname nicht in der Liste</assert>
		</rule>
	</pattern>
<!--Textstruktur übergreifend-->
	<pattern id="div_orte">
		<rule context="tei:div">
			<report test=".[@type='Kopfdaten' or @type='SVListe' or @type='Anwesenheitsliste'][ancestor::tei:body]" role="ERROR">Typisches Front-Div (Kopfdaten, Anwesenheitsliste u.a.) steht unerwartet im Body</report>
			<report test=".[@type='SVP'][ancestor::tei:front]" role="ERROR">Typisches Body-Div (SVP u.a.) steht unerwartet im Front</report>
		</rule>
	</pattern>
	<pattern id="note">
		<rule context="tei:note[ancestor::tei:body]">
			<assert test=".[@xml:id]" role="ERROR">Notes im Protokoll selbst sollen xml:id tragen</assert>
		</rule>
	</pattern>
	<pattern id="Personennamen-im-Body">
		<rule context="tei:name[ancestor::tei:body][@type='Person']">
			<assert test=".[@role='Vorsitz' or @role='Sprecher' or @role='Erwaehnung']" role="ERROR">Name Person sollen über @role weiter spezifiziert werden</assert>
		</rule>
	</pattern>
	<!--Dateinamen-Referenzierungen-->
<!--	<pattern id="ref">
		<rule context="tei:persName[ancestor::tei:body]">
			<assert test="starts-with(@ref, '#')" role="ERROR">Wert in @ref soll mit # beginnen</assert>
		</rule>
	</pattern>-->
	<!--Incidents-->
	<pattern id="incident">
		<rule context="tei:incident">
			<assert test="tei:desc[@resp='#vorlage'
				or @resp='#srochow'
				or @resp='#vstalmann'
				or @resp='#sjuengerkes'
				or @resp='#bhindenburg'
				or @resp='#srabus'
				or @resp='#bwintgens'
				or @resp='#jwintzer'
				or @resp='#cdeitmer']" role="ERROR">Existiert eine Description innerhalb von Incident, soll für diese ein Autor, aus einer definierten Liste, angegeben werden</assert>
		</rule>
	</pattern>
	
	<!--Inhaltliche Warnungen -Vorschläge-->
	<pattern id="standardangaben-div-im-body">
		<rule context="tei:div[@type='SVP']">
			<!--<assert test="descendant::tei:name[@role='Sprecher']" role="ERROR">Pro div soll mind. ein Sprecher ausgewiesen sein</assert>-->
		</rule>
	</pattern>
</schema>
