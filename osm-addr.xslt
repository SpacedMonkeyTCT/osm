<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="osm">
		<xsl:text>
</xsl:text>
<gaz>
		<xsl:for-each select="node[tag]">
			<xsl:if test="tag[starts-with(@k,'addr:')]">
			<xsl:text>
	</xsl:text>
	<addr>
			<xsl:text>
		</xsl:text>
		<fields>
			<xsl:for-each select="tag">
				<xsl:choose>
					<xsl:when test="starts-with(@k,'addr:')">
						<xsl:text>
			</xsl:text>
						<xsl:text disable-output-escaping="yes">&lt;</xsl:text><xsl:value-of select="substring-after(@k,'addr:')"/><xsl:text disable-output-escaping="yes">&gt;</xsl:text>
						<xsl:value-of select="@v"/>
						<xsl:text disable-output-escaping="yes">&lt;/</xsl:text><xsl:value-of select="substring-after(@k,'addr:')"/><xsl:text disable-output-escaping="yes">&gt;</xsl:text>
					</xsl:when>
					<xsl:when test="@k='name'">
						<xsl:text>
			</xsl:text>
			<name><xsl:value-of select="@v"/></name>
					</xsl:when>
					<xsl:when test="@k='alt_name'">
						<xsl:text>
			</xsl:text>
			<name alt="true"><xsl:value-of select="@v"/></name>
					</xsl:when>
				</xsl:choose>
			</xsl:for-each>
			<xsl:text>
		</xsl:text>
		</fields>
			<xsl:for-each select="tag">
				<xsl:choose>
					<xsl:when test="starts-with(@k,'addr:')">
					</xsl:when>
					<xsl:when test="@k='name'">
					</xsl:when>
					<xsl:when test="@k='alt_name'">
					</xsl:when>
					<xsl:when test="contains(@k,':')">
						<xsl:variable name="sans-ns" select="replace(@k, ':', '-')" />
						<xsl:text>
		</xsl:text>
						<xsl:text disable-output-escaping="yes">&lt;</xsl:text><xsl:value-of select="$sans-ns"/><xsl:text disable-output-escaping="yes">&gt;</xsl:text>
						<xsl:value-of select="@v"/>
						<xsl:text disable-output-escaping="yes">&lt;/</xsl:text><xsl:value-of select="$sans-ns"/><xsl:text disable-output-escaping="yes">&gt;</xsl:text>
					</xsl:when>
					<xsl:otherwise>
						<xsl:text>
		</xsl:text>
						<xsl:text disable-output-escaping="yes">&lt;</xsl:text><xsl:value-of select="@k"/><xsl:text disable-output-escaping="yes">&gt;</xsl:text>
						<xsl:value-of select="@v"/>
						<xsl:text disable-output-escaping="yes">&lt;/</xsl:text><xsl:value-of select="@k"/><xsl:text disable-output-escaping="yes">&gt;</xsl:text>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:for-each>
			<xsl:text>
	</xsl:text>
	</addr>
		</xsl:if>
	</xsl:for-each>
	<xsl:text>
</xsl:text>
</gaz>
	<xsl:text>
</xsl:text>
	</xsl:template>
</xsl:stylesheet>
