<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2">
<ns prefix="tei" uri="http://www.tei-c.org/ns/1.0"/>
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
	<pattern id="Organisationsnamen-im-Body">
		<rule context="tei:name[ancestor::tei:body][@type='Organisation']">
			<assert test=".[@role='news' or @role='pol' or @role='com' or @role='soc']" role="ERROR">Name Organisation sollen über @role weiter spezifiziert werden</assert>
		</rule>
	</pattern>
	<!--Dateinamen-Referenzierungen-->
	<pattern id="ref">
		<rule context="tei:persName[ancestor::tei:body]">
			<assert test="starts-with(@ref, '#')" role="ERROR">Wert in @ref soll mit # beginnen</assert>
		</rule>
	</pattern>
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
