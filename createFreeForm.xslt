<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="xml" />

	<xsl:template match="gaz">
		<xsl:text>
</xsl:text>
		<xsl:copy>
			<xsl:apply-templates />
		</xsl:copy>
		<xsl:text>
</xsl:text>
	</xsl:template>

	<xsl:template match="gaz/addr">
		<xsl:copy>
			<xsl:apply-templates />
		</xsl:copy>
	</xsl:template>

	<xsl:template match="gaz/addr/*[name()!='fields']">
		<xsl:copy>
			<xsl:apply-templates />
		</xsl:copy>
	</xsl:template>

	<xsl:template match="gaz/addr/fields">
		<xsl:copy>
			<xsl:if test="not(name)">
				<xsl:variable name="street" select="normalize-space(string-join((housenumber, street), ' '))" />
				<xsl:variable name="beforeName" select="normalize-space(unit)" />
				<xsl:variable name="afterName" select="normalize-space(string-join((housename, $street, parish, place, city, postcode), ','))" />
				<xsl:variable name="freeForm" select="normalize-space(string-join(($beforeName, $afterName), ','))" />
				<xsl:text>
			</xsl:text>
				<freeForm><xsl:value-of select="$freeForm"/></freeForm>
			</xsl:if>
			<xsl:apply-templates />
		</xsl:copy>
	</xsl:template>

	<xsl:template match="gaz/addr/fields/*[name()!='name']">
		<xsl:copy>
			<xsl:apply-templates />
		</xsl:copy>
	</xsl:template>

	<xsl:template match="gaz/addr/fields/name">
			<xsl:variable name="street" select="normalize-space(string-join((../housenumber, ../street), ' '))" />
			<xsl:variable name="beforeName" select="normalize-space(../unit)" />
			<xsl:variable name="afterName" select="normalize-space(string-join((../housename, $street, ../parish, ../place, ../city, ../postcode), ','))" />
			<xsl:variable name="freeForm" select="normalize-space(string-join(($beforeName, ., $afterName), ','))" />
			<freeForm><xsl:value-of select="$freeForm"/></freeForm>
			<xsl:text>
			</xsl:text>
			<xsl:copy>
				<xsl:if test="@alt='true'">
					<xsl:attribute name="alt">
						<xsl:value-of select="@alt" />
					</xsl:attribute>
				</xsl:if>
				<xsl:apply-templates />
			</xsl:copy>
	</xsl:template>

</xsl:stylesheet>
