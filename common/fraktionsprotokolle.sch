<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2">
<ns prefix="tei" uri="http://www.tei-c.org/ns/1.0"/>
<!--Textstruktur übergreifend-->
	<pattern id="div_orte">
		<rule context="tei:div">
			<report test=".[@type='Kopfdaten' or @type='SVListe' or @type='Anwesenheitsliste'][ancestor::tei:body]" role="ERROR">Typisches Front-Div (Kopfdaten, Anwesenheitsliste u.a.) steht unerwartet in Body</report>
		</rule>
	</pattern>
</schema>
