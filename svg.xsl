<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:svg="http://www.w3.org/2000/svg" xmlns="http://www.w3.org/2000/svg" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="xml" encoding="UTF-8" indent="yes"/>

  <xsl:template match="node()|@*">
    <xsl:copy>
      <xsl:apply-templates select="node()|@*"/>
    </xsl:copy>
  </xsl:template>

  <xsl:template match="svg:include">
    <xsl:variable name="x" select="@id"/>
    <xsl:text>  ["</xsl:text>
    <xsl:value-of select="substring($x,2)"/>
    <xsl:text>", [[</xsl:text>
    <xsl:for-each select="document('harn-data.xml')//div[@id=$x]/p[em='Attributes:']/span">
      <xsl:if test="position() != 1">
        <xsl:text>,</xsl:text>
      </xsl:if>
      <xsl:value-of select="concat('&quot;$',.,'&quot;')"/>
    </xsl:for-each>
    <xsl:text>], [</xsl:text>
    <xsl:for-each select="document('harn-data.xml')//div[@id=$x]/p[em='Sunsign:']/span[position() mod 2 = 1]">
      <xsl:if test="position() != 1">
        <xsl:text>,</xsl:text>
      </xsl:if>
      <xsl:value-of select="concat('[&quot;',substring(.,1,3),'&quot;,',./following-sibling::span,']')"/>
    </xsl:for-each>
    <xsl:text>], </xsl:text>
    <xsl:value-of select="normalize-space(document('harn-data.xml')//div[@id=$x]/p[em='OML:']/text()[2])"/>
    <xsl:text>]],</xsl:text>
  </xsl:template>

</xsl:stylesheet>