<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2">
<ns prefix="tei" uri="http://www.tei-c.org/ns/1.0"/>
	<!--Prüfungen im teiHeader-->
	<!--Editoren-->
	<pattern id="Endredaktion">
		<rule context="tei:titleStmt/tei:respStmt[2]">
			<assert test="tei:name[@ref='#RochowSylvia'
				or @ref='#StalmannBenita'
				or @ref='#StalmannVolker'
				or @ref='#JuengerkesSven'
				or @ref='#HindenburgBarbara'
				or @ref='#RabusSimon'
				or @ref='#WeistenhoeferSimon'
				or @ref='#WintgensBenedikt'
				or @ref='#WintzerJoachim'
				or @ref='#DeitmerCarsten'
				or @ref='#LarratPhilippe']" role="ERROR">BearbeiterIn der Endredaktion angeben!</assert>
		</rule>
	</pattern>
</schema>
